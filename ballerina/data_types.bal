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
    # The secret used to verify incoming webhook signatures.
    string webhookSecret?;
};

# A GitHub App
public type App record {
    # Unique identifier of the GitHub app.
    int id;
    # The GraphQL node ID.
    string node_id;
    # A GitHub user
    User owner?;
    # The name of the GitHub app.
    string name;
    # The description of the GitHub App.
    string? description?;
    # The URL of the GitHub App's external website.
    string external_url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # The set of permissions for the GitHub app.
    map<json> permissions?;
    # The list of events for the GitHub app. Note that the `installation_target`, `security_advisory`, and `meta` events are not included because they are global events and not specific to an installation.
    string[] events?;
};

# Payload for fork events
public type ForkPayload record {
    # The created (forked) repository
    Repository forkee;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Payload for workflow_run events
public type WorkflowRunPayload record {
    # The action that was performed. Can be one of: in_progress, completed, requested.
    string action;
    # A GitHub Actions workflow run
    WorkflowRun workflow_run;
    # The workflow that is being run
    Workflow? workflow;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Payload for gollum (wiki) events
public type GollumPayload record {
    # The pages that were updated
    PagesItem[] pages;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A wiki page that was created or updated.
public type PagesItem record {
    # The name of the page
    string page_name;
    # The current page title
    string title;
    # A summary of the changes
    string? summary?;
    # The action performed on the page, either created or edited.
    string action;
    # The latest commit SHA of the page
    string sha;
    # The URL of the resource on GitHub.com.
    string html_url;
};

# Payload for release events
public type ReleasePayload record {
    # The action that was performed
    string action;
    # A GitHub release
    Release release;
    # For edited events, the changes to the release
    Changes changes?;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The release's previous body text, before this edit.
public type Body record {
    # The previous value, before this change.
    string 'from?;
};

# The release's previous name, before this edit.
public type Name record {
    # The previous value, before this change.
    string 'from?;
};

# The release's previous tag name, before this edit.
public type TagName record {
    # The previous value, before this change.
    string 'from?;
};

# Whether this release was explicitly edited to be the latest
public type MakeLatest record {
    # Whether the release became the latest release (best-effort; not documented by GitHub).
    boolean to?;
};

# For edited events, the changes to the release
public type Changes record {
    # The release's previous body text, before this edit.
    Body body?;
    # The release's previous name, before this edit.
    Name name?;
    # The release's previous tag name, before this edit.
    TagName tag_name?;
    # Whether this release was explicitly edited to be the latest
    MakeLatest make_latest?;
};

# The GitHub Marketplace purchase
public type MarketplacePurchase record {
    # The GitHub account (user or organization) that made the Marketplace purchase.
    Account account;
    # The billing cycle of the plan, e.g. monthly or yearly.
    string billing_cycle;
    # The number of units purchased on the plan.
    int unit_count;
    # Whether the account is currently on a free trial.
    boolean on_free_trial?;
    # The date the free trial ends, in ISO 8601 format.
    string? free_trial_ends_on?;
    # The date of the next billing charge, in ISO 8601 format.
    string? next_billing_date?;
    # The Marketplace plan associated with the purchase.
    Plan plan;
};

# The GitHub account (user or organization) that made the Marketplace purchase.
public type Account record {
    # The type of account, either User or Organization.
    string 'type;
    # The unique identifier of the resource.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # The username or organization login of the account.
    string login;
    # The organization's billing email address, if applicable.
    string? organization_billing_email?;
};

# The Marketplace plan associated with the purchase.
public type Plan record {
    # The unique identifier of the resource.
    int id;
    # The name of the Marketplace plan.
    string name;
    # The description of the Marketplace plan.
    string description;
    # The monthly price of the plan, in cents.
    int monthly_price_in_cents;
    # The yearly price of the plan, in cents.
    int yearly_price_in_cents;
    # The pricing model of the plan, e.g. FLAT_RATE or PER_UNIT.
    string price_model;
    # Whether the plan offers a free trial.
    boolean has_free_trial?;
    # The name of the unit used to calculate pricing, e.g. seat.
    string? unit_name?;
    # The list of feature bullet points describing the plan.
    string[] bullets?;
};

# Payload for secret_scanning_alert_location events
public type SecretScanningAlertLocationPayload record {
    # The existing secret scanning alert the location was added to
    Alert alert;
    # The location where the secret was found
    Location location;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The existing secret scanning alert the location was added to
public type Alert record {
    # The security alert number.
    int number;
    # The type of secret that secret scanning detected.
    string secret_type;
};

# Location details; shape varies by type
public type Details record {
    # The file path in the repository.
    string path?;
    # Line number at which the secret starts in the file.
    int start_line?;
    # Line number at which the secret ends in the file.
    int end_line?;
    # The column at which the secret starts within the start line when the file is interpreted as 8BIT ASCII.
    int start_column?;
    # The column at which the secret ends within the end line when the file is interpreted as 8BIT ASCII.
    int end_column?;
    # SHA-1 hash ID of the associated blob.
    string blob_sha?;
    # The API URL to get the associated blob resource.
    string blob_url?;
    # SHA-1 hash ID of the associated commit.
    string commit_sha?;
    # The API URL to get the associated commit resource.
    string commit_url?;
};

# The location where the secret was found
public type Location record {
    # The location type. Because secrets may be found in different types of resources (ie. code, comments, issues, pull requests, discussions), this field identifies the type of resource where the secret was found.
    string 'type;
    # Location details; shape varies by type
    Details details?;
};

# Payload for deployment_review events
public type DeploymentReviewPayload record {
    # The action that was performed. Can be one of: requested, approved, rejected.
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
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Team reviewer
public type 'ReviewerBranch1 record {
    # Unique identifier of the team.
    int id?;
    # The node ID of the team.
    string node_id?;
    # Name of the team.
    string name?;
    # The URL-friendly slug of the team's name.
    string slug?;
    # Description of the team.
    string? description?;
    # The level of privacy this team should have.
    string privacy?;
    # Permission that the team will have for its repositories.
    string permission?;
    # URL for the team.
    string html_url?;
};

# A User or Team object depending on type
public type Reviewer anydata|'ReviewerBranch1;

# A user or team requested as, or acting as, a deployment reviewer.
public type ReviewersItem record {
    # The type of the reviewer, either User or Team.
    string 'type?;
    # A User or Team object depending on type
    Reviewer reviewer?;
};

# The workflow run associated with the deployment
public type DeploymentReviewPayloadWorkflowRun record {
    # The ID of the workflow run.
    int id;
    # The name of the workflow run.
    string? name;
    # The SHA of the head commit that points to the version of the workflow being run.
    string head_sha?;
    # The branch that triggered the workflow run.
    string? head_branch?;
    # The auto incrementing run number for the workflow run.
    int run_number?;
    # The status of the workflow run.
    string status?;
    # The result of the completed workflow run.
    string? conclusion?;
    # The URL to view the workflow run on GitHub.
    string html_url?;
    # Pull requests that are open with a `head_sha` or `head_branch` that matches the workflow run. The returned pull requests do not necessarily indicate pull requests that triggered the run.
    PullRequestMinimal[] pull_requests?;
};

# A pull request
public type PullRequest record {
    # The unique identifier of the resource.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # The API URL of the resource.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The URL to the pull request's diff in unified diff format.
    string diff_url?;
    # The URL to the pull request's patch file.
    string patch_url?;
    # Number uniquely identifying the pull request within its repository.
    int number;
    # State of this Pull Request. Either `open` or `closed`.
    string state;
    # Whether the pull request's conversation is locked.
    boolean locked?;
    # The title of the pull request.
    string title;
    # The pull request's description text.
    string? body?;
    # A GitHub user
    User user?;
    # The labels attached to the pull request.
    Label[] labels?;
    # A GitHub user
    User? assignee?;
    # The users assigned to the pull request.
    User[] assignees?;
    # A milestone on an issue or pull request
    Milestone milestone?;
    # A pull request head or base ref
    PullRequestRef head?;
    # A pull request head or base ref
    PullRequestRef base?;
    # Indicates whether or not the pull request is a draft.
    boolean draft?;
    # Whether the pull request has been merged.
    boolean? merged?;
    # Whether the pull request can be merged into its base branch.
    boolean? mergeable?;
    # Whether the pull request can be rebased against its base branch.
    boolean? rebaseable?;
    # The mergeability state of the pull request, e.g. clean or dirty.
    string mergeable_state?;
    # The SHA of the merge commit, or the last commit if not yet merged.
    string? merge_commit_sha?;
    # The number of issue comments on the pull request.
    int comments?;
    # The number of review comments on the pull request.
    int review_comments?;
    # The number of commits in the pull request.
    int commits?;
    # The number of lines added across the pull request's commits.
    int additions?;
    # The number of lines deleted across the pull request's commits.
    int deletions?;
    # The number of files changed in the pull request.
    int changed_files?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # The date and time the pull request was closed, in ISO 8601 format.
    string? closed_at?;
    # The date and time the pull request was merged, in ISO 8601 format.
    string? merged_at?;
    # A GitHub user
    User? merged_by?;
    # How the author is associated with the repository.
    string author_association?;
    # Details of an auto-merge request, if one is enabled on this pull request
    AutoMerge? auto_merge?;
};

# Details of an auto-merge request, if one is enabled on this pull request
public type AutoMerge record {
    # A GitHub user
    User enabled_by?;
    # The merge method to use.
    string merge_method?;
    # Title for the merge commit message.
    string commit_title?;
    # Commit message for the merge commit.
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
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Payload for issue_comment events
public type IssueCommentPayload record {
    # The action that was performed. Can be one of: created, edited, deleted, pinned, unpinned.
    string action;
    # An issue on GitHub
    Issue issue;
    # A comment on an issue or pull request
    IssueComment comment;
    # For edited events, the changes to the comment
    IssueCommentPayloadChanges changes?;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The comment's previous body text, before this edit.
public type IssueCommentPayloadBody record {
    # The previous value, before this change.
    string 'from?;
};

# For edited events, the changes to the comment
public type IssueCommentPayloadChanges record {
    # The comment's previous body text, before this edit.
    IssueCommentPayloadBody body;
};

# Payload for deployment_status events
public type DeploymentStatusPayload record {
    # The action that was performed. Always created.
    string action;
    # A deployment request for a specific ref
    Deployment deployment;
    # A deployment status
    DeploymentStatus deployment_status;
    # A check performed on the code of a given code change
    CheckRun? check_run?;
    # A GitHub Actions workflow
    Workflow? workflow?;
    # A GitHub Actions workflow run
    WorkflowRun? workflow_run?;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Payload for organization events
public type OrganizationPayload record {
    # The action that was performed. Can be one of: member_added, member_removed, member_invited, renamed, deleted.
    string action;
    # The membership between the user and the organization.
    # Not present when the action is member_invited.
    Membership? membership?;
    # Present when action is member_invited
    Invitation? invitation?;
    # For renamed events, the old and new organization name
    OrganizationPayloadChanges? changes?;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The membership between the user and the organization.
# Not present when the action is member_invited.
public type Membership record {
    # The API URL of the resource.
    string url?;
    # The state of the member in the organization. The `pending` state indicates the user has not yet accepted an invitation.
    string state?;
    # The user's membership type in the organization.
    string role?;
    # The API URL of the organization.
    string organization_url?;
    # A GitHub user
    User user?;
};

# Present when action is member_invited
public type Invitation record {
    # The unique identifier of the resource.
    int id;
    # The username of the invited user, if known.
    string? login?;
    # The email address of the invited user, if known.
    string? email?;
    # The role assigned to the invited user, e.g. admin, direct_member, or billing_manager.
    string role;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at;
    # The date and time the invitation failed, in ISO 8601 format, if applicable.
    string? failed_at?;
    # The reason the invitation failed, if applicable.
    string? failed_reason?;
    # A GitHub user
    User inviter;
    # The number of teams the invitation grants membership to.
    int team_count;
    # The GraphQL node ID.
    string node_id;
    # The API URL listing the teams included in this invitation.
    string invitation_teams_url;
    # The source through which the invitation was created, e.g. member or scim.
    string? invitation_source?;
};

# The organization's previous login (name), before this rename.
public type Login record {
    # The previous value, before this change.
    string 'from?;
};

# For renamed events, the old and new organization name
public type OrganizationPayloadChanges record {
    # The organization's previous login (name), before this rename.
    Login login?;
};

# HTTP headers sent with every GitHub webhook delivery.
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
    # A GitHub App installation
    Installation installation?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Payload for merge_group events
public type MergeGroupPayload record {
    # The action that was performed. Can be one of: checks_requested, destroyed.
    string action;
    # A group of pull requests grouped together by the merge queue
    MergeGroup merge_group;
    # For destroyed action, the reason the merge group was destroyed
    string? reason?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
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
    # A Git commit
    Commit head_commit?;
};

# Payload for workflow_job events
public type WorkflowJobPayload record {
    # The action that was performed. Can be one of: queued, waiting, completed, in_progress.
    string action;
    # A job in a GitHub Actions workflow run
    WorkflowJob workflow_job;
    # The deployment associated with the workflow job (if applicable)
    Deployment deployment?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Payload for org_block events
public type OrgBlockPayload record {
    # The action that was performed. Can be one of: blocked, unblocked.
    string action;
    # A GitHub user
    User? blocked_user;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A GitHub Sponsors tier
public type Tier record {
    # The GraphQL node ID.
    string node_id;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # A description of the sponsorship tier.
    string description?;
    # The monthly price of the tier, in cents.
    int monthly_price_in_cents;
    # The monthly price of the tier, in dollars.
    int monthly_price_in_dollars;
    # The name of the sponsorship tier.
    string name;
    # Whether this is a one-time, non-recurring sponsorship tier.
    boolean is_one_time?;
    # Whether the sponsor can choose a custom amount for this tier.
    boolean is_custom_amount?;
};

# Payload for dependabot_alert events
public type DependabotAlertPayload record {
    # The action that was performed. Can be one of: created, dismissed, reopened, reintroduced, fixed, auto_dismissed, auto_reopened, assignees_changed.
    string action;
    # A Dependabot alert
    DependabotAlertPayloadAlert alert;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Details for the vulnerable dependency.
public type Dependency record {
    # The ecosystem and name identifying a Dependabot-tracked package
    Package package?;
    # The full path to the dependency manifest file, relative to the root of the repository.
    string manifest_path?;
    # The execution scope of the vulnerable dependency.
    string? scope?;
};

# Details for the GitHub Security Advisory linked to the alert.
public type SecurityAdvisory record {
    # The GitHub Security Advisory ID.
    string ghsa_id?;
    # The CVE ID associated with the advisory, if any.
    string? cve_id?;
    # A short summary of the security advisory.
    string summary?;
    # A detailed description of the security advisory.
    string description?;
    # The severity of the advisory, e.g. low, medium, high, or critical.
    string severity?;
    # The list of package versions affected by this advisory.
    SecurityVulnerability[] vulnerabilities?;
};

# A Dependabot alert
public type DependabotAlertPayloadAlert record {
    # The security alert number.
    int number;
    # The state of the Dependabot alert.
    string state;
    # Details for the vulnerable dependency.
    Dependency dependency?;
    # Details for the GitHub Security Advisory linked to the alert.
    SecurityAdvisory security_advisory?;
    # A vulnerable version range affecting a package, and the version it was patched in
    SecurityVulnerability security_vulnerability?;
    # The REST API URL of the alert resource.
    string url?;
    # The GitHub URL of the alert resource.
    string html_url?;
    # The time that the alert was created in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string created_at?;
    # The time that the alert was last updated in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string updated_at?;
    # The time that the alert was dismissed in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string? dismissed_at?;
    # A GitHub user
    User? dismissed_by?;
    # The reason that the alert was dismissed.
    string? dismissed_reason?;
    # An optional comment associated with the alert's dismissal.
    string? dismissed_comment?;
    # The time that the alert was no longer detected and was considered fixed in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string? fixed_at?;
    # The time that the alert was auto-dismissed in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string? auto_dismissed_at?;
    # The users assigned to this alert.
    User[] assignees?;
};

# A GitHub Actions workflow
public type Workflow record {
    # The unique identifier of the resource.
    int id?;
    # The GraphQL node ID.
    string node_id?;
    # The name of the workflow.
    string name?;
    # The path of the workflow file relative to the repository root.
    string path?;
    # The state of the workflow, e.g. active or disabled_manually.
    string state?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # The API URL of the resource.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The URL of the workflow's status badge image.
    string badge_url?;
};

# An actor allowed to dismiss pull request reviews
public type RuleActor record {
    # The ID of the actor that can bypass the rule.
    int id;
    # The type of actor that can bypass the rule.
    string 'type;
};

# Payload for custom_property_values events
public type CustomPropertyValuesPayload record {
    # The action that was performed. Always updated.
    string action;
    # The new custom property values for the repository
    NewPropertyValuesItem[] new_property_values;
    # The old custom property values for the repository
    OldPropertyValuesItem[] old_property_values;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The new value of a custom property on the repository.
public type NewPropertyValuesItem record {
    # The name of the custom property.
    string property_name;
    # String or array of strings
    anydata? value?;
};

# The previous value of a custom property on the repository.
public type OldPropertyValuesItem record {
    # The name of the custom property.
    string property_name;
    # String or array of strings
    anydata? value?;
};

# Payload for secret_scanning_alert events
public type SecretScanningAlertPayload record {
    # The action that was performed. Can be one of: assigned, reopened, unassigned, created, publicly_leaked, validated, resolved.
    string action;
    # The secret scanning alert
    SecretScanningAlertPayloadAlert alert;
    # Present on assigned/unassigned actions
    User? assignee?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The secret scanning alert
public type SecretScanningAlertPayloadAlert record {
    # The security alert number.
    int number;
    # The time that the alert was created in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string created_at?;
    # The time that the alert was last updated in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string? updated_at?;
    # The REST API URL of the alert resource.
    string url?;
    # The GitHub URL of the alert resource.
    string html_url?;
    # The REST API URL of the code locations for this alert.
    string locations_url?;
    # The state of the secret scanning alert. Can be open or resolved.
    string state;
    # The reason for resolving the alert.
    string? resolution?;
    # The time that the alert was resolved in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string? resolved_at?;
    # A GitHub user
    User? resolved_by?;
    # An optional comment to resolve an alert.
    string? resolution_comment?;
    # The type of secret that was detected
    string secret_type?;
    # User-friendly name for the detected secret, matching the `secret_type`.
    string secret_type_display_name?;
    # The token status as of the latest validity check.
    string validity?;
    # Whether the detected secret was publicly leaked.
    boolean publicly_leaked?;
    # Whether the detected secret was found in multiple repositories under the same organization or enterprise.
    boolean multi_repo?;
    # Whether push protection was bypassed for the detected secret.
    boolean? push_protection_bypassed?;
    # A GitHub user
    User? push_protection_bypassed_by?;
    # The time that push protection was bypassed in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string? push_protection_bypassed_at?;
};

# Payload for pull_request_review_thread events
public type PullRequestReviewThreadPayload record {
    # The action that was performed. Can be one of: resolved, unresolved.
    string action;
    # A pull request
    PullRequest pull_request;
    # The review thread that was resolved or unresolved
    PullRequestReviewThreadPayloadThread thread;
    # The date and time the resource was last updated, in ISO 8601 format.
    string? updated_at?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The review thread that was resolved or unresolved
public type PullRequestReviewThreadPayloadThread record {
    # The GraphQL node ID.
    string node_id?;
    # The review comments in this conversation thread.
    PullRequestReviewComment[] comments?;
};

# A workflow that must run for this rule to pass
public type RuleWorkflowFileReference record {
    # The path to the workflow file.
    string path;
    # The ref (branch or tag) of the workflow file to use.
    string ref?;
    # The ID of the repository where the workflow is defined.
    int repository_id;
    # The commit SHA of the workflow file to use.
    string sha?;
};

# Specify people, teams, or apps allowed to dismiss pull request reviews.
public type RuleDismissalRestriction record {
    # Specify people, teams, or apps allowed to dismiss pull request reviews.
    RuleActor[] allowed_actors?;
    # Whether to restrict review dismissal to specific actors.
    boolean enabled;
};

# A comment on an issue or pull request
public type IssueComment record {
    # Unique identifier of the issue comment.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # URL for the issue comment.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # Contents of the issue comment.
    string body;
    # A GitHub user
    User user?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # How the author is associated with the repository.
    string author_association?;
};

# Shared by the 5 pattern-matching ruleset rules (commit_message_pattern,
# commit_author_email_pattern, committer_email_pattern, branch_name_pattern,
# tag_name_pattern) - identical parameters shape for all five per GitHub's own schema.
public type RulePatternParameters record {
    # How this rule appears when configuring it.
    string name?;
    # If true, the rule will fail if the pattern matches.
    boolean negate?;
    # The operator to use for matching.
    string operator;
    # The pattern to match with.
    string pattern;
};

# Payload for registry_package events (legacy GitHub Packages event)
public type RegistryPackagePayload record {
    # The action that was performed. Can be one of: published, updated.
    string action;
    # The registry package object
    RegistryPackage registry_package;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A single downloadable file within a package version.
public type PackageFilesItem record {
    # The URL to download this package file.
    string download_url?;
    # The unique identifier of the resource.
    int id?;
    # The file name of the package file.
    string name?;
    # The SHA-256 checksum of the package file.
    string 'sha256?;
    # The MIME content type of the package file.
    string content_type?;
    # The size of the package file, in bytes.
    int size?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
};

# A specific published version of a package.
public type PackageVersion record {
    # The unique identifier of the resource.
    int id?;
    # The version string of the package.
    string 'version?;
    # A short summary describing the package version.
    string summary?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The branch or commit associated with this package version.
    string target_commitish?;
    # The SHA of the commit associated with this package version.
    string target_oid?;
    # Whether this package version is a draft.
    boolean draft?;
    # Whether this package version is a prerelease.
    boolean prerelease?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # The list of downloadable files for this package version.
    PackageFilesItem[] package_files?;
    # A GitHub user
    User author?;
    # The command used to install this package version.
    string? installation_command?;
};

# The package registry a package version was published to.
public type Registry record {
    # The URL with more information about the registry.
    string about_url?;
    # The name of the package registry.
    string name?;
    # The type of the package registry, e.g. npm or docker.
    string 'type?;
    # The API URL of the resource.
    string url?;
    # The vendor of the package registry.
    string vendor?;
};

# The registry package object
public type RegistryPackage record {
    # Unique identifier of the package.
    int id;
    # The name of the package.
    string name;
    # The namespace of the package, e.g. npm scope or repository owner.
    string namespace?;
    # A short description of the package.
    string? description?;
    # The package ecosystem (e.g. npm, docker, maven, nuget, rubygems).
    string ecosystem?;
    # The package registry type, e.g. maven, container, docker, npm, nuget, or rubygems.
    string package_type;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # A GitHub user
    User owner?;
    # A specific published version of a package.
    PackageVersion? package_version?;
    # The package registry a package version was published to.
    Registry? registry?;
};

# The ecosystem and name identifying a Dependabot-tracked package
public type Package record {
    # The package's language or package management ecosystem.
    string ecosystem?;
    # The unique package name within its ecosystem.
    string name?;
};

# Payload for check_suite events
public type CheckSuitePayload record {
    # The action that was performed. Can be one of: completed, requested, rerequested.
    string action;
    # A check suite
    CheckSuite check_suite;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Payload for discussion_comment events
public type DiscussionCommentPayload record {
    # The action that was performed. Can be one of: created, edited, deleted.
    string action;
    # The discussion comment
    Comment comment;
    # A GitHub Discussion in a repository
    Discussion discussion;
    # For edited events, the changes to the comment
    DiscussionCommentPayloadChanges changes?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The discussion comment
public type Comment record {
    # The unique identifier of the resource.
    int id?;
    # The GraphQL node ID.
    string node_id?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The text of the discussion comment.
    string body?;
    # A GitHub user
    User user?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # How the author is associated with the repository.
    string author_association?;
};

# The comment's previous body text, before this edit.
public type DiscussionCommentPayloadBody record {
    # The previous value, before this change.
    string 'from?;
};

# For edited events, the changes to the comment
public type DiscussionCommentPayloadChanges record {
    # The comment's previous body text, before this edit.
    DiscussionCommentPayloadBody body?;
};

# A GitHub organization
public type Organization record {
    # The organization's login name.
    string login?;
    # The unique identifier of the resource.
    int id?;
    # The GraphQL node ID.
    string node_id?;
    # The API URL of the resource.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The API URL listing the organization's repositories.
    string repos_url?;
    # The URL of the user's or organization's avatar image.
    string avatar_url?;
    # A short description of the organization.
    string? description?;
};

# Payload for repository_import events. Fired when a repository import
# finishes on GitHub.com. No action field.
public type RepositoryImportPayload record {
    # The final status of the import
    string status;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
};

# Payload for repository events
public type RepositoryPayload record {
    # The action that was performed. Can be one of: created, deleted, archived, unarchived, edited, renamed, transferred, publicized, privatized.
    string action;
    # For edited/renamed/transferred events, the changes that occurred
    RepositoryPayloadChanges changes?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The repository's previous description, before this edit.
public type Description record {
    # The previous value, before this change.
    string? 'from?;
};

# The repository's previous homepage URL, before this edit.
public type Homepage record {
    # The previous value, before this change.
    string? 'from?;
};

# The repository's previous topics, before this edit.
public type Topics record {
    # The previous value, before this change.
    string[] 'from?;
};

# The repository's previous default branch, before this edit.
public type DefaultBranch record {
    # The previous value, before this change.
    string 'from?;
};

# The repository's previous name, before this rename.
public type RepositoryPayloadName record {
    # The previous value, before this change.
    string 'from?;
};

# Present for a renamed event
public type RepositoryPayloadRepository record {
    # The repository's previous name, before this rename.
    RepositoryPayloadName name?;
};

# The previous value, before this change.
public type 'from record {
    # A GitHub user
    User user?;
    # A GitHub organization
    Organization organization?;
};

# Present for a transferred event
public type Owner record {
    # The previous value, before this change.
    'from 'from?;
};

# For edited/renamed/transferred events, the changes that occurred
public type RepositoryPayloadChanges record {
    # The repository's previous description, before this edit.
    Description description?;
    # The repository's previous homepage URL, before this edit.
    Homepage homepage?;
    # The repository's previous topics, before this edit.
    Topics topics?;
    # The repository's previous default branch, before this edit.
    DefaultBranch default_branch?;
    # Present for a renamed event
    RepositoryPayloadRepository repository?;
    # Present for a transferred event
    Owner owner?;
};

# Payload for star events
public type StarPayload record {
    # The action that was performed. Can be one of: created, deleted.
    string action;
    # The time the star was created (ISO 8601). Null for the deleted action.
    string? starred_at;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A vulnerable version range affecting a package, and the version it was patched in
public type SecurityVulnerability record {
    # The ecosystem and name identifying a Dependabot-tracked package
    Package package?;
    # The severity of the vulnerability.
    string severity?;
    # Conditions that identify vulnerable versions of this vulnerability's package.
    string vulnerable_version_range?;
    # Details pertaining to the package version that patches this vulnerability.
    FirstPatchedVersion? first_patched_version?;
};

# Details pertaining to the package version that patches this vulnerability.
public type FirstPatchedVersion record {
    # The package version that patches this vulnerability.
    string identifier?;
};

# Payload for watch events (someone started watching the repository)
public type WatchPayload record {
    # The action that was performed. Always started.
    string action;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Payload for package events (GitHub Packages)
public type PackagePayload record {
    # The action that was performed. Can be one of: published, updated.
    string action;
    # Information about the package
    PackagePayloadPackage package;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A reduced Release shape as delivered on a package version, not the full
# Release resource (missing node_id, assets_url, upload_url, body, assets) -
# must not $ref Release.
public type PackagePayloadRelease record {
    # The API URL of the resource.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The unique identifier of the resource.
    int id?;
    # The name of the tag.
    string tag_name?;
    # Specifies the commitish value that determines where the Git tag is created from.
    string target_commitish?;
    # The name of the release.
    string? name?;
    # Whether the release is a draft or published.
    boolean draft?;
    # A GitHub user
    User author?;
    # Whether the release is identified as a prerelease or a full release.
    boolean prerelease?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the release was published, in ISO 8601 format.
    string? published_at?;
};

# The digest and name of a container image tag.
public type Tag record {
    # The digest of the container image tag.
    string digest?;
    # The name of the container image tag.
    string name?;
};

# Metadata for a container (Docker) package version
public type ContainerMetadata record {
    # The digest and name of a container image tag.
    Tag tag?;
    # Untyped even in GitHub's own webhook schema - genuinely open, not incomplete.
    map<json>? labels?;
    # Untyped even in GitHub's own webhook schema - genuinely open, not incomplete.
    map<json>? manifest?;
};

# Metadata for an npm package version.
public type NpmMetadata record {
    # The name of the npm package.
    string name?;
    # The version of the npm package.
    string 'version?;
    # The npm username of the publisher.
    string npm_user?;
    # The author of the npm package, as recorded in package.json.
    map<json>? author?;
    # The bug tracker information from package.json.
    map<json>? bugs?;
    # The package's runtime dependencies, as recorded in package.json.
    map<json> dependencies?;
    # The development dependencies declared in the package's package.json.
    map<json> dev_dependencies?;
    # The peer dependencies declared in the package's package.json.
    map<json> peer_dependencies?;
    # The optional dependencies declared in the package's package.json.
    map<json> optional_dependencies?;
    # The description declared in the package's package.json.
    string description?;
    # The npm registry distribution metadata for this version (e.g. tarball URL, checksum).
    map<json>? dist?;
    # The Git commit SHA the package was published from, if recorded.
    string git_head?;
    # The homepage URL declared in the package's package.json.
    string homepage?;
    # The license identifier declared in the package's package.json.
    string license?;
    # The path to the package's main entry file, as declared in package.json.
    string main?;
    # The source repository declared in the package's package.json.
    map<json>? repository?;
    # The npm scripts declared in the package's package.json.
    map<json> scripts?;
    # The unique identifier of the resource.
    string id?;
    # The Node.js version used to publish this package version.
    string node_version?;
    # The npm client version used to publish this package version.
    string npm_version?;
    # Whether the package version includes an npm-shrinkwrap.json file.
    boolean has_shrinkwrap?;
    # The list of maintainers declared for this package on the npm registry.
    map<json>[] maintainers?;
    # The list of contributors declared in the package's package.json.
    map<json>[] contributors?;
    # The Node.js/npm version constraints declared in the package's package.json.
    map<json> engines?;
    # The keywords declared in the package's package.json.
    string[] keywords?;
    # The file patterns to include when publishing, as declared in package.json.
    string[] files?;
    # The executable scripts declared in the package's package.json.
    map<json> bin?;
    # The man page files declared in the package's package.json.
    map<json> man?;
    # The directory layout hints declared in the package's package.json.
    map<json>? directories?;
    # The operating systems this package version supports, as declared in package.json.
    string[] os?;
    # The CPU architectures this package version supports, as declared in package.json.
    string[] cpu?;
    # The contents of the package's README file.
    string readme?;
    # The command used to install this package version.
    string installation_command?;
    # The identifier of the GitHub release associated with this package version.
    int release_id?;
    # The Git commit SHA associated with this package version.
    string commit_oid?;
    # Whether this package version was published via a GitHub Actions workflow.
    boolean published_via_actions?;
    # The identifier of the user who deleted this package version, if applicable.
    int deleted_by_id?;
};

# A single metadata entry for a NuGet package version.
public type NugetMetadataItem record {
    # Real payloads may send this as either an integer or a string
    string id?;
    # The name of this metadata attribute, as defined in the package's .nuspec file.
    string name?;
    # Real payloads may send this as a boolean, string, integer, or an object
    # with url/branch/commit/type fields - kept as string here since AsyncAPI
    # schemas have no first-class "any of these primitive types" construct;
    # the object variant's fields are lost by this simplification.
    string value?;
};

# Version information for a RubyGems package.
public type VersionInfo record {
    # The version string of this RubyGems package.
    string 'version?;
};

# Metadata for a RubyGems package version.
public type RubygemsMetadataItem record {
    # The name of this RubyGems package.
    string name?;
    # The description of this RubyGems package.
    string description?;
    # The contents of this RubyGems package's README file.
    string readme?;
    # The homepage URL of this RubyGems package.
    string homepage?;
    # Version information for a RubyGems package.
    VersionInfo version_info?;
    # The target platform of this RubyGems package (e.g. ruby, java).
    string platform?;
    # Additional key-value metadata declared in the package's gemspec.
    map<json> metadata?;
    # The source repository URL of this RubyGems package.
    string repo?;
    # The runtime dependencies declared in the package's gemspec.
    map<json>[] dependencies?;
    # The Git commit SHA associated with this package version.
    string commit_oid?;
};

# A single downloadable file within a published package version
public type PackagePayloadPackageFilesItem record {
    # The URL to download this package file.
    string download_url?;
    # The unique identifier of the resource.
    int id?;
    # The file name of this package file.
    string name?;
    # The SHA-256 checksum of this package file.
    string 'sha256?;
    # The SHA-1 checksum of this package file.
    string 'sha1?;
    # The MD5 checksum of this package file.
    string 'md5?;
    # The MIME type of this package file.
    string content_type?;
    # The upload state of this package file (e.g. uploaded).
    string state?;
    # The size of this package file, in bytes.
    int size?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
};

# The published version of a package, including registry-specific metadata.
public type PackagePayloadPackageVersion record {
    # The unique identifier of the resource.
    int id?;
    # The version string of this package version.
    string 'version?;
    # A short summary of this package version.
    string? summary?;
    # The name of the package this version belongs to.
    string name?;
    # The description of this package version.
    string? description?;
    # The release notes body for this package version, in Markdown.
    string? body?;
    # The release notes body for this package version, rendered as HTML.
    string? body_html?;
    # A reduced Release shape as delivered on a package version, not the full
    # Release resource (missing node_id, assets_url, upload_url, body, assets) -
    # must not $ref Release.
    PackagePayloadRelease? release?;
    # The raw package manifest file content for this version.
    string? manifest?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The name of the Git tag associated with this package version.
    string? tag_name?;
    # The branch or commit the associated Git tag targets.
    string target_commitish?;
    # The resolved Git commit SHA that the associated tag targets.
    string target_oid?;
    # Whether this package version is a draft.
    boolean draft?;
    # Whether this package version is a prerelease.
    boolean prerelease?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # Genuinely arbitrary per GitHub's own webhook schema - each entry declares no
    # fixed shape (additionalProperties: true, no properties), confirmed via
    # github/rest-api-description's webhook-package-published schema.
    map<json>[] metadata?;
    # Metadata for a container (Docker) package version
    ContainerMetadata? container_metadata?;
    # Metadata for an npm package version.
    NpmMetadata? npm_metadata?;
    # NuGet-specific metadata for this package version.
    NugetMetadataItem[]? nuget_metadata?;
    # RubyGems-specific metadata for this package version.
    RubygemsMetadataItem[]? rubygems_metadata?;
    # The downloadable files included in this package version.
    PackagePayloadPackageFilesItem[] package_files?;
    # The URL to view this package version.
    string? package_url?;
    # A GitHub user
    User author?;
    # The URL of the source repository for this package version.
    string? source_url?;
    # The command used to install this package version.
    string? installation_command?;
};

# The package registry a package version was published to.
public type PackagePayloadRegistry record {
    # The URL with more information about this registry.
    string about_url?;
    # The name of the registry.
    string name?;
    # The type of the registry.
    string 'type?;
    # The API URL of the resource.
    string url?;
    # The vendor that operates this registry.
    string vendor?;
};

# Information about the package
public type PackagePayloadPackage record {
    # Unique identifier of the package.
    int id;
    # The name of the package.
    string name;
    # The namespace of the package, e.g. npm scope or repository owner.
    string namespace?;
    # A short description of the package.
    string? description?;
    # The package ecosystem (e.g. npm, docker, maven, nuget, rubygems).
    string ecosystem?;
    # The package registry type, e.g. maven, container, docker, npm, nuget, or rubygems.
    string package_type?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # A GitHub user
    User owner?;
    # The published version of a package, including registry-specific metadata.
    PackagePayloadPackageVersion? package_version?;
    # The package registry a package version was published to.
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
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A tool that must provide code scanning results for this rule to pass.
public type RuleCodeScanningTool record {
    # The severity level at which code scanning results that raise alerts block a reference update.
    string alerts_threshold;
    # The severity level at which code scanning results that raise security alerts block a reference update.
    string security_alerts_threshold;
    # The name of a code scanning tool.
    string tool;
};

# Payload for sponsorship events
public type SponsorshipPayload record {
    # The action that was performed. Can be one of: created, cancelled, edited, tier_changed, pending_cancellation, pending_tier_change.
    string action;
    # The sponsorship object
    Sponsorship sponsorship;
    # For edited, tier_changed, and pending_tier_change events
    SponsorshipPayloadChanges? changes?;
    # For pending_cancellation and pending_tier_change, the date the
    # change takes effect (ISO 8601 date).
    string? effective_date?;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
};

# The sponsorship object
public type Sponsorship record {
    # The GraphQL node ID.
    string node_id;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at;
    # Whether the sponsorship is publicly visible (public or private).
    string privacy_level;
    # A GitHub Sponsors tier
    Tier tier;
    # A GitHub user
    User sponsor;
    # A GitHub user
    User sponsorable;
};

# The sponsorship's previous tier, before this change.
public type SponsorshipPayloadTier record {
    # A GitHub Sponsors tier
    Tier 'from?;
};

# The sponsorship's previous privacy level, before this change.
public type PrivacyLevel record {
    # The previous value, before this change.
    string 'from?;
};

# For edited, tier_changed, and pending_tier_change events
public type SponsorshipPayloadChanges record {
    # The sponsorship's previous tier, before this change.
    SponsorshipPayloadTier tier?;
    # The sponsorship's previous privacy level, before this change.
    PrivacyLevel privacy_level?;
};

# Payload for sub_issues events
public type SubIssuesPayload record {
    # The action that was performed. Can be one of: sub_issue_added, sub_issue_removed, parent_issue_added, parent_issue_removed.
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
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Payload for project_column events (classic project columns).
# Note: classic Projects are deprecated; use projects_v2 instead.
public type ProjectColumnPayload record {
    # The action that was performed. Can be one of: created, edited, moved, deleted.
    string action;
    # A column in a classic project board
    ProjectColumn project_column;
    # For edited events, the changes made to the column
    ProjectColumnPayloadChanges? changes?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A column in a classic project board
public type ProjectColumn record {
    # The unique identifier of the project column.
    int id;
    # The GraphQL node ID.
    string node_id;
    # The API URL of the resource.
    string url?;
    # The API URL of the project this column belongs to.
    string project_url?;
    # The API URL listing the cards in this column.
    string cards_url?;
    # Name of the project column.
    string name;
    # The ID of the column this column was moved after
    int? after_id?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
};

# The column's previous name, before this edit.
public type ProjectColumnPayloadName record {
    # The previous value, before this change.
    string 'from?;
};

# For edited events, the changes made to the column
public type ProjectColumnPayloadChanges record {
    # The column's previous name, before this edit.
    ProjectColumnPayloadName name?;
};

# A GitHub organization team
public type Team record {
    # Unique identifier of the team.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # Name of the team.
    string name;
    # The URL-friendly identifier of the resource.
    string slug;
    # Description of the team.
    string? description?;
    # The level of privacy this team has (e.g. closed, secret).
    string privacy?;
    # Whether team members will receive notifications when their team is @mentioned.
    string notification_setting?;
    # Permission that the team will have for its repositories.
    string permission?;
    # URL for the team.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The API URL listing the members of this team.
    string members_url?;
    # The API URL listing the repositories associated with this resource.
    string repositories_url?;
    # A reduced "team-simple" shape, not a full Team - no nested parent (a team's parent
    # is never itself nested further, avoiding unbounded recursion).
    Parent? parent?;
};

# A reduced "team-simple" shape, not a full Team - no nested parent (a team's parent
# is never itself nested further, avoiding unbounded recursion).
public type Parent record {
    # Unique identifier of the team.
    int id;
    # The GraphQL node ID.
    string node_id;
    # URL for the team.
    string url?;
    # The API URL listing the members of this team.
    string members_url?;
    # Name of the team.
    string name;
    # Description of the team.
    string? description?;
    # Permission that the team will have for its repositories.
    string permission?;
    # The level of privacy this team should have.
    string privacy?;
    # The notification setting the team has set.
    string notification_setting?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The API URL listing the repositories associated with this resource.
    string repositories_url?;
    # The URL-friendly identifier of the resource.
    string slug;
    # The ownership type of the team.
    string 'type;
    # Unique identifier of the organization to which this team belongs.
    int organization_id?;
    # Unique identifier of the enterprise to which this team belongs.
    int enterprise_id?;
};

# Payload for marketplace_purchase events
public type MarketplacePurchasePayload record {
    # The action that was performed. Can be one of: purchased, cancelled, pending_change, pending_change_cancelled, changed.
    string action;
    # The GitHub Marketplace purchase
    MarketplacePurchase marketplace_purchase;
    # The previous purchase state (for changed/pending_change events)
    MarketplacePurchase? previous_marketplace_purchase?;
    # ISO 8601 date when the change takes effect
    string effective_date;
    # A GitHub user
    User sender;
    # A GitHub App installation
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
    # A Git commit
    Commit? head_commit?;
    # Metaproperties for the Git author/committer
    CommitAuthor pusher;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A GitHub App installation
public type Installation record {
    # The ID of the installation.
    int id?;
    # The GraphQL node ID.
    string node_id?;
};

# Payload for branch_protection_rule events
public type BranchProtectionRulePayload record {
    # The action that was performed. Can be one of: created, edited, deleted.
    string action;
    # The branch protection rule. Includes name and all branch protection
    # settings applied to matching branches. Binary settings are boolean;
    # multi-level configs are off, non_admins, or everyone; actor and
    # build lists are arrays of strings.
    Rule rule;
    # For edited events, the changes to the rule - one entry per changed setting, each wrapped in "from"
    BranchProtectionRulePayloadChanges changes?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The branch protection rule. Includes name and all branch protection
# settings applied to matching branches. Binary settings are boolean;
# multi-level configs are off, non_admins, or everyone; actor and
# build lists are arrays of strings.
public type Rule record {
    # The branch protection rule's database ID.
    int id?;
    # The ID of the repository the rule applies to.
    int repository_id?;
    # The name of the branch, or branch name pattern, the rule applies to.
    string name?;
    # The time the branch protection rule was created, in ISO 8601 format.
    string created_at?;
    # The time the branch protection rule was last updated, in ISO 8601 format.
    string updated_at?;
    # Enforcement level for requiring an approving pull request review before merging.
    string pull_request_reviews_enforcement_level?;
    # The number of approving reviews required on a pull request before merging.
    int required_approving_review_count?;
    # Whether approving reviews are automatically dismissed when someone pushes a new commit.
    boolean dismiss_stale_reviews_on_push?;
    # Whether pull requests are blocked from merging until code owners review them.
    boolean require_code_owner_review?;
    # Whether only specific users, teams, or apps can dismiss pull request reviews.
    boolean authorized_dismissal_actors_only?;
    # Whether approvals from contributors who have also pushed to the branch are ignored when counting required approvals.
    boolean ignore_approvals_from_contributors?;
    # Whether the most recent push to the pull request must be approved by someone other than whoever pushed it.
    boolean require_last_push_approval?;
    # The list of status checks that must pass before merging into the branch.
    string[] required_status_checks?;
    # Enforcement level for required status checks.
    string required_status_checks_enforcement_level?;
    # Whether branches must be up to date with the base branch before merging.
    boolean strict_required_status_checks_policy?;
    # Enforcement level for requiring signed commits.
    string signature_requirement_enforcement_level?;
    # Enforcement level for requiring a linear commit history.
    string linear_history_requirement_enforcement_level?;
    # Whether the branch protection rule's restrictions are also enforced for repository administrators.
    boolean admin_enforced?;
    # Enforcement level for permitting force pushes to matching branches.
    string allow_force_pushes_enforcement_level?;
    # Enforcement level for permitting deletion of matching branches.
    string allow_deletions_enforcement_level?;
    # Enforcement level for requiring merges to go through a merge queue.
    string merge_queue_enforcement_level?;
    # Enforcement level for requiring successful deployments to specific environments before merging.
    string required_deployments_enforcement_level?;
    # Enforcement level for requiring all pull request conversations to be resolved before merging.
    string required_conversation_resolution_level?;
    # Whether only specific users, teams, or apps can push to the branch.
    boolean authorized_actors_only?;
    # The names of the users, teams, or apps authorized to push to the branch.
    string[] authorized_actor_names?;
};

# The rule's previous pull request review enforcement level, before this edit.
public type PullRequestReviewsEnforcementLevel record {
    # The previous value, before this change.
    string 'from?;
};

# The rule's previous required approving review count, before this edit.
public type RequiredApprovingReviewCount record {
    # The previous value, before this change.
    int 'from?;
};

# The rule's previous dismiss-stale-reviews-on-push setting, before this edit.
public type DismissStaleReviewsOnPush record {
    # The previous value, before this change.
    boolean 'from?;
};

# The rule's previous require-code-owner-review setting, before this edit.
public type RequireCodeOwnerReview record {
    # The previous value, before this change.
    boolean 'from?;
};

# The rule's previous authorized-dismissal-actors-only setting, before this edit.
public type AuthorizedDismissalActorsOnly record {
    # The previous value, before this change.
    boolean 'from?;
};

# The rule's previous ignore-approvals-from-contributors setting, before this edit.
public type IgnoreApprovalsFromContributors record {
    # The previous value, before this change.
    boolean 'from?;
};

# The rule's previous require-last-push-approval setting, before this edit.
public type RequireLastPushApproval record {
    # The previous value, before this change.
    boolean 'from?;
};

# The rule's previous list of required status checks, before this edit.
public type RequiredStatusChecks record {
    # The previous value, before this change.
    string[] 'from?;
};

# The rule's previous required status checks enforcement level, before this edit.
public type RequiredStatusChecksEnforcementLevel record {
    # The previous value, before this change.
    string 'from?;
};

# The rule's previous strict required status checks policy setting, before this edit.
public type StrictRequiredStatusChecksPolicy record {
    # The previous value, before this change.
    boolean 'from?;
};

# The rule's previous signature requirement enforcement level, before this edit.
public type SignatureRequirementEnforcementLevel record {
    # The previous value, before this change.
    string 'from?;
};

# The rule's previous linear history requirement enforcement level, before this edit.
public type LinearHistoryRequirementEnforcementLevel record {
    # The previous value, before this change.
    string 'from?;
};

# The rule's previous admin-enforced setting, before this edit.
public type AdminEnforced record {
    # The previous value, before this change.
    boolean 'from?;
};

# The rule's previous allow-force-pushes enforcement level, before this edit.
public type AllowForcePushesEnforcementLevel record {
    # The previous value, before this change.
    string 'from?;
};

# The rule's previous allow-deletions enforcement level, before this edit.
public type AllowDeletionsEnforcementLevel record {
    # The previous value, before this change.
    string 'from?;
};

# The rule's previous merge queue enforcement level, before this edit.
public type MergeQueueEnforcementLevel record {
    # The previous value, before this change.
    string 'from?;
};

# The rule's previous required deployments enforcement level, before this edit.
public type RequiredDeploymentsEnforcementLevel record {
    # The previous value, before this change.
    string 'from?;
};

# The rule's previous required conversation resolution enforcement level, before this edit.
public type RequiredConversationResolutionLevel record {
    # The previous value, before this change.
    string 'from?;
};

# The rule's previous authorized-actors-only setting, before this edit.
public type AuthorizedActorsOnly record {
    # The previous value, before this change.
    boolean 'from?;
};

# The rule's previous list of authorized actor names, before this edit.
public type AuthorizedActorNames record {
    # The previous value, before this change.
    string[] 'from?;
};

# For edited events, the changes to the rule - one entry per changed setting, each wrapped in "from"
public type BranchProtectionRulePayloadChanges record {
    # The rule's previous pull request review enforcement level, before this edit.
    PullRequestReviewsEnforcementLevel pull_request_reviews_enforcement_level?;
    # The rule's previous required approving review count, before this edit.
    RequiredApprovingReviewCount required_approving_review_count?;
    # The rule's previous dismiss-stale-reviews-on-push setting, before this edit.
    DismissStaleReviewsOnPush dismiss_stale_reviews_on_push?;
    # The rule's previous require-code-owner-review setting, before this edit.
    RequireCodeOwnerReview require_code_owner_review?;
    # The rule's previous authorized-dismissal-actors-only setting, before this edit.
    AuthorizedDismissalActorsOnly authorized_dismissal_actors_only?;
    # The rule's previous ignore-approvals-from-contributors setting, before this edit.
    IgnoreApprovalsFromContributors ignore_approvals_from_contributors?;
    # The rule's previous require-last-push-approval setting, before this edit.
    RequireLastPushApproval require_last_push_approval?;
    # The rule's previous list of required status checks, before this edit.
    RequiredStatusChecks required_status_checks?;
    # The rule's previous required status checks enforcement level, before this edit.
    RequiredStatusChecksEnforcementLevel required_status_checks_enforcement_level?;
    # The rule's previous strict required status checks policy setting, before this edit.
    StrictRequiredStatusChecksPolicy strict_required_status_checks_policy?;
    # The rule's previous signature requirement enforcement level, before this edit.
    SignatureRequirementEnforcementLevel signature_requirement_enforcement_level?;
    # The rule's previous linear history requirement enforcement level, before this edit.
    LinearHistoryRequirementEnforcementLevel linear_history_requirement_enforcement_level?;
    # The rule's previous admin-enforced setting, before this edit.
    AdminEnforced admin_enforced?;
    # The rule's previous allow-force-pushes enforcement level, before this edit.
    AllowForcePushesEnforcementLevel allow_force_pushes_enforcement_level?;
    # The rule's previous allow-deletions enforcement level, before this edit.
    AllowDeletionsEnforcementLevel allow_deletions_enforcement_level?;
    # The rule's previous merge queue enforcement level, before this edit.
    MergeQueueEnforcementLevel merge_queue_enforcement_level?;
    # The rule's previous required deployments enforcement level, before this edit.
    RequiredDeploymentsEnforcementLevel required_deployments_enforcement_level?;
    # The rule's previous required conversation resolution enforcement level, before this edit.
    RequiredConversationResolutionLevel required_conversation_resolution_level?;
    # The rule's previous authorized-actors-only setting, before this edit.
    AuthorizedActorsOnly authorized_actors_only?;
    # The rule's previous list of authorized actor names, before this edit.
    AuthorizedActorNames authorized_actor_names?;
};

# Payload for pull_request_review_comment events
public type PullRequestReviewCommentPayload record {
    # The action that was performed. Can be one of: created, deleted, edited.
    string action;
    # A comment on a pull request diff
    PullRequestReviewComment comment;
    # A pull request
    PullRequest pull_request;
    # For edited events, the changes to the comment
    PullRequestReviewCommentPayloadChanges changes?;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The comment's previous body text, before this edit.
public type PullRequestReviewCommentPayloadBody record {
    # The previous value, before this change.
    string 'from?;
};

# For edited events, the changes to the comment
public type PullRequestReviewCommentPayloadChanges record {
    # The comment's previous body text, before this edit.
    PullRequestReviewCommentPayloadBody body?;
};

# A pull request head or base ref
public type PullRequestRef record {
    # The ref's label in owner:branch form, e.g. octocat:main.
    string label?;
    # The name of the branch or tag.
    string ref?;
    # The SHA of the commit at the tip of the ref.
    string sha?;
    # A GitHub user
    User user?;
    # A repository on GitHub
    Repository repo?;
};

# Payload for projects_v2_item events
public type 'ProjectsV2ItemPayload record {
    # The action that was performed. Can be one of: edited, created, archived, deleted, restored, reordered, converted.
    string action;
    # An item belonging to a Projects v2 project
    'projectsV2Item 'projects_v2_item;
    # The changes made to the item (for edited events)
    'ProjectsV2ItemPayloadChanges changes;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
};

# An item belonging to a Projects v2 project
public type 'projectsV2Item record {
    # The unique identifier of the project item.
    int id;
    # The node ID of the project item.
    string node_id;
    # The node ID of the project that contains this item.
    string project_node_id;
    # The node ID of the content represented by this item.
    string content_node_id;
    # The type of content tracked in the project item.
    string content_type;
    # The time when the item was created.
    string created_at?;
    # The time when the item was last updated.
    string updated_at?;
    # The time when the item was archived.
    string? archived_at?;
    # A GitHub user
    User creator?;
};

# Which project field's value changed on this item.
public type FieldValue record {
    # The node ID of the field whose value changed.
    string field_node_id?;
    # The type of the field whose value changed.
    string field_type?;
};

# The changes made to the item (for edited events)
public type 'ProjectsV2ItemPayloadChanges record {
    # Which project field's value changed on this item.
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
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
};

# Configuration object of the webhook.
public type Config record {
    # The media type used to serialize the payloads. The default is `form`.
    string content_type?;
    # Determines whether the SSL certificate of the host for `url` will be verified when delivering payloads. Supported values include `0` (verification is performed) and `1` (verification is not performed). The default is `0`.
    string insecure_ssl?;
    # The URL to which the payloads will be delivered.
    string url?;
};

# The webhook that is being pinged
public type Hook record {
    # The kind of target the webhook is attached to. Can be one of: Repository, Organization, App.
    string 'type?;
    # Unique identifier of the webhook.
    int id?;
    # The name of a valid service, use 'web' for a webhook.
    string name?;
    # Determines whether the hook is actually triggered on pushes.
    boolean active?;
    # Determines what events the hook is triggered for. Default: ['push'].
    string[] events?;
    # Configuration object of the webhook.
    Config config?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The API URL of the resource.
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
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A repository on GitHub
public type Repository record {
    # Unique identifier of the repository.
    int id;
    # The GraphQL identifier of the repository.
    string node_id?;
    # The repository name
    string name;
    # The full repository name including owner (e.g. octocat/Hello-World)
    string full_name;
    # A GitHub user
    User owner;
    # Whether the repository is private
    boolean 'private;
    # The URL to view the repository on GitHub.com.
    string html_url?;
    # The repository description.
    string? description?;
    # Whether the repository is a fork.
    boolean 'fork?;
    # The URL to get more information about the repository from the GitHub API.
    string url?;
    # The repository's homepage URL, if set.
    string? homepage?;
    # The repository's primary programming language.
    string? language?;
    # The number of forks of the repository.
    int forks_count?;
    # The number of users who have starred the repository.
    int stargazers_count?;
    # The number of users watching the repository.
    int watchers_count?;
    # The size of the repository, in kilobytes. Size is calculated hourly. When a repository is initially created, the size is 0.
    int size?;
    # The default branch of the repository.
    string default_branch?;
    # The number of open issues and pull requests in the repository.
    int open_issues_count?;
    # The list of topics associated with the repository.
    string[] topics?;
    # Whether issues are enabled.
    boolean has_issues?;
    # Whether projects are enabled.
    boolean has_projects?;
    # Whether the wiki is enabled.
    boolean has_wiki?;
    # Whether GitHub Pages is enabled for the repository.
    boolean has_pages?;
    # Whether downloads are enabled.
    boolean has_downloads?;
    # Whether the repository is archived.
    boolean archived?;
    # Returns whether or not this repository is disabled.
    boolean disabled?;
    # The repository visibility: public, private, or internal.
    string visibility?;
    # The date and time the repository was last pushed to.
    string? pushed_at?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # A repository's software license.
    License? license?;
};

# A repository's software license.
public type License record {
    # The SPDX license key identifier, e.g. mit.
    string 'key?;
    # The full name of the license.
    string name?;
    # The SPDX identifier of the license.
    string spdx_id?;
    # The API URL of the resource.
    string? url?;
};

# A comment on a pull request diff
public type PullRequestReviewComment record {
    # The ID of the pull request review comment.
    int id;
    # The node ID of the pull request review comment.
    string node_id?;
    # The ID of the pull request review to which the comment belongs.
    int? pull_request_review_id?;
    # URL for the pull request review comment.
    string url?;
    # HTML URL for the pull request review comment.
    string html_url?;
    # The text of the comment.
    string body;
    # The diff of the line that the comment refers to.
    string diff_hunk?;
    # The relative path of the file to which the comment applies.
    string path?;
    # The line index in the diff to which the comment applies. This field is closing down; use `line` instead.
    int? position?;
    # The index of the original line in the diff to which the comment applies. This field is closing down; use `original_line` instead.
    int original_position?;
    # The SHA of the commit to which the comment applies.
    string commit_id?;
    # The SHA of the original commit to which the comment applies.
    string original_commit_id?;
    # A GitHub user
    User user?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # How the author is associated with the repository.
    string author_association?;
    # The side of the diff to which the comment applies. The side of the last line of the range for a multi-line comment.
    string side?;
    # The side of the first line of the range for a multi-line comment.
    string? start_side?;
};

# Payload for team events
public type TeamPayload record {
    # The action that was performed. Can be one of: created, deleted, edited, added_to_repository, removed_from_repository.
    string action;
    # A GitHub organization team
    Team team;
    # For edited events, the changes to the team
    TeamPayloadChanges changes?;
    # Present for added_to_repository and removed_from_repository actions
    Repository repository?;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The team's previous description, before this edit.
public type TeamPayloadDescription record {
    # The previous value, before this change.
    string 'from?;
};

# The team's previous name, before this edit.
public type TeamPayloadName record {
    # The previous value, before this change.
    string 'from?;
};

# The team's previous privacy level, before this edit.
public type Privacy record {
    # The previous value, before this change.
    string 'from?;
};

# The team's previous notification setting, before this edit.
public type NotificationSetting record {
    # The previous value, before this change.
    string 'from?;
};

# For edited events, the changes to the team
public type TeamPayloadChanges record {
    # The team's previous description, before this edit.
    TeamPayloadDescription description?;
    # The team's previous name, before this edit.
    TeamPayloadName name?;
    # The team's previous privacy level, before this edit.
    Privacy privacy?;
    # The team's previous notification setting, before this edit.
    NotificationSetting notification_setting?;
    # For added_to_repository/removed_from_repository events
    Repository repository?;
};

# A GitHub Enterprise account
public type Enterprise record {
    # Unique identifier of the enterprise.
    int id?;
    # The slug url identifier for the enterprise.
    string slug?;
    # The name of the enterprise.
    string name?;
    # The GraphQL node ID.
    string node_id?;
    # The URL of the user's or organization's avatar image.
    string avatar_url?;
    # A short description of the enterprise.
    string? description?;
    # The enterprise's website URL.
    string? website_url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
};

# Payload for project events (classic project boards).
# Note: classic Projects are deprecated; use projects_v2 instead.
public type ProjectPayload record {
    # The action that was performed. Can be one of: deleted, created, closed, reopened, edited.
    string action;
    # A classic project board
    Project project;
    # For edited events, the changes made to the project
    ProjectPayloadChanges? changes?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A classic project board
public type Project record {
    # The unique identifier of the resource.
    int id;
    # The GraphQL node ID.
    string node_id;
    # The API URL of the resource.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The API URL listing the project's columns.
    string columns_url?;
    # Name of the project.
    string name;
    # Body of the project.
    string? body?;
    # The project's number, unique within its owner.
    int number;
    # State of the project; either 'open' or 'closed'.
    string state;
    # A GitHub user
    User creator?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
};

# The project's previous name, before this edit.
public type ProjectPayloadName record {
    # The previous value, before this change.
    string 'from?;
};

# The project's previous body text, before this edit.
public type ProjectPayloadBody record {
    # The previous value, before this change.
    string? 'from?;
};

# For edited events, the changes made to the project
public type ProjectPayloadChanges record {
    # The project's previous name, before this edit.
    ProjectPayloadName name?;
    # The project's previous body text, before this edit.
    ProjectPayloadBody body?;
};

# Payload for installation_target events (GitHub App installation account renamed)
public type InstallationTargetPayload record {
    # The action that was performed. Always: renamed.
    string action;
    # The account (user or organization) where the app is installed
    InstallationTargetPayloadAccount account;
    # The type of account the app is installed on: user or organization.
    string target_type;
    # The changes made to the account
    InstallationTargetPayloadChanges changes;
    # A GitHub App installation
    Installation installation?;
};

# The account (user or organization) where the app is installed
public type InstallationTargetPayloadAccount record {
    # The unique identifier of the resource.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # The username or organization login of the account.
    string login;
    # The account type. Can be one of: Bot, User, Organization.
    string 'type;
    # The URL of the user's or organization's avatar image.
    string avatar_url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # Whether the user is a GitHub site administrator.
    boolean site_admin?;
};

# The account's previous login, before this rename.
public type InstallationTargetPayloadLogin record {
    # The previous value, before this change.
    string 'from?;
};

# The account's previous slug, before this rename.
public type Slug record {
    # The previous value, before this change.
    string 'from?;
};

# The changes made to the account
public type InstallationTargetPayloadChanges record {
    # The account's previous login, before this rename.
    InstallationTargetPayloadLogin login?;
    # The account's previous slug, before this rename.
    Slug slug?;
};

# A deployment status
public type DeploymentStatus record {
    # The unique identifier of the resource.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # The new state. Can be `pending`, `success`, `failure`, or `error`.
    string state;
    # A GitHub user
    User creator?;
    # The optional human-readable description added to the status.
    string? description?;
    # The environment of the deployment that the status is for.
    string environment?;
    # The URL for accessing your environment.
    string? environment_url?;
    # The URL to associate with this status.
    string? log_url?;
    # The optional link added to the status.
    string? target_url?;
    # The API URL of the deployment this status belongs to.
    string deployment_url?;
    # The API URL of the repository the deployment belongs to.
    string repository_url?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # A GitHub App
    App? performed_via_github_app?;
};

# Payload for installation_repositories events
public type InstallationRepositoriesPayload record {
    # The action that was performed. Can be one of: added, removed.
    string action;
    # Repositories added to the installation
    RepositoriesAddedItem[] repositories_added;
    # Repositories removed from the installation
    RepositoriesRemovedItem[] repositories_removed;
    # Whether all repositories or a selection are accessible
    string repository_selection;
    # A GitHub user
    User? requester;
    # A GitHub App installation
    Installation installation?;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A repository added to a GitHub App installation.
public type RepositoriesAddedItem record {
    # The unique identifier of the resource.
    int id?;
    # The GraphQL node ID.
    string node_id?;
    # The name of the repository.
    string name?;
    # The full name of the repository, in owner/repo format.
    string full_name?;
    # Whether the repository is private.
    boolean 'private?;
};

# A repository removed from a GitHub App installation.
public type RepositoriesRemovedItem record {
    # The unique identifier of the resource.
    int id?;
    # The GraphQL node ID.
    string node_id?;
    # The name of the repository.
    string name?;
    # The full name of the repository, in owner/repo format.
    string full_name?;
    # Whether the repository is private.
    boolean 'private?;
};

# An issue on GitHub
public type Issue record {
    # The unique identifier of the resource.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # URL for the issue.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # Number uniquely identifying the issue within its repository.
    int number;
    # Title of the issue.
    string title;
    # Contents of the issue.
    string? body?;
    # State of the issue; either `open` or `closed`.
    string state;
    # Whether the issue's conversation has been locked.
    boolean locked?;
    # A GitHub user
    User user?;
    # Labels attached to the issue.
    Label[] labels?;
    # A GitHub user
    User? assignee?;
    # The users assigned to the issue.
    User[] assignees?;
    # A milestone on an issue or pull request
    Milestone milestone?;
    # The number of comments on the issue.
    int comments?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # The date and time the issue was closed, if closed.
    string? closed_at?;
    # How the author is associated with the repository.
    string author_association?;
    # The reason the issue's conversation was locked, if locked.
    string? active_lock_reason?;
};

# A label on an issue or pull request
public type Label record {
    # Unique identifier for the label.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # URL for the label.
    string url?;
    # The name of the label.
    string name;
    # 6-character hex color code
    string color;
    # Whether this label comes by default in a new repository.
    boolean 'default?;
    # Optional description of the label, such as its purpose.
    string? description?;
};

# A deployment request for a specific ref
public type Deployment record {
    # Unique identifier of the deployment.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # The SHA of the commit that was deployed.
    string sha;
    # The ref to deploy. This can be a branch, tag, or sha.
    string ref;
    # Parameter to specify a task to execute.
    string task;
    # JSON payload with extra information about the deployment
    map<json> payload?;
    # The environment name originally requested, before normalization to `environment`.
    string original_environment?;
    # Name of the target deployment environment.
    string environment;
    # A short description of the deployment.
    string? description?;
    # A GitHub user
    User creator?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # The API URL listing the deployment's statuses.
    string statuses_url?;
    # The API URL of the repository the deployment belongs to.
    string repository_url?;
    # Specifies if the given environment will no longer exist at some point in the future. Default: false.
    boolean transient_environment?;
    # Specifies if the given environment is one that end-users directly interact with. Default: false.
    boolean production_environment?;
    # A GitHub App
    App? performed_via_github_app?;
};

# Payload for branch_protection_configuration events
public type BranchProtectionConfigurationPayload record {
    # disabled — all branch protections were disabled. enabled — all were enabled.
    string action;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Payload for repository_ruleset events
public type RepositoryRulesetPayload record {
    # The action that was performed. Can be one of: created, edited, deleted.
    string action;
    # A set of rules to apply when specified conditions are met
    RepositoryRuleset repository_ruleset;
    # For edited events, the changes made to the ruleset. conditions/rules are each a
    # genuine added/deleted/updated diff (entries added or removed wholesale, or an
    # existing entry's own fields changed), not a flat "field changed from X" map like
    # most other changes payloads - bypass_actors is never part of this diff at all.
    RepositoryRulesetPayloadChanges? changes?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Parameters for a repository ruleset ref name condition.
public type RefName record {
    # Array of ref names or patterns to include. One of these patterns must match for the condition to pass. Also accepts `~DEFAULT_BRANCH` to include the default branch or `~ALL` to include all branches.
    string[] include?;
    # Array of ref names or patterns to exclude. The condition will not pass if any of these patterns match.
    string[] exclude?;
};

# Which refs this ruleset applies to
public type Conditions record {
    # Parameters for a repository ruleset ref name condition.
    RefName ref_name?;
};

# Only allow users with bypass permission to create matching refs.
public type RulesItemCreation record {
    # The rule type - always `creation`.
    string 'type;
};

# Parameters for the `update` rule.
public type RulesItemUpdateParameters record {
    # Branch can pull changes from its upstream repository
    boolean update_allows_fetch_and_merge;
};

# Only allow users with bypass permission to update matching refs.
public type RulesItemUpdate record {
    # The rule type - always `update`.
    string 'type;
    # Parameters for the `update` rule.
    RulesItemUpdateParameters parameters?;
};

# Only allow users with bypass permissions to delete matching refs.
public type RulesItemDeletion record {
    # The rule type - always `deletion`.
    string 'type;
};

# Prevent merge commits from being pushed to matching refs.
public type RulesItemRequiredLinearHistory record {
    # The rule type - always `required_linear_history`.
    string 'type;
};

# Parameters for the `merge_queue` rule.
public type RulesItemMergeQueueParameters record {
    # Maximum time (minutes) for a required status check to report a conclusion. After this much time has elapsed, checks that have not reported a conclusion will be assumed to have failed.
    int check_response_timeout_minutes;
    # When set to ALLGREEN, the merge commit created by merge queue for each PR in the group must pass all required checks to merge. When set to HEADGREEN, only the commit at the head of the merge group must pass its required checks to merge.
    string grouping_strategy;
    # Limit the number of queued pull requests requesting checks and workflow runs at the same time.
    int max_entries_to_build;
    # The maximum number of PRs that will be merged together in a group.
    int max_entries_to_merge;
    # Method to use when merging changes from queued pull requests.
    string merge_method;
    # The minimum number of PRs that will be merged together in a group.
    int min_entries_to_merge;
    # The time merge queue should wait after the first PR is added to the queue for the minimum group size to be met, before merging a smaller group.
    int min_entries_to_merge_wait_minutes;
};

# Merges must be performed via a merge queue.
public type RulesItemMergeQueue record {
    # The rule type - always `merge_queue`.
    string 'type;
    # Parameters for the `merge_queue` rule.
    RulesItemMergeQueueParameters parameters?;
};

# Parameters for the `required_deployments` rule.
public type RulesItemRequiredDeploymentsParameters record {
    # Environments that must be successfully deployed to before branches can be merged.
    string[] required_deployment_environments;
};

# Choose which environments must be successfully deployed to before refs can be pushed.
public type RulesItemRequiredDeployments record {
    # The rule type - always `required_deployments`.
    string 'type;
    # Parameters for the `required_deployments` rule.
    RulesItemRequiredDeploymentsParameters parameters?;
};

# Commits pushed to matching refs must have verified signatures.
public type RulesItemRequiredSignatures record {
    # The rule type - always `required_signatures`.
    string 'type;
};

# Parameters for the `pull_request` rule.
public type RulesItemPullRequestParameters record {
    # Array of allowed merge methods. At least one option must be enabled.
    string[] allowed_merge_methods?;
    # New, reviewable commits pushed will dismiss previous pull request review approvals.
    boolean dismiss_stale_reviews_on_push;
    # Specify people, teams, or apps allowed to dismiss pull request reviews.
    RuleDismissalRestriction dismissal_restriction?;
    # Require an approving review in pull requests that modify files that have a designated code owner.
    boolean require_code_owner_review;
    # Whether the most recent reviewable push must be approved by someone other than the person who pushed it.
    boolean require_last_push_approval;
    # The number of approving reviews that are required before a pull request can be merged.
    int required_approving_review_count;
    # All conversations on code must be resolved before a pull request can be merged.
    boolean required_review_thread_resolution;
    # A collection of reviewers and associated file patterns. Each reviewer has a list of file patterns which determine the files that reviewer is required to review.
    RuleRequiredReviewerConfiguration[] required_reviewers?;
};

# Require commits be submitted via a pull request before they can be merged.
public type RulesItemPullRequest record {
    # The rule type - always `pull_request`.
    string 'type;
    # Parameters for the `pull_request` rule.
    RulesItemPullRequestParameters parameters?;
};

# Parameters for the `required_status_checks` rule.
public type RulesItemRequiredStatusChecksParameters record {
    # Allow repositories and branches to be created if a check would otherwise prohibit it.
    boolean do_not_enforce_on_create?;
    # Status checks that are required.
    RuleStatusCheckConfiguration[] required_status_checks;
    # Whether pull requests targeting a matching branch must be tested with the latest code. Has no effect unless at least one status check is enabled.
    boolean strict_required_status_checks_policy;
};

# Choose which status checks must pass before the ref is updated.
public type RulesItemRequiredStatusChecks record {
    # The rule type - always `required_status_checks`.
    string 'type;
    # Parameters for the `required_status_checks` rule.
    RulesItemRequiredStatusChecksParameters parameters?;
};

# Prevent users with push access from force pushing to refs.
public type RulesItemNonFastForward record {
    # The rule type - always `non_fast_forward`.
    string 'type;
};

# Restrict commit messages matching a pattern.
public type RulesItemCommitMessagePattern record {
    # The rule type - always `commit_message_pattern`.
    string 'type;
    # Shared by the 5 pattern-matching ruleset rules (commit_message_pattern,
    # commit_author_email_pattern, committer_email_pattern, branch_name_pattern,
    # tag_name_pattern) - identical parameters shape for all five per GitHub's own schema.
    RulePatternParameters parameters?;
};

# Restrict commit author emails matching a pattern.
public type RulesItemCommitAuthorEmailPattern record {
    # The rule type - always `commit_author_email_pattern`.
    string 'type;
    # Shared by the 5 pattern-matching ruleset rules (commit_message_pattern,
    # commit_author_email_pattern, committer_email_pattern, branch_name_pattern,
    # tag_name_pattern) - identical parameters shape for all five per GitHub's own schema.
    RulePatternParameters parameters?;
};

# Restrict committer emails matching a pattern.
public type RulesItemCommitterEmailPattern record {
    # The rule type - always `committer_email_pattern`.
    string 'type;
    # Shared by the 5 pattern-matching ruleset rules (commit_message_pattern,
    # commit_author_email_pattern, committer_email_pattern, branch_name_pattern,
    # tag_name_pattern) - identical parameters shape for all five per GitHub's own schema.
    RulePatternParameters parameters?;
};

# Restrict branch names matching a pattern.
public type RulesItemBranchNamePattern record {
    # The rule type - always `branch_name_pattern`.
    string 'type;
    # Shared by the 5 pattern-matching ruleset rules (commit_message_pattern,
    # commit_author_email_pattern, committer_email_pattern, branch_name_pattern,
    # tag_name_pattern) - identical parameters shape for all five per GitHub's own schema.
    RulePatternParameters parameters?;
};

# Restrict tag names matching a pattern.
public type RulesItemTagNamePattern record {
    # The rule type - always `tag_name_pattern`.
    string 'type;
    # Shared by the 5 pattern-matching ruleset rules (commit_message_pattern,
    # commit_author_email_pattern, committer_email_pattern, branch_name_pattern,
    # tag_name_pattern) - identical parameters shape for all five per GitHub's own schema.
    RulePatternParameters parameters?;
};

# Parameters for the `file_path_restriction` rule.
public type RulesItemFilePathRestrictionParameters record {
    # File paths that are restricted from being pushed to the commit graph.
    string[] restricted_file_paths;
};

# Restrict file and folder paths from being pushed.
public type RulesItemFilePathRestriction record {
    # The rule type - always `file_path_restriction`.
    string 'type;
    # Parameters for the `file_path_restriction` rule.
    RulesItemFilePathRestrictionParameters parameters?;
};

# Parameters for the `max_file_path_length` rule.
public type RulesItemMaxFilePathLengthParameters record {
    # The maximum amount of characters allowed in file paths.
    int max_file_path_length;
};

# Restrict file paths exceeding a character limit.
public type RulesItemMaxFilePathLength record {
    # The rule type - always `max_file_path_length`.
    string 'type;
    # Parameters for the `max_file_path_length` rule.
    RulesItemMaxFilePathLengthParameters parameters?;
};

# Parameters for the `file_extension_restriction` rule.
public type RulesItemFileExtensionRestrictionParameters record {
    # File extensions that are restricted from being pushed to the commit graph.
    string[] restricted_file_extensions;
};

# Restrict files with specified file extensions.
public type RulesItemFileExtensionRestriction record {
    # The rule type - always `file_extension_restriction`.
    string 'type;
    # Parameters for the `file_extension_restriction` rule.
    RulesItemFileExtensionRestrictionParameters parameters?;
};

# Parameters for the `max_file_size` rule.
public type RulesItemMaxFileSizeParameters record {
    # The maximum file size allowed in megabytes.
    int max_file_size;
};

# Restrict individual files exceeding a size limit (MB).
public type RulesItemMaxFileSize record {
    # The rule type - always `max_file_size`.
    string 'type;
    # Parameters for the `max_file_size` rule.
    RulesItemMaxFileSizeParameters parameters?;
};

# Parameters for the `workflows` rule.
public type RulesItemWorkflowsParameters record {
    # Allow repositories and branches to be created if a check would otherwise prohibit it.
    boolean do_not_enforce_on_create?;
    # Workflows that must pass for this rule to pass.
    RuleWorkflowFileReference[] workflows;
};

# Require specified workflows to pass before changes can be merged.
public type RulesItemWorkflows record {
    # The rule type - always `workflows`.
    string 'type;
    # Parameters for the `workflows` rule.
    RulesItemWorkflowsParameters parameters?;
};

# Parameters for the `code_scanning` rule.
public type RulesItemCodeScanningParameters record {
    # Tools that must provide code scanning results for this rule to pass.
    RuleCodeScanningTool[] code_scanning_tools;
};

# Choose which code scanning tools must provide results before the reference is updated.
public type RulesItemCodeScanning record {
    # The rule type - always `code_scanning`.
    string 'type;
    # Parameters for the `code_scanning` rule.
    RulesItemCodeScanningParameters parameters?;
};

# One rule in a ruleset; shape depends on its `type` discriminator.
public type RulesItem RulesItemCreation|RulesItemUpdate|RulesItemDeletion|RulesItemRequiredLinearHistory|RulesItemMergeQueue|RulesItemRequiredDeployments|RulesItemRequiredSignatures|RulesItemPullRequest|RulesItemRequiredStatusChecks|RulesItemNonFastForward|RulesItemCommitMessagePattern|RulesItemCommitAuthorEmailPattern|RulesItemCommitterEmailPattern|RulesItemBranchNamePattern|RulesItemTagNamePattern|RulesItemFilePathRestriction|RulesItemMaxFilePathLength|RulesItemFileExtensionRestriction|RulesItemMaxFileSize|RulesItemWorkflows|RulesItemCodeScanning;

# An actor permitted to bypass this ruleset's rules.
public type BypassActorsItem record {
    # The ID of the actor that can bypass this ruleset.
    int? actor_id?;
    # The type of actor that can bypass this ruleset, e.g. Team or OrganizationAdmin.
    string actor_type?;
    # When the actor can bypass this ruleset, e.g. always or pull_request.
    string bypass_mode?;
};

# A set of rules to apply when specified conditions are met
public type RepositoryRuleset record {
    # The ID of the ruleset.
    int id;
    # The name of the ruleset.
    string name;
    # The target of the ruleset.
    string? target?;
    # The type of the source of the ruleset.
    string? source_type?;
    # The name of the source.
    string 'source?;
    # The enforcement level of the ruleset. `evaluate` allows admins to test rules before enforcing them and view insights on the Rule Insights page (Enterprise only).
    string enforcement;
    # Which refs this ruleset applies to
    Conditions? conditions?;
    # Each entry's real shape depends on its "type" - 20 real rule types confirmed
    # against github/rest-api-description's authoritative OpenAPI spec (the actual
    # source powering docs.github.com and every GitHub SDK), not guessed from field
    # names or a third-party summary.
    RulesItem[] rules?;
    # The actors that can bypass the rules in this ruleset.
    BypassActorsItem[] bypass_actors?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
};

# The ruleset's previous name, before this edit.
public type RepositoryRulesetPayloadName record {
    # The previous value, before this change.
    string 'from?;
};

# The ruleset's previous enforcement status, before this edit.
public type Enforcement record {
    # The previous value, before this change.
    string 'from?;
};

# Parameters for a repository ruleset ref name condition.
public type RepositoryRulesetPayloadRefName record {
    # Array of ref names or patterns to include. One of these patterns must match for the condition to pass. Also accepts `~DEFAULT_BRANCH` to include the default branch or `~ALL` to include all branches.
    string[] include?;
    # Array of ref names or patterns to exclude. The condition will not pass if any of these patterns match.
    string[] exclude?;
};

public type AddedItem record {
    # Parameters for a repository ruleset ref name condition.
    RepositoryRulesetPayloadRefName ref_name?;
};

# Parameters for a repository ruleset ref name condition.
public type RepositoryRulesetPayloadRefName2 record {
    # Array of ref names or patterns to include. One of these patterns must match for the condition to pass. Also accepts `~DEFAULT_BRANCH` to include the default branch or `~ALL` to include all branches.
    string[] include?;
    # Array of ref names or patterns to exclude. The condition will not pass if any of these patterns match.
    string[] exclude?;
};

public type DeletedItem record {
    # Parameters for a repository ruleset ref name condition.
    RepositoryRulesetPayloadRefName2 ref_name?;
};

# Parameters for a repository ruleset ref name condition.
public type RepositoryRulesetPayloadRefName3 record {
    # Array of ref names or patterns to include. One of these patterns must match for the condition to pass. Also accepts `~DEFAULT_BRANCH` to include the default branch or `~ALL` to include all branches.
    string[] include?;
    # Array of ref names or patterns to exclude. The condition will not pass if any of these patterns match.
    string[] exclude?;
};

# The current state of the updated condition.
public type Condition record {
    # Parameters for a repository ruleset ref name condition.
    RepositoryRulesetPayloadRefName3 ref_name?;
};

# The condition's previous type, before this edit.
public type ConditionType record {
    # The previous value, before this change.
    string 'from?;
};

# The condition's previous target, before this edit.
public type Target record {
    # The previous value, before this change.
    string 'from?;
};

# The condition's previous list of included ref patterns, before this edit.
public type Include record {
    # The previous value, before this change.
    string[] 'from?;
};

# The condition's previous list of excluded ref patterns, before this edit.
public type Exclude record {
    # The previous value, before this change.
    string[] 'from?;
};

# The fields of the condition that changed.
public type RepositoryRulesetPayloadChanges2 record {
    # The condition's previous type, before this edit.
    ConditionType condition_type?;
    # The condition's previous target, before this edit.
    Target target?;
    # The condition's previous list of included ref patterns, before this edit.
    Include include?;
    # The condition's previous list of excluded ref patterns, before this edit.
    Exclude exclude?;
};

# A ruleset condition whose fields changed in this edit, with its current state and the diff.
public type UpdatedItem record {
    # The current state of the updated condition.
    Condition condition?;
    # The fields of the condition that changed.
    RepositoryRulesetPayloadChanges2 changes?;
};

# The ref-targeting conditions added, deleted, or updated on the ruleset.
public type RepositoryRulesetPayloadConditions record {
    # Conditions newly added to the ruleset.
    AddedItem[] added?;
    # Conditions removed from the ruleset.
    DeletedItem[] deleted?;
    # Conditions whose own fields changed on the ruleset.
    UpdatedItem[] updated?;
};

# Parameters for the `update` rule.
public type 'ParametersBranch0 record {
    # Branch can pull changes from its upstream repository
    boolean update_allows_fetch_and_merge?;
};

# Parameters for the `merge_queue` rule.
public type 'ParametersBranch1 record {
    # Maximum time (minutes) for a required status check to report a conclusion. After this much time has elapsed, checks that have not reported a conclusion will be assumed to have failed.
    int check_response_timeout_minutes?;
    # When set to ALLGREEN, the merge commit created by merge queue for each PR in the group must pass all required checks to merge. When set to HEADGREEN, only the commit at the head of the merge group must pass its required checks to merge.
    string grouping_strategy?;
    # Limit the number of queued pull requests requesting checks and workflow runs at the same time.
    int max_entries_to_build?;
    # The maximum number of PRs that will be merged together in a group.
    int max_entries_to_merge?;
    # Method to use when merging changes from queued pull requests.
    string merge_method?;
    # The minimum number of PRs that will be merged together in a group.
    int min_entries_to_merge?;
    # The time merge queue should wait after the first PR is added to the queue for the minimum group size to be met, before merging a smaller group.
    int min_entries_to_merge_wait_minutes?;
};

# Parameters for the `required_deployments` rule.
public type 'ParametersBranch2 record {
    # Environments that must be successfully deployed to before branches can be merged.
    string[] required_deployment_environments?;
};

# Parameters for the `pull_request` rule.
public type 'ParametersBranch3 record {
    # Array of allowed merge methods. At least one option must be enabled.
    string[] allowed_merge_methods?;
    # New, reviewable commits pushed will dismiss previous pull request review approvals.
    boolean dismiss_stale_reviews_on_push?;
    # Specify people, teams, or apps allowed to dismiss pull request reviews.
    RuleDismissalRestriction dismissal_restriction?;
    # Require an approving review in pull requests that modify files that have a designated code owner.
    boolean require_code_owner_review?;
    # Whether the most recent reviewable push must be approved by someone other than the person who pushed it.
    boolean require_last_push_approval?;
    # The number of approving reviews that are required before a pull request can be merged.
    int required_approving_review_count?;
    # All conversations on code must be resolved before a pull request can be merged.
    boolean required_review_thread_resolution?;
    # A collection of reviewers and associated file patterns. Each reviewer has a list of file patterns which determine the files that reviewer is required to review.
    RuleRequiredReviewerConfiguration[] required_reviewers?;
};

# Parameters for the `required_status_checks` rule.
public type 'ParametersBranch4 record {
    # Allow repositories and branches to be created if a check would otherwise prohibit it.
    boolean do_not_enforce_on_create?;
    # Status checks that are required.
    RuleStatusCheckConfiguration[] required_status_checks?;
    # Whether pull requests targeting a matching branch must be tested with the latest code. Has no effect unless at least one status check is enabled.
    boolean strict_required_status_checks_policy?;
};

# Shared by the 5 pattern-matching ruleset rules (commit_message_pattern,
# commit_author_email_pattern, committer_email_pattern, branch_name_pattern,
# tag_name_pattern) - identical parameters shape for all five per GitHub's own schema.
public type 'ParametersBranch5 record {
    # How this rule appears when configuring it.
    string name?;
    # If true, the rule will fail if the pattern matches.
    boolean negate?;
    # The operator to use for matching.
    string operator?;
    # The pattern to match with.
    string pattern?;
};

# Parameters for the `file_path_restriction` rule.
public type 'ParametersBranch6 record {
    # File paths that are restricted from being pushed to the commit graph.
    string[] restricted_file_paths?;
};

# Parameters for the `max_file_path_length` rule.
public type 'ParametersBranch7 record {
    # The maximum amount of characters allowed in file paths.
    int max_file_path_length?;
};

# Parameters for the `file_extension_restriction` rule.
public type 'ParametersBranch8 record {
    # File extensions that are restricted from being pushed to the commit graph.
    string[] restricted_file_extensions?;
};

# Parameters for the `max_file_size` rule.
public type 'ParametersBranch9 record {
    # The maximum file size allowed in megabytes.
    int max_file_size?;
};

# Parameters for the `workflows` rule.
public type 'ParametersBranch10 record {
    # Allow repositories and branches to be created if a check would otherwise prohibit it.
    boolean do_not_enforce_on_create?;
    # Workflows that must pass for this rule to pass.
    RuleWorkflowFileReference[] workflows?;
};

# Parameters for the `code_scanning` rule.
public type 'ParametersBranch11 record {
    # Tools that must provide code scanning results for this rule to pass.
    RuleCodeScanningTool[] code_scanning_tools?;
};

# The parameters of the rule that was added.
public type Parameters 'ParametersBranch0|'ParametersBranch1|'ParametersBranch2|'ParametersBranch3|'ParametersBranch4|'ParametersBranch5|'ParametersBranch6|'ParametersBranch7|'ParametersBranch8|'ParametersBranch9|'ParametersBranch10|'ParametersBranch11;

# A rule added to the ruleset by this edit.
public type RepositoryRulesetPayloadAddedItem record {
    # The type of rule that was added.
    string 'type?;
    # The parameters of the rule that was added.
    Parameters parameters?;
};

# Parameters for the `update` rule.
public type 'RepositoryRulesetPayloadParametersBranch0 record {
    # Branch can pull changes from its upstream repository
    boolean update_allows_fetch_and_merge?;
};

# Parameters for the `merge_queue` rule.
public type 'RepositoryRulesetPayloadParametersBranch1 record {
    # Maximum time (minutes) for a required status check to report a conclusion. After this much time has elapsed, checks that have not reported a conclusion will be assumed to have failed.
    int check_response_timeout_minutes?;
    # When set to ALLGREEN, the merge commit created by merge queue for each PR in the group must pass all required checks to merge. When set to HEADGREEN, only the commit at the head of the merge group must pass its required checks to merge.
    string grouping_strategy?;
    # Limit the number of queued pull requests requesting checks and workflow runs at the same time.
    int max_entries_to_build?;
    # The maximum number of PRs that will be merged together in a group.
    int max_entries_to_merge?;
    # Method to use when merging changes from queued pull requests.
    string merge_method?;
    # The minimum number of PRs that will be merged together in a group.
    int min_entries_to_merge?;
    # The time merge queue should wait after the first PR is added to the queue for the minimum group size to be met, before merging a smaller group.
    int min_entries_to_merge_wait_minutes?;
};

# Parameters for the `required_deployments` rule.
public type 'RepositoryRulesetPayloadParametersBranch2 record {
    # Environments that must be successfully deployed to before branches can be merged.
    string[] required_deployment_environments?;
};

# Parameters for the `pull_request` rule.
public type 'RepositoryRulesetPayloadParametersBranch3 record {
    # Array of allowed merge methods. At least one option must be enabled.
    string[] allowed_merge_methods?;
    # New, reviewable commits pushed will dismiss previous pull request review approvals.
    boolean dismiss_stale_reviews_on_push?;
    # Specify people, teams, or apps allowed to dismiss pull request reviews.
    RuleDismissalRestriction dismissal_restriction?;
    # Require an approving review in pull requests that modify files that have a designated code owner.
    boolean require_code_owner_review?;
    # Whether the most recent reviewable push must be approved by someone other than the person who pushed it.
    boolean require_last_push_approval?;
    # The number of approving reviews that are required before a pull request can be merged.
    int required_approving_review_count?;
    # All conversations on code must be resolved before a pull request can be merged.
    boolean required_review_thread_resolution?;
    # A collection of reviewers and associated file patterns. Each reviewer has a list of file patterns which determine the files that reviewer is required to review.
    RuleRequiredReviewerConfiguration[] required_reviewers?;
};

# Parameters for the `required_status_checks` rule.
public type 'RepositoryRulesetPayloadParametersBranch4 record {
    # Allow repositories and branches to be created if a check would otherwise prohibit it.
    boolean do_not_enforce_on_create?;
    # Status checks that are required.
    RuleStatusCheckConfiguration[] required_status_checks?;
    # Whether pull requests targeting a matching branch must be tested with the latest code. Has no effect unless at least one status check is enabled.
    boolean strict_required_status_checks_policy?;
};

# Shared by the 5 pattern-matching ruleset rules (commit_message_pattern,
# commit_author_email_pattern, committer_email_pattern, branch_name_pattern,
# tag_name_pattern) - identical parameters shape for all five per GitHub's own schema.
public type 'RepositoryRulesetPayloadParametersBranch5 record {
    # How this rule appears when configuring it.
    string name?;
    # If true, the rule will fail if the pattern matches.
    boolean negate?;
    # The operator to use for matching.
    string operator?;
    # The pattern to match with.
    string pattern?;
};

# Parameters for the `file_path_restriction` rule.
public type 'RepositoryRulesetPayloadParametersBranch6 record {
    # File paths that are restricted from being pushed to the commit graph.
    string[] restricted_file_paths?;
};

# Parameters for the `max_file_path_length` rule.
public type 'RepositoryRulesetPayloadParametersBranch7 record {
    # The maximum amount of characters allowed in file paths.
    int max_file_path_length?;
};

# Parameters for the `file_extension_restriction` rule.
public type 'RepositoryRulesetPayloadParametersBranch8 record {
    # File extensions that are restricted from being pushed to the commit graph.
    string[] restricted_file_extensions?;
};

# Parameters for the `max_file_size` rule.
public type 'RepositoryRulesetPayloadParametersBranch9 record {
    # The maximum file size allowed in megabytes.
    int max_file_size?;
};

# Parameters for the `workflows` rule.
public type 'RepositoryRulesetPayloadParametersBranch10 record {
    # Allow repositories and branches to be created if a check would otherwise prohibit it.
    boolean do_not_enforce_on_create?;
    # Workflows that must pass for this rule to pass.
    RuleWorkflowFileReference[] workflows?;
};

# Parameters for the `code_scanning` rule.
public type 'RepositoryRulesetPayloadParametersBranch11 record {
    # Tools that must provide code scanning results for this rule to pass.
    RuleCodeScanningTool[] code_scanning_tools?;
};

# The parameters of the rule that was removed.
public type RepositoryRulesetPayloadParameters 'RepositoryRulesetPayloadParametersBranch0|'RepositoryRulesetPayloadParametersBranch1|'RepositoryRulesetPayloadParametersBranch2|'RepositoryRulesetPayloadParametersBranch3|'RepositoryRulesetPayloadParametersBranch4|'RepositoryRulesetPayloadParametersBranch5|'RepositoryRulesetPayloadParametersBranch6|'RepositoryRulesetPayloadParametersBranch7|'RepositoryRulesetPayloadParametersBranch8|'RepositoryRulesetPayloadParametersBranch9|'RepositoryRulesetPayloadParametersBranch10|'RepositoryRulesetPayloadParametersBranch11;

# A rule removed from the ruleset by this edit.
public type RepositoryRulesetPayloadDeletedItem record {
    # The type of rule that was removed.
    string 'type?;
    # The parameters of the rule that was removed.
    RepositoryRulesetPayloadParameters parameters?;
};

# Parameters for the `update` rule.
public type 'RepositoryRulesetPayloadParametersBranch02 record {
    # Branch can pull changes from its upstream repository
    boolean update_allows_fetch_and_merge?;
};

# Parameters for the `merge_queue` rule.
public type 'RepositoryRulesetPayloadParametersBranch12 record {
    # Maximum time (minutes) for a required status check to report a conclusion. After this much time has elapsed, checks that have not reported a conclusion will be assumed to have failed.
    int check_response_timeout_minutes?;
    # When set to ALLGREEN, the merge commit created by merge queue for each PR in the group must pass all required checks to merge. When set to HEADGREEN, only the commit at the head of the merge group must pass its required checks to merge.
    string grouping_strategy?;
    # Limit the number of queued pull requests requesting checks and workflow runs at the same time.
    int max_entries_to_build?;
    # The maximum number of PRs that will be merged together in a group.
    int max_entries_to_merge?;
    # Method to use when merging changes from queued pull requests.
    string merge_method?;
    # The minimum number of PRs that will be merged together in a group.
    int min_entries_to_merge?;
    # The time merge queue should wait after the first PR is added to the queue for the minimum group size to be met, before merging a smaller group.
    int min_entries_to_merge_wait_minutes?;
};

# Parameters for the `required_deployments` rule.
public type 'RepositoryRulesetPayloadParametersBranch22 record {
    # Environments that must be successfully deployed to before branches can be merged.
    string[] required_deployment_environments?;
};

# Parameters for the `pull_request` rule.
public type 'RepositoryRulesetPayloadParametersBranch32 record {
    # Array of allowed merge methods. At least one option must be enabled.
    string[] allowed_merge_methods?;
    # New, reviewable commits pushed will dismiss previous pull request review approvals.
    boolean dismiss_stale_reviews_on_push?;
    # Specify people, teams, or apps allowed to dismiss pull request reviews.
    RuleDismissalRestriction dismissal_restriction?;
    # Require an approving review in pull requests that modify files that have a designated code owner.
    boolean require_code_owner_review?;
    # Whether the most recent reviewable push must be approved by someone other than the person who pushed it.
    boolean require_last_push_approval?;
    # The number of approving reviews that are required before a pull request can be merged.
    int required_approving_review_count?;
    # All conversations on code must be resolved before a pull request can be merged.
    boolean required_review_thread_resolution?;
    # A collection of reviewers and associated file patterns. Each reviewer has a list of file patterns which determine the files that reviewer is required to review.
    RuleRequiredReviewerConfiguration[] required_reviewers?;
};

# Parameters for the `required_status_checks` rule.
public type 'RepositoryRulesetPayloadParametersBranch42 record {
    # Allow repositories and branches to be created if a check would otherwise prohibit it.
    boolean do_not_enforce_on_create?;
    # Status checks that are required.
    RuleStatusCheckConfiguration[] required_status_checks?;
    # Whether pull requests targeting a matching branch must be tested with the latest code. Has no effect unless at least one status check is enabled.
    boolean strict_required_status_checks_policy?;
};

# Shared by the 5 pattern-matching ruleset rules (commit_message_pattern,
# commit_author_email_pattern, committer_email_pattern, branch_name_pattern,
# tag_name_pattern) - identical parameters shape for all five per GitHub's own schema.
public type 'RepositoryRulesetPayloadParametersBranch52 record {
    # How this rule appears when configuring it.
    string name?;
    # If true, the rule will fail if the pattern matches.
    boolean negate?;
    # The operator to use for matching.
    string operator?;
    # The pattern to match with.
    string pattern?;
};

# Parameters for the `file_path_restriction` rule.
public type 'RepositoryRulesetPayloadParametersBranch62 record {
    # File paths that are restricted from being pushed to the commit graph.
    string[] restricted_file_paths?;
};

# Parameters for the `max_file_path_length` rule.
public type 'RepositoryRulesetPayloadParametersBranch72 record {
    # The maximum amount of characters allowed in file paths.
    int max_file_path_length?;
};

# Parameters for the `file_extension_restriction` rule.
public type 'RepositoryRulesetPayloadParametersBranch82 record {
    # File extensions that are restricted from being pushed to the commit graph.
    string[] restricted_file_extensions?;
};

# Parameters for the `max_file_size` rule.
public type 'RepositoryRulesetPayloadParametersBranch92 record {
    # The maximum file size allowed in megabytes.
    int max_file_size?;
};

# Parameters for the `workflows` rule.
public type 'RepositoryRulesetPayloadParametersBranch102 record {
    # Allow repositories and branches to be created if a check would otherwise prohibit it.
    boolean do_not_enforce_on_create?;
    # Workflows that must pass for this rule to pass.
    RuleWorkflowFileReference[] workflows?;
};

# Parameters for the `code_scanning` rule.
public type 'RepositoryRulesetPayloadParametersBranch112 record {
    # Tools that must provide code scanning results for this rule to pass.
    RuleCodeScanningTool[] code_scanning_tools?;
};

# The parameters of the updated rule.
public type RepositoryRulesetPayloadParameters2 'RepositoryRulesetPayloadParametersBranch02|'RepositoryRulesetPayloadParametersBranch12|'RepositoryRulesetPayloadParametersBranch22|'RepositoryRulesetPayloadParametersBranch32|'RepositoryRulesetPayloadParametersBranch42|'RepositoryRulesetPayloadParametersBranch52|'RepositoryRulesetPayloadParametersBranch62|'RepositoryRulesetPayloadParametersBranch72|'RepositoryRulesetPayloadParametersBranch82|'RepositoryRulesetPayloadParametersBranch92|'RepositoryRulesetPayloadParametersBranch102|'RepositoryRulesetPayloadParametersBranch112;

# The current state of the updated rule.
public type RepositoryRulesetPayloadRule record {
    # The type of the updated rule.
    string 'type?;
    # The parameters of the updated rule.
    RepositoryRulesetPayloadParameters2 parameters?;
};

# The rule's previous configuration, before this edit.
public type Configuration record {
    # The previous value, before this change.
    string 'from?;
};

# The rule's previous type, before this edit.
public type RuleType record {
    # The previous value, before this change.
    string 'from?;
};

# The rule's previous pattern, before this edit.
public type Pattern record {
    # The previous value, before this change.
    string 'from?;
};

# The fields of the rule that changed.
public type RepositoryRulesetPayloadChanges3 record {
    # The rule's previous configuration, before this edit.
    Configuration configuration?;
    # The rule's previous type, before this edit.
    RuleType rule_type?;
    # The rule's previous pattern, before this edit.
    Pattern pattern?;
};

# A ruleset rule whose fields changed in this edit, with its current state and the diff.
public type RepositoryRulesetPayloadUpdatedItem record {
    # The current state of the updated rule.
    RepositoryRulesetPayloadRule rule?;
    # The fields of the rule that changed.
    RepositoryRulesetPayloadChanges3 changes?;
};

# The rules added, deleted, or updated on the ruleset.
public type Rules record {
    # Rules newly added to the ruleset.
    RepositoryRulesetPayloadAddedItem[] added?;
    # Rules removed from the ruleset.
    RepositoryRulesetPayloadDeletedItem[] deleted?;
    # Rules whose own fields changed on the ruleset.
    RepositoryRulesetPayloadUpdatedItem[] updated?;
};

# For edited events, the changes made to the ruleset. conditions/rules are each a
# genuine added/deleted/updated diff (entries added or removed wholesale, or an
# existing entry's own fields changed), not a flat "field changed from X" map like
# most other changes payloads - bypass_actors is never part of this diff at all.
public type RepositoryRulesetPayloadChanges record {
    # The ruleset's previous name, before this edit.
    RepositoryRulesetPayloadName name?;
    # The ruleset's previous enforcement status, before this edit.
    Enforcement enforcement?;
    # The ref-targeting conditions added, deleted, or updated on the ruleset.
    RepositoryRulesetPayloadConditions conditions?;
    # The rules added, deleted, or updated on the ruleset.
    Rules rules?;
};

# Payload for security_and_analysis events. Fired when code security and
# analysis features are enabled or disabled for a repository. No action field.
public type SecurityAndAnalysisPayload record {
    # The security and analysis settings that changed
    SecurityAndAnalysisPayloadChanges changes;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Change to GitHub Advanced Security enablement
public type AdvancedSecurity record {
    # The previous value, before this change.
    string 'from?;
    # The new value, after this change.
    string to?;
};

# Change to Dependabot alerts enablement
public type DependabotAlerts record {
    # The previous value, before this change.
    string 'from?;
    # The new value, after this change.
    string to?;
};

# Change to Dependabot security updates enablement
public type DependabotSecurityUpdates record {
    # The previous value, before this change.
    string 'from?;
    # The new value, after this change.
    string to?;
};

# Change to secret scanning enablement
public type SecretScanning record {
    # The previous value, before this change.
    string 'from?;
    # The new value, after this change.
    string to?;
};

# Change to secret scanning push protection enablement
public type SecretScanningPushProtection record {
    # The previous value, before this change.
    string 'from?;
    # The new value, after this change.
    string to?;
};

# Change to non-provider pattern scanning enablement
public type SecretScanningNonProviderPatterns record {
    # The previous value, before this change.
    string 'from?;
    # The new value, after this change.
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
    # The git author's name.
    string name?;
    # The git author's email address.
    string email?;
    # The git author's GitHub username, if their email matched a GitHub account.
    string username?;
};

# Payload for deploy_key events
public type DeployKeyPayload record {
    # The action that was performed. Can be one of: created, deleted.
    string action;
    # The deploy key resource
    'key 'key;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The deploy key resource
public type 'key record {
    # The unique identifier of the resource.
    int id;
    # The public key
    string 'key;
    # The API URL of the resource.
    string url?;
    # The user-supplied label for the deploy key.
    string title?;
    # Whether GitHub has verified the deploy key.
    boolean verified?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # Whether the deploy key has read-only (not read-write) access.
    boolean read_only?;
    # The username of the user who added the deploy key, if known.
    string? added_by?;
    # The date and time the deploy key was last used, in ISO 8601 format.
    string? last_used?;
};

# Payload for issue_dependencies events
public type IssueDependenciesPayload record {
    # The action that was performed. Can be one of: blocking_removed, blocked_by_removed, blocking_added, blocked_by_added.
    string action;
    # The ID of the blocked issue.
    int blocked_issue_id?;
    # An issue on GitHub
    Issue blocked_issue?;
    # The ID of the blocking issue.
    int blocking_issue_id?;
    # An issue on GitHub
    Issue blocking_issue?;
    # A repository on GitHub
    Repository blocking_issue_repo?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Payload for repository_advisory events
public type RepositoryAdvisoryPayload record {
    # The action that was performed. Can be one of: reported, published.
    string action;
    # A repository security advisory
    RepositoryAdvisory repository_advisory;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A CVE or GHSA identifier for the advisory.
public type IdentifiersItem record {
    # The type of identifier, e.g. CVE or GHSA.
    string 'type?;
    # The identifier value.
    string value?;
};

# The accept/reject decision on a repository security advisory publish request
public type Submission record {
    # Whether a private vulnerability report was accepted by the repository's administrators.
    boolean accepted?;
};

# The package affected by the vulnerability.
public type RepositoryAdvisoryPayloadPackage record {
    # The package ecosystem the affected package belongs to, e.g. npm.
    string ecosystem?;
    # The name of the affected package.
    string name?;
};

# One package version range affected by the advisory.
public type VulnerabilitiesItem record {
    # The package affected by the vulnerability.
    RepositoryAdvisoryPayloadPackage package?;
    # The range of versions affected by the vulnerability.
    string? vulnerable_version_range?;
    # The versions that contain a patch for the vulnerability.
    string? patched_versions?;
    # The functions affected by the vulnerability.
    string[] vulnerable_functions?;
};

# The CVSS score and vector for the advisory.
public type Cvss record {
    # The CVSS vector string describing the vulnerability's characteristics.
    string? vector_string?;
    # The CVSS score of the vulnerability.
    decimal? score?;
};

# A CWE (Common Weakness Enumeration) classification for the advisory.
public type CwesItem record {
    # The CWE identifier, e.g. CWE-79.
    string cwe_id?;
    # The name of the CWE weakness.
    string name?;
};

# A user credited for reporting or fixing the advisory.
public type CreditsItem record {
    # A GitHub user
    User user?;
    # The type of credit given to the user, e.g. reporter.
    string 'type?;
};

# A repository security advisory
public type RepositoryAdvisory record {
    # The GitHub Security Advisory identifier
    string ghsa_id;
    # The Common Vulnerabilities and Exposures (CVE) ID.
    string? cve_id;
    # The API URL for the advisory.
    string url?;
    # The URL for the advisory.
    string html_url?;
    # A short summary of the advisory.
    string summary;
    # A detailed description of what the advisory entails.
    string? description?;
    # The severity of the advisory.
    string severity;
    # A GitHub user
    User author?;
    # A GitHub user
    User? publisher?;
    # The CVE and/or GHSA identifiers for the advisory.
    IdentifiersItem[] identifiers?;
    # The state of the advisory.
    string state;
    # The date and time of when the advisory was created, in ISO 8601 format.
    string created_at?;
    # The date and time of when the advisory was last updated, in ISO 8601 format.
    string updated_at?;
    # The date and time of when the advisory was published, in ISO 8601 format.
    string? published_at?;
    # The date and time of when the advisory was withdrawn, in ISO 8601 format.
    string? withdrawn_at?;
    # The accept/reject decision on a repository security advisory publish request
    Submission? submission?;
    # The products affected by the vulnerability detailed in the advisory.
    VulnerabilitiesItem[] vulnerabilities?;
    # The CVSS score and vector for the advisory.
    Cvss? cvss?;
    # The CWE classifications for the advisory.
    CwesItem[]? cwes?;
    # The users credited for reporting or fixing the advisory.
    CreditsItem[]? credits?;
};

# Payload for repository_vulnerability_alert events (closing down — use dependabot_alert)
public type RepositoryVulnerabilityAlertPayload record {
    # The action that was performed. Can be one of: create, dismiss, reopen, resolve.
    string action;
    # The security alert of the vulnerable dependency
    RepositoryVulnerabilityAlertPayloadAlert alert;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
};

# The security alert of the vulnerable dependency
public type RepositoryVulnerabilityAlertPayloadAlert record {
    # The unique identifier of the resource.
    int id;
    # The name of the package affected by the vulnerability.
    string affected_package_name;
    # The range of package versions affected by the vulnerability.
    string affected_range;
    # The package version that resolves the vulnerability.
    string? fixed_in?;
    # The severity of the vulnerability.
    string severity;
    # The GitHub Security Advisory identifier for the vulnerability.
    string ghsa_id?;
    # The vulnerability's identifier in an external database, e.g. a CVE ID.
    string external_identifier?;
    # A URL to the vulnerability's external reference source.
    string? external_reference?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the alert was automatically dismissed, in ISO 8601 format.
    string? auto_dismissed_at?;
    # The reason the alert was dismissed.
    string? dismiss_reason?;
    # The date and time the alert was dismissed, in ISO 8601 format.
    string? dismissed_at?;
    # A GitHub user
    User? dismissed_by?;
    # The alert number, unique within the repository.
    int number?;
};

# A milestone on an issue or pull request
public type Milestone record {
    # The unique identifier of the resource.
    int id?;
    # The GraphQL node ID.
    string node_id?;
    # The number of the milestone.
    int number?;
    # The title of the milestone.
    string title?;
    # A description of the milestone.
    string? description?;
    # The state of the milestone.
    string state?;
    # The number of open issues associated with the milestone.
    int open_issues?;
    # The number of closed issues associated with the milestone.
    int closed_issues?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # The date the milestone is due, in ISO 8601 format.
    string? due_on?;
    # The date and time the milestone was closed, in ISO 8601 format.
    string? closed_at?;
    # A GitHub user
    User creator?;
};

# Payload for issues events
public type IssuesPayload record {
    # The action that was performed
    string action;
    # An issue on GitHub
    Issue issue;
    # A GitHub user
    User? assignee?;
    # A label on an issue or pull request
    Label label?;
    # For edited events, the changes to the issue
    IssuesPayloadChanges changes?;
    # A milestone on an issue or pull request
    Milestone milestone?;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The issue's previous title, before this edit.
public type Title record {
    # The previous value, before this change.
    string 'from?;
};

# The issue's previous body text, before this edit.
public type IssuesPayloadBody record {
    # The previous value, before this change.
    string 'from?;
};

# For edited events, the changes to the issue
public type IssuesPayloadChanges record {
    # The issue's previous title, before this edit.
    Title title?;
    # The issue's previous body text, before this edit.
    IssuesPayloadBody body?;
};

# Payload for code_scanning_alert events
public type CodeScanningAlertPayload record {
    # The action that was performed. Can be one of: appeared_in_branch, closed_by_user, created, fixed, reopened, reopened_by_user, updated_assignment.
    string action;
    # The code scanning alert involved in the event
    CodeScanningAlertPayloadAlert alert;
    # The commit SHA of the alert. Empty when action is reopened_by_user
    # or closed_by_user.
    string commit_oid;
    # The git ref of the alert. Empty when action is reopened_by_user
    # or closed_by_user.
    string ref;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The rule that triggered the code scanning alert.
public type CodeScanningAlertPayloadRule record {
    # The unique identifier of the resource.
    string id?;
    # The severity of the alert, e.g. note, warning, or error.
    string severity?;
    # The security severity level of the alert, e.g. low, medium, high, or critical.
    string? security_severity_level?;
    # A short description of the rule.
    string description?;
    # The name of the rule.
    string name?;
    # The full description of the rule.
    string full_description?;
    # Tags associated with the rule.
    string[] tags?;
    # Help text describing how to fix the issue.
    string? help?;
};

# The tool that generated the code scanning alert.
public type Tool record {
    # The name of the tool.
    string name?;
    # The GUID of the tool.
    string? guid?;
    # The version of the tool.
    string? 'version?;
};

# Where in the code this alert instance was found - unrelated to, and a
# different shape from, secret_scanning's own "location" field elsewhere in
# this spec (that one identifies a commit/path, this one a line/column range).
public type CodeScanningAlertPayloadLocation record {
    # The file path where the flagged code is located.
    string path?;
    # The line number where the flagged code range begins.
    int start_line?;
    # The line number where the flagged code range ends.
    int end_line?;
    # The column number where the flagged code range begins.
    int start_column?;
    # The column number where the flagged code range ends.
    int end_column?;
};

# The most recent instance of the code scanning alert.
public type MostRecentInstance record {
    # The full Git reference, formatted as `refs/heads/<branch name>`.
    string ref?;
    # Identifies the configuration under which the analysis was executed, e.g. workflow and job name.
    string analysis_key?;
    # Identifies the variable values of the environment the analysis was performed in, e.g. the language analyzed.
    string environment?;
    # The state of the alert instance. Can be one of: open, dismissed, fixed.
    string state?;
    # The SHA of the commit this alert instance was found in.
    string commit_sha?;
    # Where in the code this alert instance was found - unrelated to, and a
    # different shape from, secret_scanning's own "location" field elsewhere in
    # this spec (that one identifies a commit/path, this one a line/column range).
    CodeScanningAlertPayloadLocation location?;
};

# The code scanning alert involved in the event
public type CodeScanningAlertPayloadAlert record {
    # The security alert number.
    int number;
    # The time that the alert was created in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string created_at?;
    # The time that the alert was last updated in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string? updated_at?;
    # The REST API URL of the alert resource.
    string url?;
    # The GitHub URL of the alert resource.
    string html_url?;
    # State of a code scanning alert.
    string state;
    # The time that the alert was no longer detected and was considered fixed in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string? fixed_at?;
    # A GitHub user
    User? dismissed_by?;
    # The time that the alert was dismissed in ISO 8601 format: `YYYY-MM-DDTHH:MM:SSZ`.
    string? dismissed_at?;
    # The reason for dismissing or closing the alert.
    string? dismissed_reason?;
    # The dismissal comment associated with the dismissal of the alert.
    string? dismissed_comment?;
    # The rule that triggered the code scanning alert.
    CodeScanningAlertPayloadRule rule?;
    # The tool that generated the code scanning alert.
    Tool tool?;
    # The most recent instance of the code scanning alert.
    MostRecentInstance most_recent_instance?;
};

# Payload for pull_request_review events
public type PullRequestReviewPayload record {
    # The action that was performed. Can be one of: submitted, edited, dismissed.
    string action;
    # A pull request review
    PullRequestReview review;
    # A pull request
    PullRequest pull_request;
    # For edited events, the changes to the review
    PullRequestReviewPayloadChanges changes?;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The review's previous body text, before this edit.
public type PullRequestReviewPayloadBody record {
    # The previous value, before this change.
    string 'from?;
};

# For edited events, the changes to the review
public type PullRequestReviewPayloadChanges record {
    # The review's previous body text, before this edit.
    PullRequestReviewPayloadBody body?;
};

# Payload for projects_v2 events (organization-level Projects)
public type 'ProjectsV2Payload record {
    # The action that was performed. Can be one of: created, edited, closed, reopened, deleted.
    string action;
    # A Projects v2 project
    'projectsV2 'projects_v2;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
};

# A Projects v2 project
public type 'projectsV2 record {
    # The unique identifier of the project.
    int id;
    # The node ID of the project.
    string node_id;
    # A GitHub user
    User owner;
    # A GitHub user
    User creator?;
    # The project title.
    string title;
    # A short description of the project.
    string? description?;
    # Whether the project is visible to anyone with access to the owner.
    boolean 'public?;
    # The time when the project was closed.
    string? closed_at?;
    # The time when the project was created.
    string created_at?;
    # The time when the project was last updated.
    string updated_at?;
    # The time when the project was deleted.
    string? deleted_at?;
    # A GitHub user
    User? deleted_by?;
    # The project number.
    int number?;
    # A concise summary of the project.
    string? short_description?;
    # The project's status; undocumented field, exact semantics unconfirmed.
    string? status?;
};

# Payload for personal_access_token_request events
public type PersonalAccessTokenRequestPayload record {
    # The action that was performed. Can be one of: created, approved, denied, cancelled.
    string action;
    # A fine-grained personal access token request
    PersonalAccessTokenRequest personal_access_token_request;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Permissions added by the request - each of organization/repository/other is a
# map of permission name to access level (e.g. "contents": "read"), NOT a
# reference to the Organization/Repository entity schemas despite the field names.
public type PermissionsAdded record {
    # Organization-level permissions requested, mapped from permission name to access level.
    map<json>? organization?;
    # Repository-level permissions requested, mapped from permission name to access level.
    map<json>? repository?;
    # Other account-level permissions requested, mapped from permission name to access level.
    map<json>? other?;
};

# Permissions upgraded from existing token - same permission-name-to-access-level
# map shape as permissions_added, not an entity reference.
public type PermissionsUpgraded record {
    # Organization-level permissions being upgraded, mapped from permission name to access level.
    map<json>? organization?;
    # Repository-level permissions being upgraded, mapped from permission name to access level.
    map<json>? repository?;
    # Other account-level permissions being upgraded, mapped from permission name to access level.
    map<json>? other?;
};

# The resulting full set of permissions if approved - same permission-name-to-
# access-level map shape as permissions_added, not an entity reference.
public type PermissionsResult record {
    # The resulting organization-level permissions if the request is approved, mapped from permission name to access level.
    map<json>? organization?;
    # The resulting repository-level permissions if the request is approved, mapped from permission name to access level.
    map<json>? repository?;
    # The resulting other account-level permissions if the request is approved, mapped from permission name to access level.
    map<json>? other?;
};

# A fine-grained personal access token request
public type PersonalAccessTokenRequest record {
    # Unique identifier of the request for access via fine-grained personal access token. Used as the `pat_request_id` parameter in the list and review API calls.
    int id;
    # A GitHub user
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
    # Type of repository selection requested.
    string repository_selection?;
    # The API URL listing the repositories associated with this resource.
    string? repositories_url?;
    # An array of repository objects the token is requesting access to. This field is only populated when `repository_selection` is `subset`.
    Repository[]? repositories?;
    # Whether the associated fine-grained personal access token has expired.
    boolean token_expired?;
    # Date and time when the associated fine-grained personal access token expires.
    string? token_expires_at?;
    # Date and time when the associated fine-grained personal access token was last used for authentication.
    string? token_last_used_at?;
    # Date and time when the request for access was created.
    string created_at?;
};

# Payload for installation events
public type InstallationPayload record {
    # The action that was performed. Can be one of: created, deleted, suspend, unsuspend, new_permissions_accepted.
    string action;
    # A GitHub App installation
    Installation installation;
    # An array of repositories the installation can access
    RepositoriesItem[] repositories?;
    # A GitHub user
    User? requester?;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A minimal repository reference included in installation events.
public type RepositoriesItem record {
    # The unique identifier of the resource.
    int id?;
    # The GraphQL node ID.
    string node_id?;
    # The name of the repository.
    string name?;
    # The full name of the repository, in the form `owner/repo`.
    string full_name?;
    # Whether the repository is private.
    boolean 'private?;
};

# A GitHub Actions workflow run
public type WorkflowRun record {
    # The ID of the workflow run.
    int id;
    # The name of the workflow run.
    string name;
    # The GraphQL node ID.
    string node_id?;
    # The ID of the associated check suite.
    int check_suite_id?;
    # The node ID of the associated check suite.
    string check_suite_node_id?;
    # The name of the branch the workflow run is on.
    string? head_branch?;
    # The SHA of the head commit that points to the version of the workflow being run.
    string head_sha?;
    # The auto incrementing run number for the workflow run.
    int run_number?;
    # The event that triggered the workflow run, e.g. push, pull_request.
    string event?;
    # The status of the workflow run, e.g. queued, in_progress, completed.
    string status;
    # The result of the completed workflow run, e.g. success, failure, cancelled.
    string? conclusion?;
    # The ID of the parent workflow.
    int workflow_id?;
    # The URL to the workflow run.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # Pull requests that are open with a `head_sha` or `head_branch` that matches the workflow run. The returned pull requests do not necessarily indicate pull requests that triggered the run.
    PullRequestMinimal[] pull_requests?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # Attempt number of the run, 1 for first attempt and higher if the workflow was re-run.
    int run_attempt?;
    # The start time of the latest run. Resets on re-run.
    string run_started_at?;
    # A GitHub user
    User actor?;
    # A GitHub user
    User triggering_actor?;
    # The URL to the jobs for the workflow run.
    string jobs_url?;
    # The URL to download the logs for the workflow run.
    string logs_url?;
    # The URL to the associated check suite.
    string check_suite_url?;
    # The URL to the artifacts for the workflow run.
    string artifacts_url?;
    # The URL to cancel the workflow run.
    string cancel_url?;
    # The URL to rerun the workflow run.
    string rerun_url?;
    # The URL to the workflow.
    string workflow_url?;
    # A Git commit
    Commit head_commit?;
    # A repository on GitHub
    Repository repository?;
};

# Payload for discussion events
public type DiscussionPayload record {
    # The action that was performed. Can be one of: created, edited, deleted, pinned, unpinned, locked, unlocked, transferred, category_changed, answered, unanswered, labeled, unlabeled, closed, reopened.
    string action;
    # A GitHub Discussion in a repository
    Discussion discussion;
    # Present on answered action - the comment marked as answer. Richer than the
    # Comment schema used for discussion_comment (has parent_id, child_comment_count,
    # repository_url, discussion_id in addition to Comment's fields), so this is its
    # own shape rather than a $ref to Comment.
    Answer? answer?;
    # A label on an issue or pull request
    Label label?;
    # For edited/category_changed events, the changes made
    DiscussionPayloadChanges changes?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Present on answered action - the comment marked as answer. Richer than the
# Comment schema used for discussion_comment (has parent_id, child_comment_count,
# repository_url, discussion_id in addition to Comment's fields), so this is its
# own shape rather than a $ref to Comment.
public type Answer record {
    # The unique identifier of the resource.
    int id?;
    # The GraphQL node ID.
    string node_id?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The ID of the parent comment, if this is a reply; otherwise null.
    int? parent_id?;
    # The number of replies to this comment.
    int child_comment_count?;
    # The API URL of the repository this comment belongs to.
    string repository_url?;
    # The ID of the discussion this comment belongs to.
    int discussion_id?;
    # How the author is associated with the repository.
    string author_association?;
    # A GitHub user
    User user?;
    # The text of the comment.
    string body?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
};

# The discussion's previous title, before this edit.
public type DiscussionPayloadTitle record {
    # The previous value, before this change.
    string 'from?;
};

# The discussion's previous body text, before this edit.
public type DiscussionPayloadBody record {
    # The previous value, before this change.
    string 'from?;
};

# Present on category_changed
public type DiscussionPayloadCategory record {
    # A discussion category
    Category 'from?;
};

# For edited/category_changed events, the changes made
public type DiscussionPayloadChanges record {
    # The discussion's previous title, before this edit.
    DiscussionPayloadTitle title?;
    # The discussion's previous body text, before this edit.
    DiscussionPayloadBody body?;
    # Present on category_changed
    DiscussionPayloadCategory category?;
};

# A check suite
public type CheckSuite record {
    # The unique identifier of the resource.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # The head branch name the changes are on.
    string? head_branch?;
    # The SHA of the head commit that is being checked.
    string head_sha?;
    # The summary status for all check runs that are part of the check suite. Can be `queued`, `requested`, `in_progress`, or `completed`.
    string status?;
    # The summary conclusion for all check runs that are part of the check suite. This value will be `null` until the check suite has `completed`.
    string? conclusion?;
    # URL that points to the check suite API resource.
    string url?;
    # The SHA of the most recent commit on the branch before the push that triggered this check suite.
    string? before?;
    # The SHA of the most recent commit on the branch after this check suite's push.
    string? after?;
    # An array of pull requests that match this check suite. A pull request matches a check suite if they have the same `head_sha` and `head_branch`. When the check suite's `head_branch` is in a forked repository it will be `null` and the `pull_requests` array will be empty.
    PullRequestMinimal[] pull_requests?;
    # A GitHub App
    App app?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
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
    # The URL of the user's or organization's avatar image.
    string? avatar_url?;
    # The commit the status is associated with
    'commit 'commit;
    # Array of branches containing the status SHA (max 10)
    BranchesItem[] branches;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Identifying information for the git-user.
public type Author record {
    # Name of the git user.
    string name?;
    # Git email address of the user.
    string email?;
    # Timestamp of the commit.
    string date?;
};

# Identifying information for the git-user.
public type Committer record {
    # Name of the git user.
    string name?;
    # Git email address of the user.
    string email?;
    # Timestamp of the commit.
    string date?;
};

# A pointer to the Git tree object for a commit.
public type Tree record {
    # The SHA of the Git tree object.
    string sha?;
    # The API URL of the resource.
    string url?;
};

# GPG/SSH commit signature verification details.
public type Verification record {
    # Whether the commit signature was successfully verified.
    boolean verified?;
    # The reason for the verification state, e.g. `valid`, `unsigned`, `bad_signature`.
    string reason?;
    # The signature that was extracted from the commit, or null if unsigned.
    string? signature?;
    # The value that was signed, or null if unsigned.
    string? payload?;
};

# The raw git commit data (distinct from the GitHub account in the sibling author/committer fields)
public type StatusPayloadCommit record {
    # Identifying information for the git-user.
    Author author?;
    # Identifying information for the git-user.
    Committer committer?;
    # Message describing the purpose of the commit.
    string message?;
    # A pointer to the Git tree object for a commit.
    Tree tree?;
    # The API URL of the resource.
    string url?;
    # The number of comments on the commit.
    int comment_count?;
    # GPG/SSH commit signature verification details.
    Verification verification?;
};

# The commit the status is associated with
public type 'commit record {
    # The commit SHA.
    string sha?;
    # The raw git commit data (distinct from the GitHub account in the sibling author/committer fields)
    StatusPayloadCommit 'commit?;
    # The API URL of the resource.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # A GitHub user
    User author?;
    # A GitHub user
    User committer?;
};

# The commit at the tip of a branch (SHA and URL only).
public type StatusPayloadCommit2 record {
    # The SHA of the commit.
    string sha?;
    # The API URL of the resource.
    string url?;
};

# A branch whose HEAD commit matches this status; at most 10 are included.
public type BranchesItem record {
    # The name of the branch.
    string name?;
    # The commit at the tip of a branch (SHA and URL only).
    StatusPayloadCommit2 'commit?;
    # Whether the branch has protection rules enabled.
    boolean protected?;
};

# Payload for projects_v2_status_update events
public type 'ProjectsV2StatusUpdatePayload record {
    # The action that was performed. Can be one of: created, edited, deleted.
    string action;
    # A status update belonging to a Projects v2 project
    'projectsV2StatusUpdate 'projects_v2_status_update;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
};

# A status update belonging to a Projects v2 project
public type 'projectsV2StatusUpdate record {
    # The unique identifier of the status update.
    int id;
    # The node ID of the status update.
    string node_id;
    # The node ID of the project that this status update belongs to.
    string project_node_id;
    # The current status.
    string? status?;
    # Body of the status update.
    string? body?;
    # The time when the status update was created.
    string created_at?;
    # The time when the status update was last updated.
    string updated_at?;
    # The start date of the period covered by the update.
    string? start_date?;
    # The target date associated with the update.
    string? target_date?;
    # A GitHub user
    User creator?;
};

# Shared sender/repository/organization/installation/enterprise fields; not referenced elsewhere in this module.
public type CommonPayload record {
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A minimal cross-reference to a pull request, as delivered in workflow_run/check_suite/
# check_run/deployment_review's pull_requests[] - NOT the full pull request resource (no
# title, state, user, etc.), so this must not $ref PullRequest or PullRequestRef.
public type PullRequestMinimal record {
    # The pull request's unique identifier.
    int id;
    # The pull request number.
    int number;
    # The API URL of the resource.
    string url;
    # The head (source) branch, SHA, and repository of a minimal pull request reference.
    Head head;
    # The base (target) branch, SHA, and repository of a minimal pull request reference.
    Base base;
};

# A minimal repository reference (id, URL, name) used within a pull request's head ref.
public type Repo record {
    # The unique identifier of the resource.
    int id?;
    # The API URL of the resource.
    string url?;
    # The name of the repository.
    string name?;
};

# The head (source) branch, SHA, and repository of a minimal pull request reference.
public type Head record {
    # The name of the branch.
    string ref?;
    # The SHA of the commit at the head of this branch.
    string sha?;
    # A minimal repository reference (id, URL, name) used within a pull request's head ref.
    Repo repo?;
};

# A minimal repository reference (id, URL, name) used within a pull request's base ref.
public type PullRequestMinimalRepo record {
    # The unique identifier of the resource.
    int id?;
    # The API URL of the resource.
    string url?;
    # The name of the repository.
    string name?;
};

# The base (target) branch, SHA, and repository of a minimal pull request reference.
public type Base record {
    # The name of the branch.
    string ref?;
    # The SHA of the commit at the base of this branch.
    string sha?;
    # A minimal repository reference (id, URL, name) used within a pull request's base ref.
    PullRequestMinimalRepo repo?;
};

# A GitHub Discussion in a repository
public type Discussion record {
    # The unique identifier of the resource.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # The discussion's number within the repository.
    int number;
    # The discussion post's title.
    string title;
    # The discussion post's body text.
    string? body?;
    # The current state of the discussion. `converting` means that the discussion is being converted from an issue. `transferring` means that the discussion is being transferred from another repository.
    string state;
    # A discussion category
    Category category?;
    # A GitHub user
    User user?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The number of comments on the discussion.
    int comments?;
    # Color-coded labels categorizing the discussion.
    Label[] labels?;
    # Whether the discussion is locked.
    boolean locked?;
    # The reason the discussion was locked, if applicable.
    string? active_lock_reason?;
    # The URL of the comment marked as the answer, if any.
    string? answer_html_url?;
    # The date and time an answer was chosen, in ISO 8601 format.
    string? answer_chosen_at?;
    # A GitHub user
    User? answer_chosen_by?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
};

# A GitHub user
public type User record {
    # The user's GitHub username
    string login;
    # The user's unique numeric identifier
    int id;
    # The GraphQL node ID.
    string node_id?;
    # The URL of the user's or organization's avatar image.
    string avatar_url?;
    # The user's Gravatar ID (legacy field, typically empty).
    string? gravatar_id?;
    # The API URL of the resource.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The account type: User, Organization, or Bot.
    string 'type?;
    # Whether the user is a GitHub site administrator.
    boolean site_admin?;
};

# A pull request review
public type PullRequestReview record {
    # Unique identifier of the review.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # A GitHub user
    User user?;
    # The text of the review.
    string? body?;
    # The review state, e.g. approved, changes_requested, commented, dismissed.
    string state;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The API URL of the reviewed pull request.
    string pull_request_url?;
    # The date and time the review was submitted, in ISO 8601 format.
    string submitted_at?;
    # A commit SHA for the review. If the commit object was garbage collected or forcibly deleted, then it no longer exists in Git and this value will be `null`.
    string commit_id?;
    # How the author is associated with the repository.
    string author_association?;
};

# A discussion category
public type Category record {
    # The unique identifier of the resource.
    int id;
    # The GraphQL node ID.
    string node_id;
    # The ID of the repository this discussion category belongs to.
    int repository_id;
    # The emoji associated with the discussion category.
    string emoji?;
    # The name of the discussion category.
    string name;
    # The description of the discussion category.
    string description?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # The URL-friendly identifier of the resource.
    string slug;
    # Whether discussions in this category can be marked as answered.
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
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
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
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The webhook's delivery configuration (URL, content type, SSL verification).
public type MetaPayloadConfig record {
    # The media type used to serialize the payloads, e.g. `json` or `form`.
    string content_type?;
    # Whether SSL certificate verification is skipped when delivering payloads.
    string insecure_ssl?;
    # The URL to which the payloads will be delivered.
    string url?;
    # Omitted from payloads for security
    string secret?;
};

# The deleted webhook. Fields vary by webhook type (repository,
# organization, business, app, or GitHub Marketplace).
public type MetaPayloadHook record {
    # The type of resource the webhook is attached to, e.g. Repository, Organization, App, Business.
    string 'type;
    # Unique identifier of the webhook.
    int id;
    # The name of a valid service, use 'web' for a webhook.
    string name;
    # Determines whether the hook is actually triggered on pushes.
    boolean active;
    # Determines what events the hook is triggered for. Default: ['push'].
    string[] events?;
    # The webhook's delivery configuration (URL, content type, SSL verification).
    MetaPayloadConfig config?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
};

# Payload for deployment events
public type DeploymentPayload record {
    # The action that was performed. Always created.
    string action;
    # A deployment request for a specific ref
    Deployment deployment;
    # The workflow that triggered the deployment (if applicable)
    Workflow? workflow;
    # The workflow run that triggered the deployment (if applicable)
    WorkflowRun? workflow_run;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
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
    # A GitHub user
    User sender?;
    # A GitHub App installation
    Installation installation?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
};

# A pull request associated with the deployment (number, URL, head and base refs).
public type PullRequestsItem record {
    # The pull request number.
    int number?;
    # The API URL of the resource.
    string url?;
    # A pull request head or base ref
    PullRequestRef head?;
    # A pull request head or base ref
    PullRequestRef base?;
};

# Required status check
public type RuleStatusCheckConfiguration record {
    # The status check context name that must pass for this rule to pass.
    string context;
    # The ID of the GitHub App that must provide this status check.
    int integration_id?;
};

# Payload for label events
public type LabelPayload record {
    # The action that was performed. Can be one of: created, edited, deleted.
    string action;
    # A label on an issue or pull request
    Label label;
    # For edited events, the changes to the label
    LabelPayloadChanges changes?;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The label's previous color, before this edit.
public type Color record {
    # The previous value, before this change.
    string 'from?;
};

# The label's previous name, before this edit.
public type LabelPayloadName record {
    # The previous value, before this change.
    string 'from?;
};

# The label's previous description, before this edit.
public type LabelPayloadDescription record {
    # The previous value, before this change.
    string 'from?;
};

# For edited events, the changes to the label
public type LabelPayloadChanges record {
    # The label's previous color, before this edit.
    Color color?;
    # The label's previous name, before this edit.
    LabelPayloadName name?;
    # The label's previous description, before this edit.
    LabelPayloadDescription description?;
};

# Payload for github_app_authorization events (app webhooks only)
public type GithubAppAuthorizationPayload record {
    # Always revoked — a user revoked their GitHub App authorization
    string action;
    # A GitHub user
    User sender?;
    # A GitHub App installation
    Installation installation?;
};

# Payload for page_build events. No action field.
public type PageBuildPayload record {
    # The unique identifier of the page build
    int id;
    # The GitHub Pages build object
    Build build;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Error information if the build failed
public type PageBuildPayloadError record {
    # The error message describing why the Pages build failed.
    string? message;
};

# The GitHub Pages build object
public type Build record {
    # The API URL of the resource.
    string url;
    # Current build status
    string status;
    # Error information if the build failed
    PageBuildPayloadError 'error;
    # A GitHub user
    User pusher;
    # The SHA of the commit that triggered the build
    string 'commit;
    # Duration of the build in milliseconds
    int duration;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at;
};

# Payload for project_card events (classic project cards).
# Note: classic Projects are deprecated; use projects_v2_item instead.
public type ProjectCardPayload record {
    # The action that was performed. Can be one of: created, edited, moved, converted, deleted.
    string action;
    # A card on a classic project board
    ProjectCard project_card;
    # For edited/moved events, the changes made
    ProjectCardPayloadChanges? changes?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# A card on a classic project board
public type ProjectCard record {
    # The project card's ID.
    int id;
    # The GraphQL node ID.
    string node_id;
    # The API URL of the resource.
    string url?;
    # The ID of the project column the card belongs to.
    int column_id;
    # The API URL of the project column the card belongs to.
    string column_url?;
    # The API URL of the classic project the card belongs to.
    string project_url?;
    # The card's note text; null when the card links to an issue or pull request.
    string? note?;
    # Link to the issue or PR if the card is content-based
    string? content_url?;
    # The ID of the card this card was moved after
    int? after_id?;
    # A GitHub user
    User creator?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
};

# The card's previous note text, before this edit.
public type Note record {
    # The previous value, before this change.
    string? 'from?;
};

# The ID of the column the card was previously in, before this move.
public type ColumnId record {
    # The previous value, before this change.
    int 'from?;
};

# For edited/moved events, the changes made
public type ProjectCardPayloadChanges record {
    # The card's previous note text, before this edit.
    Note note?;
    # The ID of the column the card was previously in, before this move.
    ColumnId column_id?;
};

# Payload for pull_request events
public type PullRequestPayload record {
    # The action that was performed
    string action;
    # The pull request number
    int number;
    # A pull request
    PullRequest pull_request;
    # A GitHub user
    User assignee?;
    # For edited events, the changes to the pull request
    PullRequestPayloadChanges changes?;
    # A GitHub user
    User requested_reviewer?;
    # A label on an issue or pull request
    Label label?;
    # A milestone on an issue or pull request
    Milestone milestone?;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The pull request's previous title, before this edit.
public type PullRequestPayloadTitle record {
    # The previous value, before this change.
    string 'from?;
};

# The pull request's previous body text, before this edit.
public type PullRequestPayloadBody record {
    # The previous value, before this change.
    string 'from?;
};

# The pull request's previous base branch ref, before this edit.
public type Ref record {
    # The previous value, before this change.
    string 'from?;
};

# The pull request's previous base branch SHA, before this edit.
public type Sha record {
    # The previous value, before this change.
    string 'from?;
};

# The pull request's previous base branch, before this edit.
public type PullRequestPayloadBase record {
    # The pull request's previous base branch ref, before this edit.
    Ref ref?;
    # The pull request's previous base branch SHA, before this edit.
    Sha sha?;
};

# For edited events, the changes to the pull request
public type PullRequestPayloadChanges record {
    # The pull request's previous title, before this edit.
    PullRequestPayloadTitle title?;
    # The pull request's previous body text, before this edit.
    PullRequestPayloadBody body?;
    # The pull request's previous base branch, before this edit.
    PullRequestPayloadBase base?;
};

# Payload for team_add events. Fired when a repository is added to a team.
# No action field.
public type TeamAddPayload record {
    # The team that was granted access to the repository
    TeamAddPayloadTeam team;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The parent team, if this is a child team
public type TeamAddPayloadParent record {
    # Unique identifier of the team.
    int id?;
    # The GraphQL node ID.
    string node_id?;
    # Name of the team.
    string name?;
    # The URL-friendly identifier of the resource.
    string slug?;
    # Description of the team.
    string? description?;
    # The level of privacy this team should have.
    string privacy?;
    # Permission that the team will have for its repositories.
    string permission?;
    # The API URL listing the members of this team.
    string members_url?;
    # The API URL listing the repositories associated with this resource.
    string repositories_url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
};

# The team that was granted access to the repository
public type TeamAddPayloadTeam record {
    # Unique identifier of the team.
    int id;
    # The GraphQL node ID.
    string node_id;
    # URL for the team.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # Name of the team.
    string name;
    # The URL-friendly identifier of the resource.
    string slug;
    # Description of the team.
    string? description?;
    # The level of privacy this team should have.
    string privacy?;
    # The notification setting the team has set.
    string notification_setting?;
    # Permission that the team will have for its repositories.
    string permission?;
    # The API URL listing the members of this team.
    string members_url?;
    # The API URL listing the repositories associated with this resource.
    string repositories_url?;
    # The parent team, if this is a child team
    TeamAddPayloadParent? parent?;
};

# A job in a GitHub Actions workflow run
public type WorkflowJob record {
    # The id of the job.
    int id;
    # The id of the associated workflow run.
    int run_id?;
    # The API URL of the associated workflow run.
    string run_url?;
    # Attempt number of the associated workflow run, 1 for first attempt and higher if the workflow was re-run.
    int run_attempt?;
    # The GraphQL node ID.
    string node_id?;
    # The SHA of the commit that is being run.
    string head_sha?;
    # The API URL of the resource.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The phase of the lifecycle that the job is currently in.
    string status;
    # The outcome of the job.
    string? conclusion?;
    # The time that the job created, in ISO 8601 format.
    string created_at?;
    # The time that the job started, in ISO 8601 format.
    string started_at?;
    # The time that the job finished, in ISO 8601 format.
    string? completed_at?;
    # The name of the job.
    string name;
    # Steps in this job.
    StepsItem[] steps?;
    # The API URL of the associated check run.
    string check_run_url?;
    # Labels for the workflow job. Specified by the "runs_on" attribute in the action's workflow file.
    string[] labels?;
    # The ID of the runner to which this job has been assigned. (If a runner hasn't yet been assigned, this will be null.)
    int? runner_id?;
    # The name of the runner to which this job has been assigned. (If a runner hasn't yet been assigned, this will be null.)
    string? runner_name?;
    # The ID of the runner group to which this job has been assigned. (If a runner hasn't yet been assigned, this will be null.)
    int? runner_group_id?;
    # The name of the runner group to which this job has been assigned. (If a runner hasn't yet been assigned, this will be null.)
    string? runner_group_name?;
    # The name of the workflow.
    string? workflow_name?;
    # The name of the current branch.
    string? head_branch?;
};

# A single step within a GitHub Actions job.
public type StepsItem record {
    # The name of the step.
    string name?;
    # The phase of the lifecycle that the step is currently in.
    string status?;
    # The result of the completed step, or null if not yet completed.
    string? conclusion?;
    # The step's position within the job.
    int number?;
    # The time the step began, or null if not yet started.
    string? started_at?;
    # The time the step completed, or null if not yet completed.
    string? completed_at?;
};

# A GitHub release
public type Release record {
    # The unique identifier of the resource.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # The API URL of the resource.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The API URL listing the release's assets.
    string assets_url?;
    # The URI template for uploading assets to this release.
    string upload_url?;
    # The name of the tag.
    string tag_name;
    # The name of the release.
    string? name;
    # Text describing the contents of the tag.
    string? body?;
    # Whether the release is a draft or published.
    boolean draft?;
    # Whether the release is identified as a prerelease or a full release.
    boolean prerelease?;
    # Specifies the commitish value that determines where the Git tag is created from.
    string target_commitish?;
    # A GitHub user
    User author?;
    # The release's downloadable file attachments.
    AssetsItem[] assets?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the release was published, in ISO 8601 format.
    string? published_at?;
};

# A file attached to a release
public type AssetsItem record {
    # The API URL of the resource.
    string url;
    # The direct download URL for the asset file.
    string browser_download_url;
    # The unique identifier of the resource.
    int id;
    # The GraphQL node ID.
    string node_id;
    # The file name of the asset.
    string name;
    # The user-facing display label for the asset, if set.
    string? label?;
    # State of the release asset.
    string state;
    # The MIME type of the asset file.
    string content_type;
    # The size of the asset file, in bytes.
    int size;
    # The checksum digest of the asset file, when available.
    string? digest?;
    # The number of times the asset has been downloaded.
    int download_count;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at;
    # A GitHub user
    User uploader?;
};

# Payload for custom_property events
public type CustomPropertyPayload record {
    # The action that was performed. Can be one of: updated, deleted, promote_to_enterprise, created.
    string action;
    # Custom property defined on an organization
    Definition definition;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Custom property defined on an organization
public type Definition record {
    # The name of the property.
    string property_name;
    # The type of the value for the property.
    string value_type;
    # Whether the property is required.
    string? required?;
    # Default value (string or array of strings)
    anydata? default_value?;
    # Short description of the property.
    string? description?;
    # An ordered list of the allowed values of the property. The property can have up to 200 allowed values.
    string[]? allowed_values?;
};

# Payload for public events. Fired when a repository visibility changes
# from private to public. No action field.
public type PublicPayload record {
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Payload for member events (repository collaborator activity)
public type MemberPayload record {
    # The action that was performed. Can be one of: edited, added, removed.
    string action;
    # A GitHub user
    User? member;
    # For edited events, the changes to the member's permissions
    MemberPayloadChanges changes?;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The collaborator's previous permission level, before this edit.
public type OldPermission record {
    # The previous value, before this change.
    string 'from?;
};

# The collaborator's permission level change.
public type Permission record {
    # The collaborator's permission level before this change.
    string 'from?;
    # The collaborator's permission level after this change.
    string to?;
};

# For edited events, the changes to the member's permissions
public type MemberPayloadChanges record {
    # The collaborator's previous permission level, before this edit.
    OldPermission old_permission?;
    # The collaborator's permission level change.
    Permission permission?;
};

# Payload for milestone events
public type MilestonePayload record {
    # The action that was performed. Can be one of: created, edited, opened, deleted, closed.
    string action;
    # A milestone on an issue or pull request
    Milestone milestone;
    # For edited events, the changes to the milestone
    MilestonePayloadChanges changes?;
    # A GitHub user
    User sender;
    # A repository on GitHub
    Repository repository;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The milestone's previous description, before this edit.
public type MilestonePayloadDescription record {
    # The previous value, before this change.
    string 'from?;
};

# The milestone's previous due date, before this edit.
public type DueOn record {
    # The previous value, before this change.
    string? 'from?;
};

# The milestone's previous title, before this edit.
public type MilestonePayloadTitle record {
    # The previous value, before this change.
    string 'from?;
};

# For edited events, the changes to the milestone
public type MilestonePayloadChanges record {
    # The milestone's previous description, before this edit.
    MilestonePayloadDescription description?;
    # The milestone's previous due date, before this edit.
    DueOn due_on?;
    # The milestone's previous title, before this edit.
    MilestonePayloadTitle title?;
};

# Payload for security_advisory events (GitHub-reviewed global advisories)
public type SecurityAdvisoryPayload record {
    # The action that was performed. Can be one of: withdrawn, published, updated.
    string action;
    # The details of the global security advisory, including summary,
    # description, severity, and affected packages.
    SecurityAdvisoryPayloadSecurityAdvisory security_advisory;
    # A GitHub App installation
    Installation installation?;
};

# An identifier (CVE or GHSA) for the security advisory.
public type SecurityAdvisoryPayloadIdentifiersItem record {
    # The identifier value.
    string value?;
    # The type of identifier. Can be one of: CVE, GHSA.
    string 'type?;
};

# A URL providing more information about the security advisory.
public type ReferencesItem record {
    # A URL with more information about the security advisory.
    string url?;
};

# The vulnerable package affected by the advisory.
public type SecurityAdvisoryPayloadPackage record {
    # The package's language or package management ecosystem.
    string ecosystem?;
    # The unique package name within its ecosystem.
    string name?;
};

# The first package version containing a fix for the vulnerability.
public type SecurityAdvisoryPayloadFirstPatchedVersion record {
    # The package version that resolves the vulnerability.
    string identifier?;
};

# A package and version range affected by the advisory.
public type SecurityAdvisoryPayloadVulnerabilitiesItem record {
    # The vulnerable package affected by the advisory.
    SecurityAdvisoryPayloadPackage package?;
    # The severity of the vulnerability, e.g. `low`, `moderate`, `high`, `critical`.
    string severity?;
    # The range of the package versions affected by the vulnerability.
    string vulnerable_version_range?;
    # The first package version containing a fix for the vulnerability.
    SecurityAdvisoryPayloadFirstPatchedVersion? first_patched_version?;
};

# The CVSS score and vector string of the security advisory.
public type SecurityAdvisoryPayloadCvss record {
    # The CVSS vector string, or null if not scored.
    string? vector_string?;
    # The CVSS score of the vulnerability.
    decimal score?;
};

# A CWE weakness classification associated with the advisory.
public type SecurityAdvisoryPayloadCwesItem record {
    # The Common Weakness Enumeration (CWE) identifier.
    string cwe_id?;
    # The name of the CWE weakness.
    string name?;
};

# The details of the global security advisory, including summary,
# description, severity, and affected packages.
public type SecurityAdvisoryPayloadSecurityAdvisory record {
    # The schema version of the security advisory payload, when present.
    string schema_version?;
    # The GitHub Security Advisory ID.
    string ghsa_id;
    # The Common Vulnerabilities and Exposures (CVE) ID.
    string? cve_id?;
    # The API URL for the advisory.
    string url?;
    # The URL for the advisory.
    string html_url?;
    # A short summary of the advisory.
    string summary;
    # A detailed description of what the advisory entails.
    string description?;
    # The severity of the advisory.
    string severity;
    # The advisory's CVE and GHSA identifiers.
    SecurityAdvisoryPayloadIdentifiersItem[] identifiers?;
    # URLs with more information about the security advisory.
    ReferencesItem[] references?;
    # The date and time of when the advisory was published, in ISO 8601 format.
    string published_at?;
    # The date and time of when the advisory was last updated, in ISO 8601 format.
    string updated_at?;
    # The date and time of when the advisory was withdrawn, in ISO 8601 format.
    string? withdrawn_at?;
    # The products and respective version ranges affected by the advisory.
    SecurityAdvisoryPayloadVulnerabilitiesItem[] vulnerabilities?;
    # The CVSS score and vector string of the security advisory.
    SecurityAdvisoryPayloadCvss cvss?;
    # The CWE weaknesses associated with the advisory.
    SecurityAdvisoryPayloadCwesItem[] cwes?;
};

# Payload for check_run events
public type CheckRunPayload record {
    # The action that was performed. Can be one of: created, completed, requested_action, rerequested.
    string action;
    # A check performed on the code of a given code change
    CheckRun check_run;
    # Present for requested_action events
    RequestedAction requested_action?;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# Present for requested_action events
public type RequestedAction record {
    # The integrator reference of the action requested by the user.
    string identifier?;
};

# Payload for commit_comment events
public type CommitCommentPayload record {
    # The action that was performed. Can be one of: created.
    string action;
    # The commit comment resource
    CommitCommentPayloadComment comment;
    # A GitHub user
    User sender?;
    # A repository on GitHub
    Repository repository?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The commit comment resource
public type CommitCommentPayloadComment record {
    # The unique identifier of the resource.
    int id;
    # The GraphQL node ID.
    string node_id?;
    # The API URL of the resource.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The contents of the comment.
    string body;
    # The relative path of the file being commented on
    string? path?;
    # The line index in the diff
    int? position?;
    # The line of the blob the comment refers to
    int? line?;
    # The SHA of the commit the comment was made on.
    string commit_id?;
    # A GitHub user
    User user?;
    # The date and time the resource was created, in ISO 8601 format.
    string created_at?;
    # The date and time the resource was last updated, in ISO 8601 format.
    string updated_at?;
    # How the author is associated with the repository.
    string author_association?;
};

# A required reviewing team
public type RuleReviewer record {
    # The ID of the team required to review matching pull requests.
    int id;
    # The type of actor required to review - always `Team`.
    string 'type;
};

# A reviewing team, and file patterns describing which files they must approve changes to.
public type RuleRequiredReviewerConfiguration record {
    # The file patterns the required reviewer must approve changes to.
    string[] file_patterns;
    # The number of approvals required from the reviewing team.
    int minimum_approvals;
    # A required reviewing team
    RuleReviewer reviewer;
};

# A Git commit
public type Commit record {
    # The commit SHA
    string id;
    # The SHA of the Git tree associated with this commit.
    string tree_id?;
    # Whether this commit is distinct from any that have been pushed before
    boolean 'distinct?;
    # The commit message.
    string message;
    # The ISO 8601 timestamp of the commit.
    string timestamp?;
    # URL that points to the commit API resource.
    string url?;
    # Git author/committer metadata
    CommitAuthor author?;
    # Git author/committer metadata
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
    # The id of the check.
    int id;
    # The name of the check run.
    string name;
    # The GraphQL node ID.
    string node_id?;
    # The SHA of the commit that is being checked.
    string head_sha?;
    # A reference for the check run on the integrator's system.
    string? external_id?;
    # The API URL of the resource.
    string url?;
    # The URL of the resource on GitHub.com.
    string html_url?;
    # The URL of the integrator's site with the full details of the check.
    string? details_url?;
    # The phase of the lifecycle that the check is currently in. Statuses of waiting, requested, and pending are reserved for GitHub Actions check runs.
    string status?;
    # The result of the completed check run. This value will be `null` until the check run has completed.
    string? conclusion?;
    # The time that the check run began.
    string? started_at?;
    # The time the check completed.
    string? completed_at?;
    # The check run's title, summary, and detailed output text.
    Output output?;
    # The check suite this check run belongs to.
    CheckRunCheckSuite check_suite?;
    # A GitHub App
    App app?;
    # Pull requests that are open with a `head_sha` or `head_branch` that matches the check. The returned pull requests do not necessarily indicate pull requests that triggered the check.
    PullRequestMinimal[] pull_requests?;
};

# The check run's title, summary, and detailed output text.
public type Output record {
    # The title of the check run output, or null if not set.
    string? title?;
    # The summary of the check run output, or null if not set.
    string? summary?;
    # The detailed text of the check run output, or null if not set.
    string? text?;
    # The number of annotations included in the output.
    int annotations_count?;
    # The API URL listing the annotations for this check run.
    string annotations_url?;
};

# The check suite this check run belongs to.
public type CheckRunCheckSuite record {
    # The unique identifier of the resource.
    int id?;
};

# Payload for membership events (team member added/removed)
public type MembershipPayload record {
    # The action that was performed. Can be one of: added, removed.
    string action;
    # A GitHub user
    User? member;
    # The scope of the membership (currently always "team")
    string scope;
    # A GitHub organization team
    Team team;
    # A GitHub user
    User sender?;
    # A GitHub organization
    Organization organization?;
    # A GitHub App installation
    Installation installation?;
    # A GitHub Enterprise account
    Enterprise enterprise?;
};

# The union of every possible webhook payload type this listener can receive.
public type GenericDataType App|ForkPayload|WorkflowRunPayload|GollumPayload|ReleasePayload|MarketplacePurchase|SecretScanningAlertLocationPayload|DeploymentReviewPayload|PullRequest|SecretScanningScanPayload|IssueCommentPayload|DeploymentStatusPayload|OrganizationPayload|WebhookHeaders|RepositoryDispatchPayload|MergeGroupPayload|WorkflowJobPayload|OrgBlockPayload|Tier|DependabotAlertPayload|RuleActor|CustomPropertyValuesPayload|SecretScanningAlertPayload|PullRequestReviewThreadPayload|RuleWorkflowFileReference|RuleDismissalRestriction|IssueComment|RulePatternParameters|RegistryPackagePayload|CheckSuitePayload|DiscussionCommentPayload|RepositoryImportPayload|RepositoryPayload|StarPayload|WatchPayload|PackagePayload|WorkflowDispatchPayload|RuleCodeScanningTool|SponsorshipPayload|SubIssuesPayload|ProjectColumnPayload|Team|MarketplacePurchasePayload|PushPayload|BranchProtectionRulePayload|PullRequestReviewCommentPayload|'ProjectsV2ItemPayload|CreatePayload|Repository|PullRequestReviewComment|TeamPayload|ProjectPayload|InstallationTargetPayload|DeploymentStatus|InstallationRepositoriesPayload|Issue|Label|Deployment|BranchProtectionConfigurationPayload|RepositoryRulesetPayload|SecurityAndAnalysisPayload|DeployKeyPayload|IssueDependenciesPayload|RepositoryAdvisoryPayload|RepositoryVulnerabilityAlertPayload|IssuesPayload|CodeScanningAlertPayload|PullRequestReviewPayload|'ProjectsV2Payload|PersonalAccessTokenRequestPayload|InstallationPayload|WorkflowRun|DiscussionPayload|CheckSuite|StatusPayload|'ProjectsV2StatusUpdatePayload|PullRequestMinimal|Discussion|User|PullRequestReview|Category|DeletePayload|MetaPayload|DeploymentPayload|RuleStatusCheckConfiguration|LabelPayload|GithubAppAuthorizationPayload|PageBuildPayload|ProjectCardPayload|PullRequestPayload|TeamAddPayload|WorkflowJob|Release|CustomPropertyPayload|PublicPayload|MemberPayload|MilestonePayload|SecurityAdvisoryPayload|CheckRunPayload|CommitCommentPayload|RuleReviewer|RuleRequiredReviewerConfiguration|Commit|CheckRun|MembershipPayload|Workflow|Package|Organization|SecurityVulnerability|Installation|PullRequestRef|PingPayload|Enterprise|CommitAuthor|Milestone|CommonPayload|DeploymentProtectionRulePayload;
