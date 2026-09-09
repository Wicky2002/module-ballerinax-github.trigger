// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# Configuration for the webhook listener, including the secret used to verify incoming requests.
public type ListenerConfig record {
    # Webhook Secret
    string webhookSecret?;
};

# A GitHub App
public type App record {
    int id;
    string node_id;
    User owner?;
    string name;
    string? description?;
    string external_url?;
    string html_url?;
    string created_at?;
    string updated_at?;
    map<json> permissions?;
    string[] events?;
};

# Payload for fork events
public type ForkPayload record {
    # The created (forked) repository
    Repository forkee;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for workflow_run events
public type WorkflowRunPayload record {
    string action;
    WorkflowRun workflow_run;
    # The workflow that is being run
    Workflow? workflow;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for gollum (wiki) events
public type GollumPayload record {
    # The pages that were updated
    PagesItem[] pages;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type PagesItem record {
    # The name of the page
    string page_name;
    # The current page title
    string title;
    # A summary of the changes
    string? summary?;
    string action;
    # The latest commit SHA of the page
    string sha;
    string html_url;
};

# Payload for release events
public type ReleasePayload record {
    # The action that was performed
    string action;
    Release release;
    # For edited events, the changes to the release
    Changes changes?;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type Body record {
    string 'from?;
};

public type Name record {
    string 'from?;
};

public type TagName record {
    string 'from?;
};

# Whether this release was explicitly edited to be the latest
public type MakeLatest record {
    boolean to?;
};

# For edited events, the changes to the release
public type Changes record {
    Body body?;
    Name name?;
    TagName tag_name?;
    # Whether this release was explicitly edited to be the latest
    MakeLatest make_latest?;
};

# The GitHub Marketplace purchase
public type MarketplacePurchase record {
    Account account;
    string billing_cycle;
    int unit_count;
    boolean on_free_trial?;
    string? free_trial_ends_on?;
    string? next_billing_date?;
    Plan plan;
};

public type Account record {
    string 'type;
    int id;
    string node_id?;
    string login;
    string? organization_billing_email?;
};

public type Plan record {
    int id;
    string name;
    string description;
    int monthly_price_in_cents;
    int yearly_price_in_cents;
    string price_model;
    boolean has_free_trial?;
    string? unit_name?;
    string[] bullets?;
};

# Payload for secret_scanning_alert_location events
public type SecretScanningAlertLocationPayload record {
    # The existing secret scanning alert the location was added to
    Alert alert;
    # The location where the secret was found
    Location location;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# The existing secret scanning alert the location was added to
public type Alert record {
    int number;
    string secret_type;
};

# Location details; shape varies by type
public type Details record {
    string path?;
    int start_line?;
    int end_line?;
    int start_column?;
    int end_column?;
    string blob_sha?;
    string blob_url?;
    string commit_sha?;
    string commit_url?;
};

# The location where the secret was found
public type Location record {
    string 'type;
    # Location details; shape varies by type
    Details details?;
};

# Payload for deployment_review events
public type DeploymentReviewPayload record {
    string action;
    # The name of the environment that was approved or rejected
    string environment;
    # The reviewer's comment (for approved/rejected)
    string? comment?;
    # ISO 8601 date of when the review was requested
    string? since;
    # The reviewers who were requested or who reviewed
    ReviewersItem[] reviewers?;
    # The workflow run associated with the deployment
    DeploymentReviewPayloadWorkflowRun workflow_run;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Team reviewer
public type 'ReviewerBranch1 record {
    int id?;
    string node_id?;
    string name?;
    string slug?;
    string? description?;
    string privacy?;
    string permission?;
    string html_url?;
};

# A User or Team object depending on type
public type Reviewer anydata|'ReviewerBranch1;

public type ReviewersItem record {
    string 'type?;
    # A User or Team object depending on type
    Reviewer reviewer?;
};

# The workflow run associated with the deployment
public type DeploymentReviewPayloadWorkflowRun record {
    int id;
    string? name;
    string head_sha?;
    string? head_branch?;
    int run_number?;
    string status?;
    string? conclusion?;
    string html_url?;
    PullRequestMinimal[] pull_requests?;
};

# A pull request
public type PullRequest record {
    int id;
    string node_id?;
    string url?;
    string html_url?;
    string diff_url?;
    string patch_url?;
    int number;
    string state;
    boolean locked?;
    string title;
    string? body?;
    User user?;
    Label[] labels?;
    User? assignee?;
    User[] assignees?;
    Milestone milestone?;
    PullRequestRef head?;
    PullRequestRef base?;
    boolean draft?;
    boolean? merged?;
    boolean? mergeable?;
    boolean? rebaseable?;
    string mergeable_state?;
    string? merge_commit_sha?;
    int comments?;
    int review_comments?;
    int commits?;
    int additions?;
    int deletions?;
    int changed_files?;
    string created_at?;
    string updated_at?;
    string? closed_at?;
    string? merged_at?;
    User? merged_by?;
    string author_association?;
    # Details of an auto-merge request, if one is enabled on this pull request
    AutoMerge? auto_merge?;
};

# Details of an auto-merge request, if one is enabled on this pull request
public type AutoMerge record {
    User enabled_by?;
    string merge_method?;
    string commit_title?;
    string commit_message?;
};

# Payload for secret_scanning_scan events. No action field.
public type SecretScanningScanPayload record {
    # What type of scan was completed
    string 'type;
    # What type of content was scanned
    string 'source;
    # ISO 8601 timestamp when the scan started
    string started_at;
    # ISO 8601 timestamp when the scan completed
    string completed_at;
    # Patterns updated. Empty for normal backfill or custom pattern scans.
    string[]? secret_types?;
    # If triggered by a custom pattern update, the name of that pattern
    string? custom_pattern_name?;
    # If triggered by a custom pattern update, the scope of that pattern
    string? custom_pattern_scope?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for issue_comment events
public type IssueCommentPayload record {
    string action;
    Issue issue;
    IssueComment comment;
    # For edited events, the changes to the comment
    IssueCommentPayloadChanges changes?;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type IssueCommentPayloadBody record {
    string 'from?;
};

# For edited events, the changes to the comment
public type IssueCommentPayloadChanges record {
    IssueCommentPayloadBody body;
};

# Payload for deployment_status events
public type DeploymentStatusPayload record {
    string action;
    Deployment deployment;
    DeploymentStatus deployment_status;
    CheckRun? check_run?;
    Workflow? workflow?;
    WorkflowRun? workflow_run?;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for organization events
public type OrganizationPayload record {
    string action;
    # The membership between the user and the organization.
    # Not present when the action is member_invited.
    Membership? membership?;
    # Present when action is member_invited
    Invitation? invitation?;
    # For renamed events, the old and new organization name
    OrganizationPayloadChanges? changes?;
    User sender?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# The membership between the user and the organization.
# Not present when the action is member_invited.
public type Membership record {
    string url?;
    string state?;
    string role?;
    string organization_url?;
    User user?;
};

# Present when action is member_invited
public type Invitation record {
    int id;
    string? login?;
    string? email?;
    string role;
    string created_at;
    string? failed_at?;
    string? failed_reason?;
    User inviter;
    int team_count;
    string node_id;
    string invitation_teams_url;
    string? invitation_source?;
};

public type Login record {
    string 'from?;
};

# For renamed events, the old and new organization name
public type OrganizationPayloadChanges record {
    Login login?;
};

public type WebhookHeaders record {
    # The name of the event that triggered the delivery
    @http:Header {name: "X-GitHub-Event"}
    string xGitHubEvent;
    # A globally unique identifier (GUID) for this delivery
    @http:Header {name: "X-GitHub-Delivery"}
    string xGitHubDelivery;
    # The unique identifier of the webhook
    @http:Header {name: "X-GitHub-Hook-ID"}
    int xGitHubHookID;
    # The unique identifier of the resource where the webhook was created
    @http:Header {name: "X-GitHub-Hook-Installation-Target-ID"}
    int xGitHubHookInstallationTargetID?;
    # The type of resource where the webhook was created
    @http:Header {name: "X-GitHub-Hook-Installation-Target-Type"}
    string xGitHubHookInstallationTargetType?;
    # HMAC hex digest of the request body using SHA-1. Sent only when a
    # webhook secret is configured. Use X-Hub-Signature-256 instead.
    @http:Header {name: "X-Hub-Signature"}
    string xHubSignature?;
    # HMAC hex digest of the request body using SHA-256. Sent only when
    # a webhook secret is configured. Preferred over X-Hub-Signature.
    @http:Header {name: "X-Hub-Signature-256"}
    string xHubSignature256?;
    # Always has the prefix GitHub-Hookshot/
    @http:Header {name: "User-Agent"}
    string userAgent?;
};

# Payload for repository_dispatch events. The action field matches the
# event_type provided in the POST /repos/{owner}/{repo}/dispatches request.
public type RepositoryDispatchPayload record {
    # The event_type specified in the dispatch request body
    string action;
    # The branch from which the dispatch was triggered
    string branch;
    # The client_payload from the dispatch request body
    map<json>? client_payload;
    Installation installation?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Enterprise enterprise?;
};

# Payload for merge_group events
public type MergeGroupPayload record {
    string action;
    # A group of pull requests grouped together by the merge queue
    MergeGroup merge_group;
    # For destroyed action, the reason the merge group was destroyed
    string? reason?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# A group of pull requests grouped together by the merge queue
public type MergeGroup record {
    # The SHA of the merge group's head commit
    string head_sha;
    # The full ref of the merge group targeting branch
    string head_ref;
    # The SHA of the merge group's base branch
    string base_sha;
    # The full ref of the branch being merged into
    string base_ref;
    Commit head_commit?;
};

# Payload for workflow_job events
public type WorkflowJobPayload record {
    string action;
    WorkflowJob workflow_job;
    # The deployment associated with the workflow job (if applicable)
    Deployment deployment?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for org_block events
public type OrgBlockPayload record {
    string action;
    User? blocked_user;
    User sender?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# A GitHub Sponsors tier
public type Tier record {
    string node_id;
    string created_at?;
    string description?;
    int monthly_price_in_cents;
    int monthly_price_in_dollars;
    string name;
    boolean is_one_time?;
    boolean is_custom_amount?;
};

# Payload for dependabot_alert events
public type DependabotAlertPayload record {
    string action;
    # A Dependabot alert
    DependabotAlertPayloadAlert alert;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type Dependency record {
    Package package?;
    string manifest_path?;
    string? scope?;
};

public type SecurityAdvisory record {
    string ghsa_id?;
    string? cve_id?;
    string summary?;
    string description?;
    string severity?;
    SecurityVulnerability[] vulnerabilities?;
};

# A Dependabot alert
public type DependabotAlertPayloadAlert record {
    int number;
    string state;
    Dependency dependency?;
    SecurityAdvisory security_advisory?;
    SecurityVulnerability security_vulnerability?;
    string url?;
    string html_url?;
    string created_at?;
    string updated_at?;
    string? dismissed_at?;
    User? dismissed_by?;
    string? dismissed_reason?;
    string? dismissed_comment?;
    string? fixed_at?;
    string? auto_dismissed_at?;
    User[] assignees?;
};

# A GitHub Actions workflow
public type Workflow record {
    int id?;
    string node_id?;
    string name?;
    string path?;
    string state?;
    string created_at?;
    string updated_at?;
    string url?;
    string html_url?;
    string badge_url?;
};

# An actor allowed to dismiss pull request reviews
public type RuleActor record {
    int id;
    string 'type;
};

# Payload for custom_property_values events
public type CustomPropertyValuesPayload record {
    string action;
    # The new custom property values for the repository
    NewPropertyValuesItem[] new_property_values;
    # The old custom property values for the repository
    OldPropertyValuesItem[] old_property_values;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type NewPropertyValuesItem record {
    string property_name;
    # String or array of strings
    anydata? value?;
};

public type OldPropertyValuesItem record {
    string property_name;
    # String or array of strings
    anydata? value?;
};

# Payload for secret_scanning_alert events
public type SecretScanningAlertPayload record {
    string action;
    # The secret scanning alert
    SecretScanningAlertPayloadAlert alert;
    # Present on assigned/unassigned actions
    User? assignee?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# The secret scanning alert
public type SecretScanningAlertPayloadAlert record {
    int number;
    string created_at?;
    string? updated_at?;
    string url?;
    string html_url?;
    string locations_url?;
    string state;
    string? resolution?;
    string? resolved_at?;
    User? resolved_by?;
    string? resolution_comment?;
    # The type of secret that was detected
    string secret_type?;
    string secret_type_display_name?;
    string validity?;
    boolean publicly_leaked?;
    boolean multi_repo?;
    boolean? push_protection_bypassed?;
    User? push_protection_bypassed_by?;
    string? push_protection_bypassed_at?;
};

# Payload for pull_request_review_thread events
public type PullRequestReviewThreadPayload record {
    string action;
    PullRequest pull_request;
    # The review thread that was resolved or unresolved
    PullRequestReviewThreadPayloadThread thread;
    string? updated_at?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# The review thread that was resolved or unresolved
public type PullRequestReviewThreadPayloadThread record {
    string node_id?;
    PullRequestReviewComment[] comments?;
};

# A workflow that must run for this rule to pass
public type RuleWorkflowFileReference record {
    string path;
    string ref?;
    int repository_id;
    string sha?;
};

# Specify people, teams, or apps allowed to dismiss pull request reviews.
public type RuleDismissalRestriction record {
    RuleActor[] allowed_actors?;
    boolean enabled;
};

# A comment on an issue or pull request
public type IssueComment record {
    int id;
    string node_id?;
    string url?;
    string html_url?;
    string body;
    User user?;
    string created_at?;
    string updated_at?;
    string author_association?;
};

# Shared by the 5 pattern-matching ruleset rules (commit_message_pattern,
# commit_author_email_pattern, committer_email_pattern, branch_name_pattern,
# tag_name_pattern) - identical parameters shape for all five per GitHub's own schema.
public type RulePatternParameters record {
    string name?;
    boolean negate?;
    string operator;
    string pattern;
};

# Payload for registry_package events (legacy GitHub Packages event)
public type RegistryPackagePayload record {
    string action;
    # The registry package object
    RegistryPackage registry_package;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type PackageFilesItem record {
    string download_url?;
    int id?;
    string name?;
    string 'sha256?;
    string content_type?;
    int size?;
    string created_at?;
    string updated_at?;
};

public type PackageVersion record {
    int id?;
    string 'version?;
    string summary?;
    string html_url?;
    string target_commitish?;
    string target_oid?;
    boolean draft?;
    boolean prerelease?;
    string created_at?;
    string updated_at?;
    PackageFilesItem[] package_files?;
    User author?;
    string? installation_command?;
};

public type Registry record {
    string about_url?;
    string name?;
    string 'type?;
    string url?;
    string vendor?;
};

# The registry package object
public type RegistryPackage record {
    int id;
    string name;
    string namespace?;
    string? description?;
    string ecosystem?;
    string package_type;
    string html_url?;
    string created_at?;
    string updated_at?;
    User owner?;
    PackageVersion? package_version?;
    Registry? registry?;
};

# The ecosystem and name identifying a Dependabot-tracked package
public type Package record {
    string ecosystem?;
    string name?;
};

# Payload for check_suite events
public type CheckSuitePayload record {
    string action;
    CheckSuite check_suite;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for discussion_comment events
public type DiscussionCommentPayload record {
    string action;
    # The discussion comment
    Comment comment;
    Discussion discussion;
    # For edited events, the changes to the comment
    DiscussionCommentPayloadChanges changes?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# The discussion comment
public type Comment record {
    int id?;
    string node_id?;
    string html_url?;
    string body?;
    User user?;
    string created_at?;
    string updated_at?;
    string author_association?;
};

public type DiscussionCommentPayloadBody record {
    string 'from?;
};

# For edited events, the changes to the comment
public type DiscussionCommentPayloadChanges record {
    DiscussionCommentPayloadBody body?;
};

# A GitHub organization
public type Organization record {
    string login?;
    int id?;
    string node_id?;
    string url?;
    string html_url?;
    string repos_url?;
    string avatar_url?;
    string? description?;
};

# Payload for repository_import events. Fired when a repository import
# finishes on GitHub.com. No action field.
public type RepositoryImportPayload record {
    # The final status of the import
    string status;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
};

# Payload for repository events
public type RepositoryPayload record {
    string action;
    # For edited/renamed/transferred events, the changes that occurred
    RepositoryPayloadChanges changes?;
    Repository repository?;
    User sender?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type Description record {
    string? 'from?;
};

public type Homepage record {
    string? 'from?;
};

public type Topics record {
    string[] 'from?;
};

public type DefaultBranch record {
    string 'from?;
};

public type RepositoryPayloadName record {
    string 'from?;
};

# Present for a renamed event
public type RepositoryPayloadRepository record {
    RepositoryPayloadName name?;
};

public type 'from record {
    User user?;
    Organization organization?;
};

# Present for a transferred event
public type Owner record {
    'from 'from?;
};

# For edited/renamed/transferred events, the changes that occurred
public type RepositoryPayloadChanges record {
    Description description?;
    Homepage homepage?;
    Topics topics?;
    DefaultBranch default_branch?;
    # Present for a renamed event
    RepositoryPayloadRepository repository?;
    # Present for a transferred event
    Owner owner?;
};

# Payload for star events
public type StarPayload record {
    string action;
    # The time the star was created (ISO 8601). Null for the deleted action.
    string? starred_at;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# A vulnerable version range affecting a package, and the version it was patched in
public type SecurityVulnerability record {
    Package package?;
    string severity?;
    string vulnerable_version_range?;
    FirstPatchedVersion? first_patched_version?;
};

public type FirstPatchedVersion record {
    string identifier?;
};

# Payload for watch events (someone started watching the repository)
public type WatchPayload record {
    string action;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for package events (GitHub Packages)
public type PackagePayload record {
    string action;
    # Information about the package
    PackagePayloadPackage package;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# A reduced Release shape as delivered on a package version, not the full
# Release resource (missing node_id, assets_url, upload_url, body, assets) -
# must not $ref Release.
public type PackagePayloadRelease record {
    string url?;
    string html_url?;
    int id?;
    string tag_name?;
    string target_commitish?;
    string? name?;
    boolean draft?;
    User author?;
    boolean prerelease?;
    string created_at?;
    string? published_at?;
};

public type Tag record {
    string digest?;
    string name?;
};

# Metadata for a container (Docker) package version
public type ContainerMetadata record {
    Tag tag?;
    # Untyped even in GitHub's own webhook schema - genuinely open, not incomplete.
    map<json>? labels?;
    # Untyped even in GitHub's own webhook schema - genuinely open, not incomplete.
    map<json>? manifest?;
};

public type NpmMetadata record {
    string name?;
    string 'version?;
    string npm_user?;
    map<json>? author?;
    map<json>? bugs?;
    map<json> dependencies?;
    map<json> dev_dependencies?;
    map<json> peer_dependencies?;
    map<json> optional_dependencies?;
    string description?;
    map<json>? dist?;
    string git_head?;
    string homepage?;
    string license?;
    string main?;
    map<json>? repository?;
    map<json> scripts?;
    string id?;
    string node_version?;
    string npm_version?;
    boolean has_shrinkwrap?;
    map<json>[] maintainers?;
    map<json>[] contributors?;
    map<json> engines?;
    string[] keywords?;
    string[] files?;
    map<json> bin?;
    map<json> man?;
    map<json>? directories?;
    string[] os?;
    string[] cpu?;
    string readme?;
    string installation_command?;
    int release_id?;
    string commit_oid?;
    boolean published_via_actions?;
    int deleted_by_id?;
};

public type NugetMetadataItem record {
    # Real payloads may send this as either an integer or a string
    string id?;
    string name?;
    # Real payloads may send this as a boolean, string, integer, or an object
    # with url/branch/commit/type fields - kept as string here since AsyncAPI
    # schemas have no first-class "any of these primitive types" construct;
    # the object variant's fields are lost by this simplification.
    string value?;
};

public type VersionInfo record {
    string 'version?;
};

public type RubygemsMetadataItem record {
    string name?;
    string description?;
    string readme?;
    string homepage?;
    VersionInfo version_info?;
    string platform?;
    map<json> metadata?;
    string repo?;
    map<json>[] dependencies?;
    string commit_oid?;
};

# A single downloadable file within a published package version
public type PackagePayloadPackageFilesItem record {
    string download_url?;
    int id?;
    string name?;
    string 'sha256?;
    string 'sha1?;
    string 'md5?;
    string content_type?;
    string state?;
    int size?;
    string created_at?;
    string updated_at?;
};

public type PackagePayloadPackageVersion record {
    int id?;
    string 'version?;
    string? summary?;
    string name?;
    string? description?;
    string? body?;
    string? body_html?;
    # A reduced Release shape as delivered on a package version, not the full
    # Release resource (missing node_id, assets_url, upload_url, body, assets) -
    # must not $ref Release.
    PackagePayloadRelease? release?;
    string? manifest?;
    string html_url?;
    string? tag_name?;
    string target_commitish?;
    string target_oid?;
    boolean draft?;
    boolean prerelease?;
    string created_at?;
    string updated_at?;
    # Genuinely arbitrary per GitHub's own webhook schema - each entry declares no
    # fixed shape (additionalProperties: true, no properties), confirmed via
    # github/rest-api-description's webhook-package-published schema.
    map<json>[] metadata?;
    # Metadata for a container (Docker) package version
    ContainerMetadata? container_metadata?;
    NpmMetadata? npm_metadata?;
    NugetMetadataItem[]? nuget_metadata?;
    RubygemsMetadataItem[]? rubygems_metadata?;
    PackagePayloadPackageFilesItem[] package_files?;
    string? package_url?;
    User author?;
    string? source_url?;
    string? installation_command?;
};

public type PackagePayloadRegistry record {
    string about_url?;
    string name?;
    string 'type?;
    string url?;
    string vendor?;
};

# Information about the package
public type PackagePayloadPackage record {
    int id;
    string name;
    string namespace?;
    string? description?;
    string ecosystem?;
    string package_type?;
    string html_url?;
    string created_at?;
    string updated_at?;
    User owner?;
    PackagePayloadPackageVersion? package_version?;
    PackagePayloadRegistry? registry?;
};

# Payload for workflow_dispatch events (manually triggered workflows)
public type WorkflowDispatchPayload record {
    # The inputs provided when manually triggering the workflow
    map<json>? inputs?;
    # The branch or tag ref from which the workflow was triggered
    string ref;
    # The path to the workflow file (e.g. .github/workflows/main.yml)
    string workflow;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# A tool that must provide code scanning results for this rule to pass.
public type RuleCodeScanningTool record {
    string alerts_threshold;
    string security_alerts_threshold;
    string tool;
};

# Payload for sponsorship events
public type SponsorshipPayload record {
    string action;
    # The sponsorship object
    Sponsorship sponsorship;
    # For edited, tier_changed, and pending_tier_change events
    SponsorshipPayloadChanges? changes?;
    # For pending_cancellation and pending_tier_change, the date the
    # change takes effect (ISO 8601 date).
    string? effective_date?;
    User sender?;
    Organization organization?;
    Installation installation?;
};

# The sponsorship object
public type Sponsorship record {
    string node_id;
    string created_at;
    string privacy_level;
    Tier tier;
    User sponsor;
    User sponsorable;
};

public type SponsorshipPayloadTier record {
    Tier 'from?;
};

public type PrivacyLevel record {
    string 'from?;
};

# For edited, tier_changed, and pending_tier_change events
public type SponsorshipPayloadChanges record {
    SponsorshipPayloadTier tier?;
    PrivacyLevel privacy_level?;
};

# Payload for sub_issues events
public type SubIssuesPayload record {
    string action;
    # The ID of the parent issue.
    int parent_issue_id;
    # The parent issue.
    Issue parent_issue;
    # The repository of the parent issue.
    Repository parent_issue_repo;
    # The ID of the sub-issue.
    int sub_issue_id;
    # The sub-issue.
    Issue sub_issue;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for project_column events (classic project columns).
# Note: classic Projects are deprecated; use projects_v2 instead.
public type ProjectColumnPayload record {
    string action;
    # A column in a classic project board
    ProjectColumn project_column;
    # For edited events, the changes made to the column
    ProjectColumnPayloadChanges? changes?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# A column in a classic project board
public type ProjectColumn record {
    int id;
    string node_id;
    string url?;
    string project_url?;
    string cards_url?;
    string name;
    # The ID of the column this column was moved after
    int? after_id?;
    string created_at?;
    string updated_at?;
};

public type ProjectColumnPayloadName record {
    string 'from?;
};

# For edited events, the changes made to the column
public type ProjectColumnPayloadChanges record {
    ProjectColumnPayloadName name?;
};

# A GitHub organization team
public type Team record {
    int id;
    string node_id?;
    string name;
    string slug;
    string? description?;
    string privacy?;
    string notification_setting?;
    string permission?;
    string url?;
    string html_url?;
    string members_url?;
    string repositories_url?;
    # A reduced "team-simple" shape, not a full Team - no nested parent (a team's parent
    # is never itself nested further, avoiding unbounded recursion).
    Parent? parent?;
};

# A reduced "team-simple" shape, not a full Team - no nested parent (a team's parent
# is never itself nested further, avoiding unbounded recursion).
public type Parent record {
    int id;
    string node_id;
    string url?;
    string members_url?;
    string name;
    string? description?;
    string permission?;
    string privacy?;
    string notification_setting?;
    string html_url?;
    string repositories_url?;
    string slug;
    string 'type;
    int organization_id?;
    int enterprise_id?;
};

# Payload for marketplace_purchase events
public type MarketplacePurchasePayload record {
    string action;
    MarketplacePurchase marketplace_purchase;
    # The previous purchase state (for changed/pending_change events)
    MarketplacePurchase? previous_marketplace_purchase?;
    # ISO 8601 date when the change takes effect
    string effective_date;
    User sender;
    Installation installation?;
};

# Payload for the push event
public type PushPayload record {
    # The full git ref that was pushed (e.g. refs/heads/main or refs/tags/v3.14.1)
    string ref;
    # The SHA of the most recent commit on ref before the push
    string before;
    # The SHA of the most recent commit on ref after the push
    string after;
    # The base ref for the push (if applicable)
    string? base_ref?;
    # Whether this push created the ref
    boolean created;
    # Whether this push deleted the ref
    boolean deleted;
    # Whether this push was a force push of the ref
    boolean forced;
    # URL showing the changes in this ref update
    string compare;
    # Array of commit objects (maximum 2048)
    Commit[] commits;
    Commit? head_commit?;
    # Metaproperties for the Git author/committer
    CommitAuthor pusher;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# A GitHub App installation
public type Installation record {
    int id?;
    string node_id?;
};

# Payload for branch_protection_rule events
public type BranchProtectionRulePayload record {
    string action;
    # The branch protection rule. Includes name and all branch protection
    # settings applied to matching branches. Binary settings are boolean;
    # multi-level configs are off, non_admins, or everyone; actor and
    # build lists are arrays of strings.
    Rule rule;
    # For edited events, the changes to the rule - one entry per changed setting, each wrapped in "from"
    BranchProtectionRulePayloadChanges changes?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# The branch protection rule. Includes name and all branch protection
# settings applied to matching branches. Binary settings are boolean;
# multi-level configs are off, non_admins, or everyone; actor and
# build lists are arrays of strings.
public type Rule record {
    int id?;
    int repository_id?;
    string name?;
    string created_at?;
    string updated_at?;
    string pull_request_reviews_enforcement_level?;
    int required_approving_review_count?;
    boolean dismiss_stale_reviews_on_push?;
    boolean require_code_owner_review?;
    boolean authorized_dismissal_actors_only?;
    boolean ignore_approvals_from_contributors?;
    boolean require_last_push_approval?;
    string[] required_status_checks?;
    string required_status_checks_enforcement_level?;
    boolean strict_required_status_checks_policy?;
    string signature_requirement_enforcement_level?;
    string linear_history_requirement_enforcement_level?;
    boolean admin_enforced?;
    string allow_force_pushes_enforcement_level?;
    string allow_deletions_enforcement_level?;
    string merge_queue_enforcement_level?;
    string required_deployments_enforcement_level?;
    string required_conversation_resolution_level?;
    boolean authorized_actors_only?;
    string[] authorized_actor_names?;
};

public type PullRequestReviewsEnforcementLevel record {
    string 'from?;
};

public type RequiredApprovingReviewCount record {
    int 'from?;
};

public type DismissStaleReviewsOnPush record {
    boolean 'from?;
};

public type RequireCodeOwnerReview record {
    boolean 'from?;
};

public type AuthorizedDismissalActorsOnly record {
    boolean 'from?;
};

public type IgnoreApprovalsFromContributors record {
    boolean 'from?;
};

public type RequireLastPushApproval record {
    boolean 'from?;
};

public type RequiredStatusChecks record {
    string[] 'from?;
};

public type RequiredStatusChecksEnforcementLevel record {
    string 'from?;
};

public type StrictRequiredStatusChecksPolicy record {
    boolean 'from?;
};

public type SignatureRequirementEnforcementLevel record {
    string 'from?;
};

public type LinearHistoryRequirementEnforcementLevel record {
    string 'from?;
};

public type AdminEnforced record {
    boolean 'from?;
};

public type AllowForcePushesEnforcementLevel record {
    string 'from?;
};

public type AllowDeletionsEnforcementLevel record {
    string 'from?;
};

public type MergeQueueEnforcementLevel record {
    string 'from?;
};

public type RequiredDeploymentsEnforcementLevel record {
    string 'from?;
};

public type RequiredConversationResolutionLevel record {
    string 'from?;
};

public type AuthorizedActorsOnly record {
    boolean 'from?;
};

public type AuthorizedActorNames record {
    string[] 'from?;
};

# For edited events, the changes to the rule - one entry per changed setting, each wrapped in "from"
public type BranchProtectionRulePayloadChanges record {
    PullRequestReviewsEnforcementLevel pull_request_reviews_enforcement_level?;
    RequiredApprovingReviewCount required_approving_review_count?;
    DismissStaleReviewsOnPush dismiss_stale_reviews_on_push?;
    RequireCodeOwnerReview require_code_owner_review?;
    AuthorizedDismissalActorsOnly authorized_dismissal_actors_only?;
    IgnoreApprovalsFromContributors ignore_approvals_from_contributors?;
    RequireLastPushApproval require_last_push_approval?;
    RequiredStatusChecks required_status_checks?;
    RequiredStatusChecksEnforcementLevel required_status_checks_enforcement_level?;
    StrictRequiredStatusChecksPolicy strict_required_status_checks_policy?;
    SignatureRequirementEnforcementLevel signature_requirement_enforcement_level?;
    LinearHistoryRequirementEnforcementLevel linear_history_requirement_enforcement_level?;
    AdminEnforced admin_enforced?;
    AllowForcePushesEnforcementLevel allow_force_pushes_enforcement_level?;
    AllowDeletionsEnforcementLevel allow_deletions_enforcement_level?;
    MergeQueueEnforcementLevel merge_queue_enforcement_level?;
    RequiredDeploymentsEnforcementLevel required_deployments_enforcement_level?;
    RequiredConversationResolutionLevel required_conversation_resolution_level?;
    AuthorizedActorsOnly authorized_actors_only?;
    AuthorizedActorNames authorized_actor_names?;
};

# Payload for pull_request_review_comment events
public type PullRequestReviewCommentPayload record {
    string action;
    PullRequestReviewComment comment;
    PullRequest pull_request;
    # For edited events, the changes to the comment
    PullRequestReviewCommentPayloadChanges changes?;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type PullRequestReviewCommentPayloadBody record {
    string 'from?;
};

# For edited events, the changes to the comment
public type PullRequestReviewCommentPayloadChanges record {
    PullRequestReviewCommentPayloadBody body?;
};

# A pull request head or base ref
public type PullRequestRef record {
    string label?;
    string ref?;
    string sha?;
    User user?;
    Repository repo?;
};

# Payload for projects_v2_item events
public type 'ProjectsV2ItemPayload record {
    string action;
    # An item belonging to a Projects v2 project
    'projectsV2Item 'projects_v2_item;
    # The changes made to the item (for edited events)
    'ProjectsV2ItemPayloadChanges changes;
    User sender?;
    Organization organization?;
    Installation installation?;
};

# An item belonging to a Projects v2 project
public type 'projectsV2Item record {
    int id;
    string node_id;
    string project_node_id;
    string content_node_id;
    string content_type;
    string created_at?;
    string updated_at?;
    string? archived_at?;
    User creator?;
};

public type FieldValue record {
    string field_node_id?;
    string field_type?;
};

# The changes made to the item (for edited events)
public type 'ProjectsV2ItemPayloadChanges record {
    FieldValue field_value?;
};

# Payload for the ping event
public type PingPayload record {
    # Random string of GitHub zen
    string zen?;
    # The ID of the webhook that triggered the ping
    int hook_id?;
    # The webhook that is being pinged
    Hook hook?;
    User sender?;
    Repository repository?;
    Organization organization?;
};

public type Config record {
    string content_type?;
    string insecure_ssl?;
    string url?;
};

# The webhook that is being pinged
public type Hook record {
    string 'type?;
    int id?;
    string name?;
    boolean active?;
    string[] events?;
    Config config?;
    string updated_at?;
    string created_at?;
    string url?;
};

# Payload for create events (branch or tag created)
public type CreatePayload record {
    # The git ref resource (branch or tag name)
    string ref;
    # The type of Git ref object created
    string ref_type;
    # The name of the repository's default branch (usually main)
    string master_branch;
    # The repository's current description
    string? description?;
    # The pusher type; either user or a deploy key
    string pusher_type;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# A repository on GitHub
public type Repository record {
    int id;
    string node_id?;
    # The repository name
    string name;
    # The full repository name including owner (e.g. octocat/Hello-World)
    string full_name;
    User owner;
    # Whether the repository is private
    boolean 'private;
    string html_url?;
    string? description?;
    boolean 'fork?;
    string url?;
    string? homepage?;
    string? language?;
    int forks_count?;
    int stargazers_count?;
    int watchers_count?;
    int size?;
    string default_branch?;
    int open_issues_count?;
    string[] topics?;
    boolean has_issues?;
    boolean has_projects?;
    boolean has_wiki?;
    boolean has_pages?;
    boolean has_downloads?;
    boolean archived?;
    boolean disabled?;
    string visibility?;
    string? pushed_at?;
    string created_at?;
    string updated_at?;
    License? license?;
};

public type License record {
    string 'key?;
    string name?;
    string spdx_id?;
    string? url?;
};

# A comment on a pull request diff
public type PullRequestReviewComment record {
    int id;
    string node_id?;
    int? pull_request_review_id?;
    string url?;
    string html_url?;
    string body;
    string diff_hunk?;
    string path?;
    int? position?;
    int original_position?;
    string commit_id?;
    string original_commit_id?;
    User user?;
    string created_at?;
    string updated_at?;
    string author_association?;
    string side?;
    string? start_side?;
};

# Payload for team events
public type TeamPayload record {
    string action;
    Team team;
    # For edited events, the changes to the team
    TeamPayloadChanges changes?;
    # Present for added_to_repository and removed_from_repository actions
    Repository repository?;
    User sender?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type TeamPayloadDescription record {
    string 'from?;
};

public type TeamPayloadName record {
    string 'from?;
};

public type Privacy record {
    string 'from?;
};

public type NotificationSetting record {
    string 'from?;
};

# For edited events, the changes to the team
public type TeamPayloadChanges record {
    TeamPayloadDescription description?;
    TeamPayloadName name?;
    Privacy privacy?;
    NotificationSetting notification_setting?;
    # For added_to_repository/removed_from_repository events
    Repository repository?;
};

# A GitHub Enterprise account
public type Enterprise record {
    int id?;
    string slug?;
    string name?;
    string node_id?;
    string avatar_url?;
    string? description?;
    string? website_url?;
    string html_url?;
    string created_at?;
    string updated_at?;
};

# Payload for project events (classic project boards).
# Note: classic Projects are deprecated; use projects_v2 instead.
public type ProjectPayload record {
    string action;
    # A classic project board
    Project project;
    # For edited events, the changes made to the project
    ProjectPayloadChanges? changes?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# A classic project board
public type Project record {
    int id;
    string node_id;
    string url?;
    string html_url?;
    string columns_url?;
    string name;
    string? body?;
    int number;
    string state;
    User creator?;
    string created_at?;
    string updated_at?;
};

public type ProjectPayloadName record {
    string 'from?;
};

public type ProjectPayloadBody record {
    string? 'from?;
};

# For edited events, the changes made to the project
public type ProjectPayloadChanges record {
    ProjectPayloadName name?;
    ProjectPayloadBody body?;
};

# Payload for installation_target events (GitHub App installation account renamed)
public type InstallationTargetPayload record {
    string action;
    # The account (user or organization) where the app is installed
    InstallationTargetPayloadAccount account;
    string target_type;
    # The changes made to the account
    InstallationTargetPayloadChanges changes;
    Installation installation?;
};

# The account (user or organization) where the app is installed
public type InstallationTargetPayloadAccount record {
    int id;
    string node_id?;
    string login;
    string 'type;
    string avatar_url?;
    string html_url?;
    boolean site_admin?;
};

public type InstallationTargetPayloadLogin record {
    string 'from?;
};

public type Slug record {
    string 'from?;
};

# The changes made to the account
public type InstallationTargetPayloadChanges record {
    InstallationTargetPayloadLogin login?;
    Slug slug?;
};

# A deployment status
public type DeploymentStatus record {
    int id;
    string node_id?;
    string state;
    User creator?;
    string? description?;
    string environment?;
    string? environment_url?;
    string? log_url?;
    string? target_url?;
    string deployment_url?;
    string repository_url?;
    string created_at?;
    string updated_at?;
    App? performed_via_github_app?;
};

# Payload for installation_repositories events
public type InstallationRepositoriesPayload record {
    string action;
    # Repositories added to the installation
    RepositoriesAddedItem[] repositories_added;
    # Repositories removed from the installation
    RepositoriesRemovedItem[] repositories_removed;
    # Whether all repositories or a selection are accessible
    string repository_selection;
    User? requester;
    Installation installation?;
    User sender?;
    Organization organization?;
    Enterprise enterprise?;
};

public type RepositoriesAddedItem record {
    int id?;
    string node_id?;
    string name?;
    string full_name?;
    boolean 'private?;
};

public type RepositoriesRemovedItem record {
    int id?;
    string node_id?;
    string name?;
    string full_name?;
    boolean 'private?;
};

# An issue on GitHub
public type Issue record {
    int id;
    string node_id?;
    string url?;
    string html_url?;
    int number;
    string title;
    string? body?;
    string state;
    boolean locked?;
    User user?;
    Label[] labels?;
    User? assignee?;
    User[] assignees?;
    Milestone milestone?;
    int comments?;
    string created_at?;
    string updated_at?;
    string? closed_at?;
    string author_association?;
    string? active_lock_reason?;
};

# A label on an issue or pull request
public type Label record {
    int id;
    string node_id?;
    string url?;
    string name;
    # 6-character hex color code
    string color;
    boolean 'default?;
    string? description?;
};

# A deployment request for a specific ref
public type Deployment record {
    int id;
    string node_id?;
    string sha;
    string ref;
    string task;
    # JSON payload with extra information about the deployment
    map<json> payload?;
    string original_environment?;
    string environment;
    string? description?;
    User creator?;
    string created_at?;
    string updated_at?;
    string statuses_url?;
    string repository_url?;
    boolean transient_environment?;
    boolean production_environment?;
    App? performed_via_github_app?;
};

# Payload for branch_protection_configuration events
public type BranchProtectionConfigurationPayload record {
    # disabled — all branch protections were disabled. enabled — all were enabled.
    string action;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for repository_ruleset events
public type RepositoryRulesetPayload record {
    string action;
    # A set of rules to apply when specified conditions are met
    RepositoryRuleset repository_ruleset;
    # For edited events, the changes made to the ruleset. conditions/rules are each a
    # genuine added/deleted/updated diff (entries added or removed wholesale, or an
    # existing entry's own fields changed), not a flat "field changed from X" map like
    # most other changes payloads - bypass_actors is never part of this diff at all.
    RepositoryRulesetPayloadChanges? changes?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type RefName record {
    string[] include?;
    string[] exclude?;
};

# Which refs this ruleset applies to
public type Conditions record {
    RefName ref_name?;
};

# Only allow users with bypass permission to create matching refs.
public type RulesItemCreation record {
    string 'type;
};

public type RulesItemUpdateParameters record {
    # Branch can pull changes from its upstream repository
    boolean update_allows_fetch_and_merge;
};

# Only allow users with bypass permission to update matching refs.
public type RulesItemUpdate record {
    string 'type;
    RulesItemUpdateParameters parameters?;
};

# Only allow users with bypass permissions to delete matching refs.
public type RulesItemDeletion record {
    string 'type;
};

# Prevent merge commits from being pushed to matching refs.
public type RulesItemRequiredLinearHistory record {
    string 'type;
};

public type RulesItemMergeQueueParameters record {
    # Maximum time (minutes) for a required status check to report a conclusion.
    int check_response_timeout_minutes;
    string grouping_strategy;
    int max_entries_to_build;
    int max_entries_to_merge;
    string merge_method;
    int min_entries_to_merge;
    int min_entries_to_merge_wait_minutes;
};

# Merges must be performed via a merge queue.
public type RulesItemMergeQueue record {
    string 'type;
    RulesItemMergeQueueParameters parameters?;
};

public type RulesItemRequiredDeploymentsParameters record {
    string[] required_deployment_environments;
};

# Choose which environments must be successfully deployed to before refs can be pushed.
public type RulesItemRequiredDeployments record {
    string 'type;
    RulesItemRequiredDeploymentsParameters parameters?;
};

# Commits pushed to matching refs must have verified signatures.
public type RulesItemRequiredSignatures record {
    string 'type;
};

public type RulesItemPullRequestParameters record {
    string[] allowed_merge_methods?;
    boolean dismiss_stale_reviews_on_push;
    RuleDismissalRestriction dismissal_restriction?;
    boolean require_code_owner_review;
    boolean require_last_push_approval;
    int required_approving_review_count;
    boolean required_review_thread_resolution;
    RuleRequiredReviewerConfiguration[] required_reviewers?;
};

# Require commits be submitted via a pull request before they can be merged.
public type RulesItemPullRequest record {
    string 'type;
    RulesItemPullRequestParameters parameters?;
};

public type RulesItemRequiredStatusChecksParameters record {
    boolean do_not_enforce_on_create?;
    RuleStatusCheckConfiguration[] required_status_checks;
    boolean strict_required_status_checks_policy;
};

# Choose which status checks must pass before the ref is updated.
public type RulesItemRequiredStatusChecks record {
    string 'type;
    RulesItemRequiredStatusChecksParameters parameters?;
};

# Prevent users with push access from force pushing to refs.
public type RulesItemNonFastForward record {
    string 'type;
};

# Restrict commit messages matching a pattern.
public type RulesItemCommitMessagePattern record {
    string 'type;
    RulePatternParameters parameters?;
};

# Restrict commit author emails matching a pattern.
public type RulesItemCommitAuthorEmailPattern record {
    string 'type;
    RulePatternParameters parameters?;
};

# Restrict committer emails matching a pattern.
public type RulesItemCommitterEmailPattern record {
    string 'type;
    RulePatternParameters parameters?;
};

# Restrict branch names matching a pattern.
public type RulesItemBranchNamePattern record {
    string 'type;
    RulePatternParameters parameters?;
};

# Restrict tag names matching a pattern.
public type RulesItemTagNamePattern record {
    string 'type;
    RulePatternParameters parameters?;
};

public type RulesItemFilePathRestrictionParameters record {
    string[] restricted_file_paths;
};

# Restrict file and folder paths from being pushed.
public type RulesItemFilePathRestriction record {
    string 'type;
    RulesItemFilePathRestrictionParameters parameters?;
};

public type RulesItemMaxFilePathLengthParameters record {
    int max_file_path_length;
};

# Restrict file paths exceeding a character limit.
public type RulesItemMaxFilePathLength record {
    string 'type;
    RulesItemMaxFilePathLengthParameters parameters?;
};

public type RulesItemFileExtensionRestrictionParameters record {
    string[] restricted_file_extensions;
};

# Restrict files with specified file extensions.
public type RulesItemFileExtensionRestriction record {
    string 'type;
    RulesItemFileExtensionRestrictionParameters parameters?;
};

public type RulesItemMaxFileSizeParameters record {
    int max_file_size;
};

# Restrict individual files exceeding a size limit (MB).
public type RulesItemMaxFileSize record {
    string 'type;
    RulesItemMaxFileSizeParameters parameters?;
};

public type RulesItemWorkflowsParameters record {
    boolean do_not_enforce_on_create?;
    RuleWorkflowFileReference[] workflows;
};

# Require specified workflows to pass before changes can be merged.
public type RulesItemWorkflows record {
    string 'type;
    RulesItemWorkflowsParameters parameters?;
};

public type RulesItemCodeScanningParameters record {
    RuleCodeScanningTool[] code_scanning_tools;
};

# Choose which code scanning tools must provide results before the reference is updated.
public type RulesItemCodeScanning record {
    string 'type;
    RulesItemCodeScanningParameters parameters?;
};

public type RulesItem RulesItemCreation|RulesItemUpdate|RulesItemDeletion|RulesItemRequiredLinearHistory|RulesItemMergeQueue|RulesItemRequiredDeployments|RulesItemRequiredSignatures|RulesItemPullRequest|RulesItemRequiredStatusChecks|RulesItemNonFastForward|RulesItemCommitMessagePattern|RulesItemCommitAuthorEmailPattern|RulesItemCommitterEmailPattern|RulesItemBranchNamePattern|RulesItemTagNamePattern|RulesItemFilePathRestriction|RulesItemMaxFilePathLength|RulesItemFileExtensionRestriction|RulesItemMaxFileSize|RulesItemWorkflows|RulesItemCodeScanning;

public type BypassActorsItem record {
    int? actor_id?;
    string actor_type?;
    string bypass_mode?;
};

# A set of rules to apply when specified conditions are met
public type RepositoryRuleset record {
    int id;
    string name;
    string? target?;
    string? source_type?;
    string 'source?;
    string enforcement;
    # Which refs this ruleset applies to
    Conditions? conditions?;
    # Each entry's real shape depends on its "type" - 20 real rule types confirmed
    # against github/rest-api-description's authoritative OpenAPI spec (the actual
    # source powering docs.github.com and every GitHub SDK), not guessed from field
    # names or a third-party summary.
    RulesItem[] rules?;
    BypassActorsItem[] bypass_actors?;
    string created_at?;
    string updated_at?;
};

public type RepositoryRulesetPayloadName record {
    string 'from?;
};

public type Enforcement record {
    string 'from?;
};

public type ConditionType record {
    string 'from?;
};

public type Target record {
    string 'from?;
};

public type Include record {
    string[] 'from?;
};

public type Exclude record {
    string[] 'from?;
};

public type RepositoryRulesetPayloadChanges2 record {
    ConditionType condition_type?;
    Target target?;
    Include include?;
    Exclude exclude?;
};

public type UpdatedItem record {
    record {} condition?;
    RepositoryRulesetPayloadChanges2 changes?;
};

public type RepositoryRulesetPayloadConditions record {
    record {}[] added?;
    record {}[] deleted?;
    UpdatedItem[] updated?;
};

public type AddedItem record {
    string 'type?;
    record {} parameters?;
};

public type DeletedItem record {
    string 'type?;
    record {} parameters?;
};

public type RepositoryRulesetPayloadRule record {
    string 'type?;
    record {} parameters?;
};

public type Configuration record {
    string 'from?;
};

public type RuleType record {
    string 'from?;
};

public type Pattern record {
    string 'from?;
};

public type RepositoryRulesetPayloadChanges3 record {
    Configuration configuration?;
    RuleType rule_type?;
    Pattern pattern?;
};

public type RepositoryRulesetPayloadUpdatedItem record {
    RepositoryRulesetPayloadRule rule?;
    RepositoryRulesetPayloadChanges3 changes?;
};

public type Rules record {
    AddedItem[] added?;
    DeletedItem[] deleted?;
    RepositoryRulesetPayloadUpdatedItem[] updated?;
};

# For edited events, the changes made to the ruleset. conditions/rules are each a
# genuine added/deleted/updated diff (entries added or removed wholesale, or an
# existing entry's own fields changed), not a flat "field changed from X" map like
# most other changes payloads - bypass_actors is never part of this diff at all.
public type RepositoryRulesetPayloadChanges record {
    RepositoryRulesetPayloadName name?;
    Enforcement enforcement?;
    RepositoryRulesetPayloadConditions conditions?;
    Rules rules?;
};

# Payload for security_and_analysis events. Fired when code security and
# analysis features are enabled or disabled for a repository. No action field.
public type SecurityAndAnalysisPayload record {
    # The security and analysis settings that changed
    SecurityAndAnalysisPayloadChanges changes;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Change to GitHub Advanced Security enablement
public type AdvancedSecurity record {
    string 'from?;
    string to?;
};

# Change to Dependabot alerts enablement
public type DependabotAlerts record {
    string 'from?;
    string to?;
};

# Change to Dependabot security updates enablement
public type DependabotSecurityUpdates record {
    string 'from?;
    string to?;
};

# Change to secret scanning enablement
public type SecretScanning record {
    string 'from?;
    string to?;
};

# Change to secret scanning push protection enablement
public type SecretScanningPushProtection record {
    string 'from?;
    string to?;
};

# Change to non-provider pattern scanning enablement
public type SecretScanningNonProviderPatterns record {
    string 'from?;
    string to?;
};

# The security and analysis settings that changed
public type SecurityAndAnalysisPayloadChanges record {
    # Change to GitHub Advanced Security enablement
    AdvancedSecurity advanced_security?;
    # Change to Dependabot alerts enablement
    DependabotAlerts dependabot_alerts?;
    # Change to Dependabot security updates enablement
    DependabotSecurityUpdates dependabot_security_updates?;
    # Change to secret scanning enablement
    SecretScanning secret_scanning?;
    # Change to secret scanning push protection enablement
    SecretScanningPushProtection secret_scanning_push_protection?;
    # Change to non-provider pattern scanning enablement
    SecretScanningNonProviderPatterns secret_scanning_non_provider_patterns?;
};

# Git author/committer metadata
public type CommitAuthor record {
    string name?;
    string email?;
    string username?;
};

# Payload for deploy_key events
public type DeployKeyPayload record {
    string action;
    # The deploy key resource
    'key 'key;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# The deploy key resource
public type 'key record {
    int id;
    # The public key
    string 'key;
    string url?;
    string title?;
    boolean verified?;
    string created_at?;
    boolean read_only?;
    string? added_by?;
    string? last_used?;
};

# Payload for issue_dependencies events
public type IssueDependenciesPayload record {
    string action;
    # The ID of the blocked issue.
    int blocked_issue_id?;
    Issue blocked_issue?;
    # The ID of the blocking issue.
    int blocking_issue_id?;
    Issue blocking_issue?;
    Repository blocking_issue_repo?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for repository_advisory events
public type RepositoryAdvisoryPayload record {
    string action;
    # A repository security advisory
    RepositoryAdvisory repository_advisory;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type IdentifiersItem record {
    string 'type?;
    string value?;
};

# The accept/reject decision on a repository security advisory publish request
public type Submission record {
    boolean accepted?;
};

public type RepositoryAdvisoryPayloadPackage record {
    string ecosystem?;
    string name?;
};

public type VulnerabilitiesItem record {
    RepositoryAdvisoryPayloadPackage package?;
    string? vulnerable_version_range?;
    string? patched_versions?;
    string[] vulnerable_functions?;
};

public type Cvss record {
    string? vector_string?;
    decimal? score?;
};

public type CwesItem record {
    string cwe_id?;
    string name?;
};

public type CreditsItem record {
    User user?;
    string 'type?;
};

# A repository security advisory
public type RepositoryAdvisory record {
    # The GitHub Security Advisory identifier
    string ghsa_id;
    string? cve_id;
    string url?;
    string html_url?;
    string summary;
    string? description?;
    string severity;
    User author?;
    User? publisher?;
    IdentifiersItem[] identifiers?;
    string state;
    string created_at?;
    string updated_at?;
    string? published_at?;
    string? withdrawn_at?;
    # The accept/reject decision on a repository security advisory publish request
    Submission? submission?;
    VulnerabilitiesItem[] vulnerabilities?;
    Cvss? cvss?;
    CwesItem[]? cwes?;
    CreditsItem[]? credits?;
};

# Payload for repository_vulnerability_alert events (closing down — use dependabot_alert)
public type RepositoryVulnerabilityAlertPayload record {
    string action;
    # The security alert of the vulnerable dependency
    RepositoryVulnerabilityAlertPayloadAlert alert;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
};

# The security alert of the vulnerable dependency
public type RepositoryVulnerabilityAlertPayloadAlert record {
    int id;
    string affected_package_name;
    string affected_range;
    string? fixed_in?;
    string severity;
    string ghsa_id?;
    string external_identifier?;
    string? external_reference?;
    string created_at?;
    string? auto_dismissed_at?;
    string? dismiss_reason?;
    string? dismissed_at?;
    User? dismissed_by?;
    int number?;
};

# A milestone on an issue or pull request
public type Milestone record {
    int id?;
    string node_id?;
    int number?;
    string title?;
    string? description?;
    string state?;
    int open_issues?;
    int closed_issues?;
    string created_at?;
    string updated_at?;
    string? due_on?;
    string? closed_at?;
    User creator?;
};

# Payload for issues events
public type IssuesPayload record {
    # The action that was performed
    string action;
    Issue issue;
    User? assignee?;
    Label label?;
    # For edited events, the changes to the issue
    IssuesPayloadChanges changes?;
    Milestone milestone?;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type Title record {
    string 'from?;
};

public type IssuesPayloadBody record {
    string 'from?;
};

# For edited events, the changes to the issue
public type IssuesPayloadChanges record {
    Title title?;
    IssuesPayloadBody body?;
};

# Payload for code_scanning_alert events
public type CodeScanningAlertPayload record {
    string action;
    # The code scanning alert involved in the event
    CodeScanningAlertPayloadAlert alert;
    # The commit SHA of the alert. Empty when action is reopened_by_user
    # or closed_by_user.
    string commit_oid;
    # The git ref of the alert. Empty when action is reopened_by_user
    # or closed_by_user.
    string ref;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type CodeScanningAlertPayloadRule record {
    string id?;
    string severity?;
    string? security_severity_level?;
    string description?;
    string name?;
    string full_description?;
    string[] tags?;
    string? help?;
};

public type Tool record {
    string name?;
    string? guid?;
    string? 'version?;
};

# Where in the code this alert instance was found - unrelated to, and a
# different shape from, secret_scanning's own "location" field elsewhere in
# this spec (that one identifies a commit/path, this one a line/column range).
public type CodeScanningAlertPayloadLocation record {
    string path?;
    int start_line?;
    int end_line?;
    int start_column?;
    int end_column?;
};

public type MostRecentInstance record {
    string ref?;
    string analysis_key?;
    string environment?;
    string state?;
    string commit_sha?;
    # Where in the code this alert instance was found - unrelated to, and a
    # different shape from, secret_scanning's own "location" field elsewhere in
    # this spec (that one identifies a commit/path, this one a line/column range).
    CodeScanningAlertPayloadLocation location?;
};

# The code scanning alert involved in the event
public type CodeScanningAlertPayloadAlert record {
    int number;
    string created_at?;
    string? updated_at?;
    string url?;
    string html_url?;
    string state;
    string? fixed_at?;
    User? dismissed_by?;
    string? dismissed_at?;
    string? dismissed_reason?;
    string? dismissed_comment?;
    CodeScanningAlertPayloadRule rule?;
    Tool tool?;
    MostRecentInstance most_recent_instance?;
};

# Payload for pull_request_review events
public type PullRequestReviewPayload record {
    string action;
    PullRequestReview review;
    PullRequest pull_request;
    # For edited events, the changes to the review
    PullRequestReviewPayloadChanges changes?;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type PullRequestReviewPayloadBody record {
    string 'from?;
};

# For edited events, the changes to the review
public type PullRequestReviewPayloadChanges record {
    PullRequestReviewPayloadBody body?;
};

# Payload for projects_v2 events (organization-level Projects)
public type 'ProjectsV2Payload record {
    string action;
    # A Projects v2 project
    'projectsV2 'projects_v2;
    User sender?;
    Organization organization?;
    Installation installation?;
};

# A Projects v2 project
public type 'projectsV2 record {
    int id;
    string node_id;
    User owner;
    User creator?;
    string title;
    string? description?;
    boolean 'public?;
    string? closed_at?;
    string created_at?;
    string updated_at?;
    string? deleted_at?;
    User? deleted_by?;
    int number?;
    string? short_description?;
    string? status?;
};

# Payload for personal_access_token_request events
public type PersonalAccessTokenRequestPayload record {
    string action;
    # A fine-grained personal access token request
    PersonalAccessTokenRequest personal_access_token_request;
    User sender?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Permissions added by the request - each of organization/repository/other is a
# map of permission name to access level (e.g. "contents": "read"), NOT a
# reference to the Organization/Repository entity schemas despite the field names.
public type PermissionsAdded record {
    map<json>? organization?;
    map<json>? repository?;
    map<json>? other?;
};

# Permissions upgraded from existing token - same permission-name-to-access-level
# map shape as permissions_added, not an entity reference.
public type PermissionsUpgraded record {
    map<json>? organization?;
    map<json>? repository?;
    map<json>? other?;
};

# The resulting full set of permissions if approved - same permission-name-to-
# access-level map shape as permissions_added, not an entity reference.
public type PermissionsResult record {
    map<json>? organization?;
    map<json>? repository?;
    map<json>? other?;
};

# A fine-grained personal access token request
public type PersonalAccessTokenRequest record {
    int id;
    User owner;
    # Permissions added by the request - each of organization/repository/other is a
    # map of permission name to access level (e.g. "contents": "read"), NOT a
    # reference to the Organization/Repository entity schemas despite the field names.
    PermissionsAdded permissions_added?;
    # Permissions upgraded from existing token - same permission-name-to-access-level
    # map shape as permissions_added, not an entity reference.
    PermissionsUpgraded permissions_upgraded?;
    # The resulting full set of permissions if approved - same permission-name-to-
    # access-level map shape as permissions_added, not an entity reference.
    PermissionsResult permissions_result?;
    string repository_selection?;
    string? repositories_url?;
    Repository[]? repositories?;
    boolean token_expired?;
    string? token_expires_at?;
    string? token_last_used_at?;
    string created_at?;
};

# Payload for installation events
public type InstallationPayload record {
    string action;
    Installation installation;
    # An array of repositories the installation can access
    RepositoriesItem[] repositories?;
    User? requester?;
    User sender?;
    Organization organization?;
    Enterprise enterprise?;
};

public type RepositoriesItem record {
    int id?;
    string node_id?;
    string name?;
    string full_name?;
    boolean 'private?;
};

# A GitHub Actions workflow run
public type WorkflowRun record {
    int id;
    string name;
    string node_id?;
    int check_suite_id?;
    string check_suite_node_id?;
    string? head_branch?;
    string head_sha?;
    int run_number?;
    string event?;
    string status;
    string? conclusion?;
    int workflow_id?;
    string url?;
    string html_url?;
    PullRequestMinimal[] pull_requests?;
    string created_at?;
    string updated_at?;
    int run_attempt?;
    string run_started_at?;
    User actor?;
    User triggering_actor?;
    string jobs_url?;
    string logs_url?;
    string check_suite_url?;
    string artifacts_url?;
    string cancel_url?;
    string rerun_url?;
    string workflow_url?;
    Commit head_commit?;
    Repository repository?;
};

# Payload for discussion events
public type DiscussionPayload record {
    string action;
    Discussion discussion;
    # Present on answered action - the comment marked as answer. Richer than the
    # Comment schema used for discussion_comment (has parent_id, child_comment_count,
    # repository_url, discussion_id in addition to Comment's fields), so this is its
    # own shape rather than a $ref to Comment.
    Answer? answer?;
    Label label?;
    # For edited/category_changed events, the changes made
    DiscussionPayloadChanges changes?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Present on answered action - the comment marked as answer. Richer than the
# Comment schema used for discussion_comment (has parent_id, child_comment_count,
# repository_url, discussion_id in addition to Comment's fields), so this is its
# own shape rather than a $ref to Comment.
public type Answer record {
    int id?;
    string node_id?;
    string html_url?;
    int? parent_id?;
    int child_comment_count?;
    string repository_url?;
    int discussion_id?;
    string author_association?;
    User user?;
    string body?;
    string created_at?;
    string updated_at?;
};

public type DiscussionPayloadTitle record {
    string 'from?;
};

public type DiscussionPayloadBody record {
    string 'from?;
};

# Present on category_changed
public type DiscussionPayloadCategory record {
    Category 'from?;
};

# For edited/category_changed events, the changes made
public type DiscussionPayloadChanges record {
    DiscussionPayloadTitle title?;
    DiscussionPayloadBody body?;
    # Present on category_changed
    DiscussionPayloadCategory category?;
};

# A check suite
public type CheckSuite record {
    int id;
    string node_id?;
    string? head_branch?;
    string head_sha?;
    string status?;
    string? conclusion?;
    string url?;
    string? before?;
    string? after?;
    PullRequestMinimal[] pull_requests?;
    App app?;
    string created_at?;
    string updated_at?;
};

# Payload for status events. No action field — the state property carries
# the status (pending, success, failure, error).
public type StatusPayload record {
    # The unique identifier of the status
    int id;
    # The commit SHA
    string sha;
    # The repository name
    string name;
    # The new state of the commit status
    string state;
    # The status context identifier
    string context;
    # The optional human-readable description
    string? description?;
    # The optional link added to the status
    string? target_url?;
    string? avatar_url?;
    # The commit the status is associated with
    'commit 'commit;
    # Array of branches containing the status SHA (max 10)
    BranchesItem[] branches;
    string created_at;
    string updated_at;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type Author record {
    string name?;
    string email?;
    string date?;
};

public type Committer record {
    string name?;
    string email?;
    string date?;
};

public type Tree record {
    string sha?;
    string url?;
};

public type Verification record {
    boolean verified?;
    string reason?;
    string? signature?;
    string? payload?;
};

# The raw git commit data (distinct from the GitHub account in the sibling author/committer fields)
public type StatusPayloadCommit record {
    Author author?;
    Committer committer?;
    string message?;
    Tree tree?;
    string url?;
    int comment_count?;
    Verification verification?;
};

# The commit the status is associated with
public type 'commit record {
    string sha?;
    # The raw git commit data (distinct from the GitHub account in the sibling author/committer fields)
    StatusPayloadCommit 'commit?;
    string url?;
    string html_url?;
    User author?;
    User committer?;
};

public type StatusPayloadCommit2 record {
    string sha?;
    string url?;
};

public type BranchesItem record {
    string name?;
    StatusPayloadCommit2 'commit?;
    boolean protected?;
};

# Payload for projects_v2_status_update events
public type 'ProjectsV2StatusUpdatePayload record {
    string action;
    # A status update belonging to a Projects v2 project
    'projectsV2StatusUpdate 'projects_v2_status_update;
    User sender?;
    Organization organization?;
    Installation installation?;
};

# A status update belonging to a Projects v2 project
public type 'projectsV2StatusUpdate record {
    int id;
    string node_id;
    string project_node_id;
    string? status?;
    string? body?;
    string created_at?;
    string updated_at?;
    string? start_date?;
    string? target_date?;
    User creator?;
};

public type CommonPayload record {
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# A minimal cross-reference to a pull request, as delivered in workflow_run/check_suite/
# check_run/deployment_review's pull_requests[] - NOT the full pull request resource (no
# title, state, user, etc.), so this must not $ref PullRequest or PullRequestRef.
public type PullRequestMinimal record {
    int id;
    int number;
    string url;
    Head head;
    Base base;
};

public type Repo record {
    int id?;
    string url?;
    string name?;
};

public type Head record {
    string ref?;
    string sha?;
    Repo repo?;
};

public type PullRequestMinimalRepo record {
    int id?;
    string url?;
    string name?;
};

public type Base record {
    string ref?;
    string sha?;
    PullRequestMinimalRepo repo?;
};

# A GitHub Discussion in a repository
public type Discussion record {
    int id;
    string node_id?;
    int number;
    string title;
    string? body?;
    string state;
    Category category?;
    User user?;
    string html_url?;
    int comments?;
    Label[] labels?;
    boolean locked?;
    string? active_lock_reason?;
    string? answer_html_url?;
    string? answer_chosen_at?;
    User? answer_chosen_by?;
    string created_at?;
    string updated_at?;
};

# A GitHub user
public type User record {
    # The user's GitHub username
    string login;
    # The user's unique numeric identifier
    int id;
    string node_id?;
    string avatar_url?;
    string? gravatar_id?;
    string url?;
    string html_url?;
    string 'type?;
    boolean site_admin?;
};

# A pull request review
public type PullRequestReview record {
    int id;
    string node_id?;
    User user?;
    string? body?;
    string state;
    string html_url?;
    string pull_request_url?;
    string submitted_at?;
    string commit_id?;
    string author_association?;
};

# A discussion category
public type Category record {
    int id;
    string node_id;
    int repository_id;
    string emoji?;
    string name;
    string description?;
    string created_at?;
    string updated_at?;
    string slug;
    boolean is_answerable?;
};

# Payload for delete events (branch or tag deleted)
public type DeletePayload record {
    # The git ref resource (branch or tag name)
    string ref;
    # The type of Git ref object deleted
    string ref_type;
    # The pusher type; either user or a deploy key
    string pusher_type;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for meta events (webhook lifecycle)
public type MetaPayload record {
    # Always deleted — the webhook that triggered this event was deleted
    string action;
    # The id of the modified webhook
    int hook_id;
    # The deleted webhook. Fields vary by webhook type (repository,
    # organization, business, app, or GitHub Marketplace).
    MetaPayloadHook hook;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type MetaPayloadConfig record {
    string content_type?;
    string insecure_ssl?;
    string url?;
    # Omitted from payloads for security
    string secret?;
};

# The deleted webhook. Fields vary by webhook type (repository,
# organization, business, app, or GitHub Marketplace).
public type MetaPayloadHook record {
    string 'type;
    int id;
    string name;
    boolean active;
    string[] events?;
    MetaPayloadConfig config?;
    string updated_at?;
    string created_at?;
};

# Payload for deployment events
public type DeploymentPayload record {
    string action;
    Deployment deployment;
    # The workflow that triggered the deployment (if applicable)
    Workflow? workflow;
    # The workflow run that triggered the deployment (if applicable)
    WorkflowRun? workflow_run;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for deployment_protection_rule events (app webhooks only)
public type DeploymentProtectionRulePayload record {
    # The name of the environment that has the deployment protection rule
    string environment?;
    # The event that triggered the deployment protection rule
    string event?;
    # The commit SHA that triggered the workflow
    string sha?;
    # The branch or tag ref that triggered the workflow
    string ref?;
    # The URL to call to approve or reject the deployment
    string deployment_callback_url?;
    # A request for a specific ref to be deployed
    Deployment deployment?;
    # The pull requests associated with the deployment
    PullRequestsItem[] pull_requests?;
    User sender?;
    Installation installation?;
    Repository repository?;
    Organization organization?;
};

public type PullRequestsItem record {
    int number?;
    string url?;
    PullRequestRef head?;
    PullRequestRef base?;
};

# Required status check
public type RuleStatusCheckConfiguration record {
    string context;
    int integration_id?;
};

# Payload for label events
public type LabelPayload record {
    string action;
    Label label;
    # For edited events, the changes to the label
    LabelPayloadChanges changes?;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type Color record {
    string 'from?;
};

public type LabelPayloadName record {
    string 'from?;
};

public type LabelPayloadDescription record {
    string 'from?;
};

# For edited events, the changes to the label
public type LabelPayloadChanges record {
    Color color?;
    LabelPayloadName name?;
    LabelPayloadDescription description?;
};

# Payload for github_app_authorization events (app webhooks only)
public type GithubAppAuthorizationPayload record {
    # Always revoked — a user revoked their GitHub App authorization
    string action;
    User sender?;
    Installation installation?;
};

# Payload for page_build events. No action field.
public type PageBuildPayload record {
    # The unique identifier of the page build
    int id;
    # The GitHub Pages build object
    Build build;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Error information if the build failed
public type PageBuildPayloadError record {
    string? message;
};

# The GitHub Pages build object
public type Build record {
    string url;
    # Current build status
    string status;
    # Error information if the build failed
    PageBuildPayloadError 'error;
    User pusher;
    # The SHA of the commit that triggered the build
    string 'commit;
    # Duration of the build in milliseconds
    int duration;
    string created_at;
    string updated_at;
};

# Payload for project_card events (classic project cards).
# Note: classic Projects are deprecated; use projects_v2_item instead.
public type ProjectCardPayload record {
    string action;
    # A card on a classic project board
    ProjectCard project_card;
    # For edited/moved events, the changes made
    ProjectCardPayloadChanges? changes?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# A card on a classic project board
public type ProjectCard record {
    int id;
    string node_id;
    string url?;
    int column_id;
    string column_url?;
    string project_url?;
    string? note?;
    # Link to the issue or PR if the card is content-based
    string? content_url?;
    # The ID of the card this card was moved after
    int? after_id?;
    User creator?;
    string created_at?;
    string updated_at?;
};

public type Note record {
    string? 'from?;
};

public type ColumnId record {
    int 'from?;
};

# For edited/moved events, the changes made
public type ProjectCardPayloadChanges record {
    Note note?;
    ColumnId column_id?;
};

# Payload for pull_request events
public type PullRequestPayload record {
    # The action that was performed
    string action;
    # The pull request number
    int number;
    PullRequest pull_request;
    User? assignee;
    # For edited events, the changes to the pull request
    PullRequestPayloadChanges changes?;
    User requested_reviewer?;
    Label label?;
    Milestone milestone?;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type PullRequestPayloadTitle record {
    string 'from?;
};

public type PullRequestPayloadBody record {
    string 'from?;
};

public type Ref record {
    string 'from?;
};

public type Sha record {
    string 'from?;
};

public type PullRequestPayloadBase record {
    Ref ref?;
    Sha sha?;
};

# For edited events, the changes to the pull request
public type PullRequestPayloadChanges record {
    PullRequestPayloadTitle title?;
    PullRequestPayloadBody body?;
    PullRequestPayloadBase base?;
};

# Payload for team_add events. Fired when a repository is added to a team.
# No action field.
public type TeamAddPayload record {
    # The team that was granted access to the repository
    TeamAddPayloadTeam team;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# The parent team, if this is a child team
public type TeamAddPayloadParent record {
    int id?;
    string node_id?;
    string name?;
    string slug?;
    string? description?;
    string privacy?;
    string permission?;
    string members_url?;
    string repositories_url?;
    string html_url?;
};

# The team that was granted access to the repository
public type TeamAddPayloadTeam record {
    int id;
    string node_id;
    string url?;
    string html_url?;
    string name;
    string slug;
    string? description?;
    string privacy?;
    string notification_setting?;
    string permission?;
    string members_url?;
    string repositories_url?;
    # The parent team, if this is a child team
    TeamAddPayloadParent? parent?;
};

# A job in a GitHub Actions workflow run
public type WorkflowJob record {
    int id;
    int run_id?;
    string run_url?;
    int run_attempt?;
    string node_id?;
    string head_sha?;
    string url?;
    string html_url?;
    string status;
    string? conclusion?;
    string created_at?;
    string started_at?;
    string? completed_at?;
    string name;
    StepsItem[] steps?;
    string check_run_url?;
    string[] labels?;
    int? runner_id?;
    string? runner_name?;
    int? runner_group_id?;
    string? runner_group_name?;
    string? workflow_name?;
    string? head_branch?;
};

public type StepsItem record {
    string name?;
    string status?;
    string? conclusion?;
    int number?;
    string? started_at?;
    string? completed_at?;
};

# A GitHub release
public type Release record {
    int id;
    string node_id?;
    string url?;
    string html_url?;
    string assets_url?;
    string upload_url?;
    string tag_name;
    string? name;
    string? body?;
    boolean draft?;
    boolean prerelease?;
    string target_commitish?;
    User author?;
    AssetsItem[] assets?;
    string created_at?;
    string? published_at?;
};

# A file attached to a release
public type AssetsItem record {
    string url;
    string browser_download_url;
    int id;
    string node_id;
    string name;
    string? label?;
    string state;
    string content_type;
    int size;
    string? digest?;
    int download_count;
    string created_at;
    string updated_at;
    User uploader?;
};

# Payload for custom_property events
public type CustomPropertyPayload record {
    string action;
    # Custom property defined on an organization
    Definition definition;
    User sender?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Custom property defined on an organization
public type Definition record {
    string property_name;
    string value_type;
    string? required?;
    # Default value (string or array of strings)
    anydata? default_value?;
    string? description?;
    string[]? allowed_values?;
};

# Payload for public events. Fired when a repository visibility changes
# from private to public. No action field.
public type PublicPayload record {
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Payload for member events (repository collaborator activity)
public type MemberPayload record {
    string action;
    User? member;
    # For edited events, the changes to the member's permissions
    MemberPayloadChanges changes?;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type OldPermission record {
    string 'from?;
};

public type Permission record {
    string 'from?;
    string to?;
};

# For edited events, the changes to the member's permissions
public type MemberPayloadChanges record {
    OldPermission old_permission?;
    Permission permission?;
};

# Payload for milestone events
public type MilestonePayload record {
    string action;
    Milestone milestone;
    # For edited events, the changes to the milestone
    MilestonePayloadChanges changes?;
    User sender;
    Repository repository;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

public type MilestonePayloadDescription record {
    string 'from?;
};

public type DueOn record {
    string? 'from?;
};

public type MilestonePayloadTitle record {
    string 'from?;
};

# For edited events, the changes to the milestone
public type MilestonePayloadChanges record {
    MilestonePayloadDescription description?;
    DueOn due_on?;
    MilestonePayloadTitle title?;
};

# Payload for security_advisory events (GitHub-reviewed global advisories)
public type SecurityAdvisoryPayload record {
    string action;
    # The details of the global security advisory, including summary,
    # description, severity, and affected packages.
    SecurityAdvisoryPayloadSecurityAdvisory security_advisory;
    Installation installation?;
};

public type SecurityAdvisoryPayloadIdentifiersItem record {
    string value?;
    string 'type?;
};

public type ReferencesItem record {
    string url?;
};

public type SecurityAdvisoryPayloadPackage record {
    string ecosystem?;
    string name?;
};

public type SecurityAdvisoryPayloadFirstPatchedVersion record {
    string identifier?;
};

public type SecurityAdvisoryPayloadVulnerabilitiesItem record {
    SecurityAdvisoryPayloadPackage package?;
    string severity?;
    string vulnerable_version_range?;
    SecurityAdvisoryPayloadFirstPatchedVersion? first_patched_version?;
};

public type SecurityAdvisoryPayloadCvss record {
    string? vector_string?;
    decimal score?;
};

public type SecurityAdvisoryPayloadCwesItem record {
    string cwe_id?;
    string name?;
};

# The details of the global security advisory, including summary,
# description, severity, and affected packages.
public type SecurityAdvisoryPayloadSecurityAdvisory record {
    string schema_version?;
    string ghsa_id;
    string? cve_id?;
    string url?;
    string html_url?;
    string summary;
    string description?;
    string severity;
    SecurityAdvisoryPayloadIdentifiersItem[] identifiers?;
    ReferencesItem[] references?;
    string published_at?;
    string updated_at?;
    string? withdrawn_at?;
    SecurityAdvisoryPayloadVulnerabilitiesItem[] vulnerabilities?;
    SecurityAdvisoryPayloadCvss cvss?;
    SecurityAdvisoryPayloadCwesItem[] cwes?;
};

# Payload for check_run events
public type CheckRunPayload record {
    string action;
    CheckRun check_run;
    # Present for requested_action events
    RequestedAction requested_action?;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# Present for requested_action events
public type RequestedAction record {
    string identifier?;
};

# Payload for commit_comment events
public type CommitCommentPayload record {
    string action;
    # The commit comment resource
    CommitCommentPayloadComment comment;
    User sender?;
    Repository repository?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# The commit comment resource
public type CommitCommentPayloadComment record {
    int id;
    string node_id?;
    string url?;
    string html_url?;
    string body;
    # The relative path of the file being commented on
    string? path?;
    # The line index in the diff
    int? position?;
    # The line of the blob the comment refers to
    int? line?;
    string commit_id?;
    User user?;
    string created_at?;
    string updated_at?;
    string author_association?;
};

# A required reviewing team
public type RuleReviewer record {
    int id;
    string 'type;
};

# A reviewing team, and file patterns describing which files they must approve changes to.
public type RuleRequiredReviewerConfiguration record {
    string[] file_patterns;
    int minimum_approvals;
    RuleReviewer reviewer;
};

# A Git commit
public type Commit record {
    # The commit SHA
    string id;
    string tree_id?;
    # Whether this commit is distinct from any that have been pushed before
    boolean 'distinct?;
    string message;
    string timestamp?;
    string url?;
    CommitAuthor author?;
    CommitAuthor committer?;
    # Files added in this commit
    string[] added?;
    # Files removed in this commit
    string[] removed?;
    # Files modified in this commit
    string[] modified?;
};

# A check performed on the code of a given code change
public type CheckRun record {
    int id;
    string name;
    string node_id?;
    string head_sha?;
    string? external_id?;
    string url?;
    string html_url?;
    string? details_url?;
    string status?;
    string? conclusion?;
    string? started_at?;
    string? completed_at?;
    Output output?;
    CheckRunCheckSuite check_suite?;
    App app?;
    PullRequestMinimal[] pull_requests?;
};

public type Output record {
    string? title?;
    string? summary?;
    string? text?;
    int annotations_count?;
    string annotations_url?;
};

public type CheckRunCheckSuite record {
    int id?;
};

# Payload for membership events (team member added/removed)
public type MembershipPayload record {
    string action;
    User? member;
    # The scope of the membership (currently always "team")
    string scope;
    Team team;
    User sender?;
    Organization organization?;
    Installation installation?;
    Enterprise enterprise?;
};

# The union of every possible webhook payload type this listener can receive.
public type GenericDataType App|ForkPayload|WorkflowRunPayload|GollumPayload|ReleasePayload|MarketplacePurchase|SecretScanningAlertLocationPayload|DeploymentReviewPayload|PullRequest|SecretScanningScanPayload|IssueCommentPayload|DeploymentStatusPayload|OrganizationPayload|WebhookHeaders|RepositoryDispatchPayload|MergeGroupPayload|WorkflowJobPayload|OrgBlockPayload|Tier|DependabotAlertPayload|RuleActor|CustomPropertyValuesPayload|SecretScanningAlertPayload|PullRequestReviewThreadPayload|RuleWorkflowFileReference|RuleDismissalRestriction|IssueComment|RulePatternParameters|RegistryPackagePayload|CheckSuitePayload|DiscussionCommentPayload|RepositoryImportPayload|RepositoryPayload|StarPayload|WatchPayload|PackagePayload|WorkflowDispatchPayload|RuleCodeScanningTool|SponsorshipPayload|SubIssuesPayload|ProjectColumnPayload|Team|MarketplacePurchasePayload|PushPayload|BranchProtectionRulePayload|PullRequestReviewCommentPayload|'ProjectsV2ItemPayload|CreatePayload|Repository|PullRequestReviewComment|TeamPayload|ProjectPayload|InstallationTargetPayload|DeploymentStatus|InstallationRepositoriesPayload|Issue|Label|Deployment|BranchProtectionConfigurationPayload|RepositoryRulesetPayload|SecurityAndAnalysisPayload|DeployKeyPayload|IssueDependenciesPayload|RepositoryAdvisoryPayload|RepositoryVulnerabilityAlertPayload|IssuesPayload|CodeScanningAlertPayload|PullRequestReviewPayload|'ProjectsV2Payload|PersonalAccessTokenRequestPayload|InstallationPayload|WorkflowRun|DiscussionPayload|CheckSuite|StatusPayload|'ProjectsV2StatusUpdatePayload|PullRequestMinimal|Discussion|User|PullRequestReview|Category|DeletePayload|MetaPayload|DeploymentPayload|RuleStatusCheckConfiguration|LabelPayload|GithubAppAuthorizationPayload|PageBuildPayload|ProjectCardPayload|PullRequestPayload|TeamAddPayload|WorkflowJob|Release|CustomPropertyPayload|PublicPayload|MemberPayload|MilestonePayload|SecurityAdvisoryPayload|CheckRunPayload|CommitCommentPayload|RuleReviewer|RuleRequiredReviewerConfiguration|Commit|CheckRun|MembershipPayload|Workflow|Package|Organization|SecurityVulnerability|Installation|PullRequestRef|PingPayload|Enterprise|CommitAuthor|Milestone|CommonPayload|DeploymentProtectionRulePayload;
