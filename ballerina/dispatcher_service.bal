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

import ballerina/crypto;
import ballerina/data.jsondata;
import ballerina/http;
import ballerina/log;
import ballerinax/asyncapi.native.handler;

final readonly & map<typedesc<GenericDataType>> EVENT_PAYLOAD_TYPES = {"delete": DeletePayload, "meta_deleted": MetaPayload, "workflow_dispatch": WorkflowDispatchPayload, "security_and_analysis": SecurityAndAnalysisPayload, "deploy_key_created": DeployKeyPayload, "deploy_key_deleted": DeployKeyPayload, "project_column_moved": ProjectColumnPayload, "project_column_edited": ProjectColumnPayload, "project_column_deleted": ProjectColumnPayload, "project_column_created": ProjectColumnPayload, "marketplace_purchase_purchased": MarketplacePurchasePayload, "marketplace_purchase_cancelled": MarketplacePurchasePayload, "marketplace_purchase_pending_change_cancelled": MarketplacePurchasePayload, "marketplace_purchase_pending_change": MarketplacePurchasePayload, "marketplace_purchase_changed": MarketplacePurchasePayload, "branch_protection_configuration_enabled": BranchProtectionConfigurationPayload, "branch_protection_configuration_disabled": BranchProtectionConfigurationPayload, "pull_request_enqueued": PullRequestPayload, "pull_request_review_request_removed": PullRequestPayload, "pull_request_opened": PullRequestPayload, "pull_request_ready_for_review": PullRequestPayload, "pull_request_labeled": PullRequestPayload, "pull_request_unassigned": PullRequestPayload, "pull_request_edited": PullRequestPayload, "pull_request_synchronize": PullRequestPayload, "pull_request_review_requested": PullRequestPayload, "pull_request_reopened": PullRequestPayload, "pull_request_auto_merge_disabled": PullRequestPayload, "pull_request_locked": PullRequestPayload, "pull_request_auto_merge_enabled": PullRequestPayload, "pull_request_milestoned": PullRequestPayload, "pull_request_dequeued": PullRequestPayload, "pull_request_unlabeled": PullRequestPayload, "pull_request_closed": PullRequestPayload, "pull_request_unlocked": PullRequestPayload, "pull_request_assigned": PullRequestPayload, "pull_request_converted_to_draft": PullRequestPayload, "pull_request_demilestoned": PullRequestPayload, "label_edited": LabelPayload, "label_created": LabelPayload, "label_deleted": LabelPayload, "deployment_created": DeploymentPayload, "team_add": TeamAddPayload, "code_scanning_alert_appeared_in_branch": CodeScanningAlertPayload, "code_scanning_alert_closed_by_user": CodeScanningAlertPayload, "code_scanning_alert_created": CodeScanningAlertPayload, "code_scanning_alert_fixed": CodeScanningAlertPayload, "code_scanning_alert_reopened": CodeScanningAlertPayload, "code_scanning_alert_reopened_by_user": CodeScanningAlertPayload, "code_scanning_alert_updated_assignment": CodeScanningAlertPayload, "membership_added": MembershipPayload, "membership_removed": MembershipPayload, "secret_scanning_alert_assigned": SecretScanningAlertPayload, "secret_scanning_alert_reopened": SecretScanningAlertPayload, "secret_scanning_alert_unassigned": SecretScanningAlertPayload, "secret_scanning_alert_created": SecretScanningAlertPayload, "secret_scanning_alert_publicly_leaked": SecretScanningAlertPayload, "secret_scanning_alert_validated": SecretScanningAlertPayload, "secret_scanning_alert_resolved": SecretScanningAlertPayload, "push": PushPayload, "member_edited": MemberPayload, "member_added": MemberPayload, "member_removed": MemberPayload, "repository_dispatch": RepositoryDispatchPayload, "status": StatusPayload, "repository_import": RepositoryImportPayload, "personal_access_token_request_created": PersonalAccessTokenRequestPayload, "personal_access_token_request_approved": PersonalAccessTokenRequestPayload, "personal_access_token_request_denied": PersonalAccessTokenRequestPayload, "personal_access_token_request_cancelled": PersonalAccessTokenRequestPayload, "sub_issues_sub_issue_added": SubIssuesPayload, "sub_issues_parent_issue_added": SubIssuesPayload, "sub_issues_sub_issue_removed": SubIssuesPayload, "sub_issues_parent_issue_removed": SubIssuesPayload, "repository_ruleset_created": RepositoryRulesetPayload, "repository_ruleset_edited": RepositoryRulesetPayload, "repository_ruleset_deleted": RepositoryRulesetPayload, "milestone_created": MilestonePayload, "milestone_edited": MilestonePayload, "milestone_opened": MilestonePayload, "milestone_deleted": MilestonePayload, "milestone_closed": MilestonePayload, "public": PublicPayload, "workflow_run_in_progress": WorkflowRunPayload, "workflow_run_completed": WorkflowRunPayload, "workflow_run_requested": WorkflowRunPayload, "projects_v2_status_update_edited": 'ProjectsV2StatusUpdatePayload, "projects_v2_status_update_deleted": 'ProjectsV2StatusUpdatePayload, "projects_v2_status_update_created": 'ProjectsV2StatusUpdatePayload, "projects_v2_item_edited": 'ProjectsV2ItemPayload, "projects_v2_item_created": 'ProjectsV2ItemPayload, "projects_v2_item_archived": 'ProjectsV2ItemPayload, "projects_v2_item_deleted": 'ProjectsV2ItemPayload, "projects_v2_item_restored": 'ProjectsV2ItemPayload, "projects_v2_item_reordered": 'ProjectsV2ItemPayload, "projects_v2_item_converted": 'ProjectsV2ItemPayload, "sponsorship_cancelled": SponsorshipPayload, "sponsorship_edited": SponsorshipPayload, "sponsorship_tier_changed": SponsorshipPayload, "sponsorship_pending_cancellation": SponsorshipPayload, "sponsorship_created": SponsorshipPayload, "sponsorship_pending_tier_change": SponsorshipPayload, "merge_group_destroyed": MergeGroupPayload, "merge_group_checks_requested": MergeGroupPayload, "project_deleted": ProjectPayload, "project_created": ProjectPayload, "project_closed": ProjectPayload, "project_reopened": ProjectPayload, "project_edited": ProjectPayload, "org_block_blocked": OrgBlockPayload, "org_block_unblocked": OrgBlockPayload, "secret_scanning_alert_location": SecretScanningAlertLocationPayload, "installation_target_renamed": InstallationTargetPayload, "check_suite_completed": CheckSuitePayload, "check_suite_requested": CheckSuitePayload, "check_suite_rerequested": CheckSuitePayload, "ping": PingPayload, "issue_comment_edited": IssueCommentPayload, "issue_comment_pinned": IssueCommentPayload, "issue_comment_deleted": IssueCommentPayload, "issue_comment_created": IssueCommentPayload, "issue_comment_unpinned": IssueCommentPayload, "security_advisory_withdrawn": SecurityAdvisoryPayload, "security_advisory_published": SecurityAdvisoryPayload, "security_advisory_updated": SecurityAdvisoryPayload, "package_published": PackagePayload, "package_updated": PackagePayload, "discussion_unanswered": DiscussionPayload, "discussion_created": DiscussionPayload, "discussion_transferred": DiscussionPayload, "discussion_category_changed": DiscussionPayload, "discussion_deleted": DiscussionPayload, "discussion_unlocked": DiscussionPayload, "discussion_pinned": DiscussionPayload, "discussion_edited": DiscussionPayload, "discussion_reopened": DiscussionPayload, "discussion_answered": DiscussionPayload, "discussion_closed": DiscussionPayload, "discussion_unlabeled": DiscussionPayload, "discussion_labeled": DiscussionPayload, "discussion_unpinned": DiscussionPayload, "discussion_locked": DiscussionPayload, "fork": ForkPayload, "pull_request_review_submitted": PullRequestReviewPayload, "pull_request_review_edited": PullRequestReviewPayload, "pull_request_review_dismissed": PullRequestReviewPayload, "organization_member_added": OrganizationPayload, "organization_member_removed": OrganizationPayload, "organization_deleted": OrganizationPayload, "organization_renamed": OrganizationPayload, "organization_member_invited": OrganizationPayload, "issues_reopened": IssuesPayload, "issues_transferred": IssuesPayload, "issues_unpinned": IssuesPayload, "issues_assigned": IssuesPayload, "issues_milestoned": IssuesPayload, "issues_labeled": IssuesPayload, "issues_opened": IssuesPayload, "issues_pinned": IssuesPayload, "issues_typed": IssuesPayload, "issues_edited": IssuesPayload, "issues_untyped": IssuesPayload, "issues_demilestoned": IssuesPayload, "issues_locked": IssuesPayload, "issues_unassigned": IssuesPayload, "issues_unlocked": IssuesPayload, "issues_unlabeled": IssuesPayload, "issues_closed": IssuesPayload, "issues_deleted": IssuesPayload, "registry_package_updated": RegistryPackagePayload, "registry_package_published": RegistryPackagePayload, "projects_v2_created": 'ProjectsV2Payload, "projects_v2_edited": 'ProjectsV2Payload, "projects_v2_closed": 'ProjectsV2Payload, "projects_v2_reopened": 'ProjectsV2Payload, "projects_v2_deleted": 'ProjectsV2Payload, "repository_vulnerability_alert_resolve": RepositoryVulnerabilityAlertPayload, "repository_vulnerability_alert_reopen": RepositoryVulnerabilityAlertPayload, "repository_vulnerability_alert_dismiss": RepositoryVulnerabilityAlertPayload, "repository_vulnerability_alert_create": RepositoryVulnerabilityAlertPayload, "star_created": StarPayload, "star_deleted": StarPayload, "create": CreatePayload, "deployment_review_requested": DeploymentReviewPayload, "deployment_review_rejected": DeploymentReviewPayload, "deployment_review_approved": DeploymentReviewPayload, "gollum": GollumPayload, "github_app_authorization_revoked": GithubAppAuthorizationPayload, "watch_started": WatchPayload, "team_created": TeamPayload, "team_deleted": TeamPayload, "team_edited": TeamPayload, "team_added_to_repository": TeamPayload, "team_removed_from_repository": TeamPayload, "workflow_job_queued": WorkflowJobPayload, "workflow_job_waiting": WorkflowJobPayload, "workflow_job_completed": WorkflowJobPayload, "workflow_job_in_progress": WorkflowJobPayload, "release_created": ReleasePayload, "release_published": ReleasePayload, "release_released": ReleasePayload, "release_prereleased": ReleasePayload, "release_unpublished": ReleasePayload, "release_deleted": ReleasePayload, "release_edited": ReleasePayload, "installation_new_permissions_accepted": InstallationPayload, "installation_suspend": InstallationPayload, "installation_created": InstallationPayload, "installation_deleted": InstallationPayload, "installation_unsuspend": InstallationPayload, "commit_comment_created": CommitCommentPayload, "discussion_comment_deleted": DiscussionCommentPayload, "discussion_comment_created": DiscussionCommentPayload, "discussion_comment_edited": DiscussionCommentPayload, "branch_protection_rule_deleted": BranchProtectionRulePayload, "branch_protection_rule_edited": BranchProtectionRulePayload, "branch_protection_rule_created": BranchProtectionRulePayload, "issue_dependencies_blocking_removed": IssueDependenciesPayload, "issue_dependencies_blocked_by_removed": IssueDependenciesPayload, "issue_dependencies_blocking_added": IssueDependenciesPayload, "issue_dependencies_blocked_by_added": IssueDependenciesPayload, "repository_privatized": RepositoryPayload, "repository_created": RepositoryPayload, "repository_renamed": RepositoryPayload, "repository_transferred": RepositoryPayload, "repository_edited": RepositoryPayload, "repository_deleted": RepositoryPayload, "repository_archived": RepositoryPayload, "repository_publicized": RepositoryPayload, "repository_unarchived": RepositoryPayload, "pull_request_review_comment_created": PullRequestReviewCommentPayload, "pull_request_review_comment_deleted": PullRequestReviewCommentPayload, "pull_request_review_comment_edited": PullRequestReviewCommentPayload, "deployment_protection_rule": DeploymentProtectionRulePayload, "custom_property_values_updated": CustomPropertyValuesPayload, "installation_repositories_removed": InstallationRepositoriesPayload, "installation_repositories_added": InstallationRepositoriesPayload, "secret_scanning_scan": SecretScanningScanPayload, "project_card_edited": ProjectCardPayload, "project_card_deleted": ProjectCardPayload, "project_card_moved": ProjectCardPayload, "project_card_converted": ProjectCardPayload, "project_card_created": ProjectCardPayload, "check_run_created": CheckRunPayload, "check_run_completed": CheckRunPayload, "check_run_requested_action": CheckRunPayload, "check_run_rerequested": CheckRunPayload, "page_build": PageBuildPayload, "custom_property_updated": CustomPropertyPayload, "custom_property_deleted": CustomPropertyPayload, "custom_property_promote_to_enterprise": CustomPropertyPayload, "custom_property_created": CustomPropertyPayload, "dependabot_alert_auto_dismissed": DependabotAlertPayload, "dependabot_alert_auto_reopened": DependabotAlertPayload, "dependabot_alert_created": DependabotAlertPayload, "dependabot_alert_dismissed": DependabotAlertPayload, "dependabot_alert_reopened": DependabotAlertPayload, "dependabot_alert_reintroduced": DependabotAlertPayload, "dependabot_alert_assignees_changed": DependabotAlertPayload, "dependabot_alert_fixed": DependabotAlertPayload, "deployment_status_created": DeploymentStatusPayload, "repository_advisory_reported": RepositoryAdvisoryPayload, "repository_advisory_published": RepositoryAdvisoryPayload, "pull_request_review_thread_unresolved": PullRequestReviewThreadPayload, "pull_request_review_thread_resolved": PullRequestReviewThreadPayload};

service class DispatcherService {
    *http:Service;
    private map<GenericServiceType> services = {};
    private handler:NativeHandler nativeHandler = new ();
    private string? webhookSecret;

    function init(string? webhookSecret) {
        self.webhookSecret = webhookSecret;
    }

    isolated function addServiceRef(string serviceType, GenericServiceType genericService) returns error? {
        if (self.services.hasKey(serviceType)) {
            return error(string `Service of type ${serviceType} has already been attached`);
        }
        self.services[serviceType] = genericService;
    }

    isolated function removeServiceRef(string serviceType) returns error? {
        if (!self.services.hasKey(serviceType)) {
            return error(string `Cannot detach the service of type ${serviceType}. Service has not been attached to the listener before`);
        }
        _ = self.services.remove(serviceType);
    }

    private isolated function parseEventPayload(json payload, string eventKey, string? fallbackKey = ()) returns GenericDataType|error {
        typedesc<GenericDataType>? targetType = EVENT_PAYLOAD_TYPES[eventKey];
        if targetType is () && fallbackKey is string {
            targetType = EVENT_PAYLOAD_TYPES[fallbackKey];
        }
        if targetType is () {
            return error(string `Unrecognized event identifier: ${eventKey}`);
        }
        return jsondata:parseAsType(payload, {allowDataProjection: {nilAsOptionalField: true, absentAsNilableType: true}}, targetType);
    }

    resource function post .(http:Caller caller, http:Request request) returns error? {
        error? verifyResult = self.verifyWebhookSignature(request, self.webhookSecret);
        if verifyResult is error {
            http:Response r = new;
            r.statusCode = http:STATUS_UNAUTHORIZED;
            check caller->respond(r);
            return;
        }
        json payload = check request.getJsonPayload();
        string|error eventTypeResult = request.getHeader("X-GitHub-Event");
        if eventTypeResult is error {
            http:Response badRequest = new;
            badRequest.statusCode = http:STATUS_BAD_REQUEST;
            check caller->respond(badRequest);
            return;
        }
        string eventType = eventTypeResult;
        json|error actionField = payload.action;
        string eventIdentifier = eventType;
        if actionField is json && actionField != () {
            eventIdentifier = eventType + "_" + actionField.toString();
        }
        GenericDataType genericDataType = check self.parseEventPayload(payload, eventIdentifier, eventType);
        http:Response ackResponse = new;
        ackResponse.statusCode = http:STATUS_OK;
        check caller->respond(ackResponse);
        error? dispatchResult = self.matchRemoteFunc(genericDataType, eventIdentifier, eventType);
        if dispatchResult is error {
            log:printError("DISPATCH_FAILED", dispatchResult);
        }
    }

    private isolated function verifyWebhookSignature(http:Request request, string? webhookSecret) returns error? {
        if webhookSecret is () {
            return error("Unauthorized: Webhook Secret Not Configured");
        }
        if !request.hasHeader("X-Hub-Signature-256") {
            return error("Unauthorized: Missing Signature Header");
        }
        string receivedHeader = check request.getHeader("X-Hub-Signature-256");
        map<string> extractedHeaderValues = {};
        int headerCursor = 0;
        if !receivedHeader.substring(headerCursor).startsWith("sha256=") {
            return error("Unauthorized: Malformed Signature Header");
        }
        headerCursor += 7;
        extractedHeaderValues["signature"] = receivedHeader.substring(headerCursor);
        headerCursor = receivedHeader.length();
        if !extractedHeaderValues.hasKey("signature") {
            return error("Unauthorized: Missing Header Component: signature");
        }
        string payloadToHash = string `${check request.getTextPayload()}`;
        byte[] computedDigest = check crypto:hmacSha256(payloadToHash.toBytes(), webhookSecret.toBytes());
        string computedSignature = computedDigest.toBase16();
        string expectedHeader = string `sha256=${computedSignature}`;
        if !crypto:equalConstantTime(receivedHeader.toBytes(), expectedHeader.toBytes()) {
            return error("Unauthorized: Signature Mismatch");
        }
    }

    private isolated function matchRemoteFunc(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        check self.matchRemoteFuncForDelete(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForMeta(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForWorkflowDispatch(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForSecurityAndAnalysis(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForDeployKey(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForProjectColumn(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForMarketplacePurchase(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForBranchProtectionConfiguration(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForPullRequest(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForLabel(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForDeployment(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForTeamAdd(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForCodeScanningAlert(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForMembership(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForSecretScanningAlert(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForPush(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForMember(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForRepositoryDispatch(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForStatus(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForRepositoryImport(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForPersonalAccessTokenRequest(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForSubIssues(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForRepositoryRuleset(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForMilestone(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForPublic(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForWorkflowRun(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForProjectsV2statusUpdate(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForProjectsV2item(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForSponsorship(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForMergeGroup(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForProject(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForOrgBlock(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForSecretScanningAlertLocation(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForInstallationTarget(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForCheckSuite(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForPing(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForIssueComment(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForSecurityAdvisory(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForPackage(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForDiscussion(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForFork(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForPullRequestReview(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForOrganization(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForIssues(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForRegistryPackage(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForProjectsV2(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForRepositoryVulnerabilityAlert(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForStar(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForCreate(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForDeploymentReview(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForGollum(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForGithubAppAuthorization(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForWatch(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForTeam(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForWorkflowJob(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForRelease(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForInstallation(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForCommitComment(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForDiscussionComment(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForBranchProtectionRule(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForIssueDependencies(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForRepository(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForPullRequestReviewComment(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForDeploymentProtectionRule(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForCustomPropertyValues(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForInstallationRepositories(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForSecretScanningScan(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForProjectCard(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForCheckRun(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForPageBuild(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForCustomProperty(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForDependabotAlert(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForDeploymentStatus(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForRepositoryAdvisory(genericDataType, eventIdentifier, eventType);
        check self.matchRemoteFuncForPullRequestReviewThread(genericDataType, eventIdentifier, eventType);
    }

    private isolated function matchRemoteFuncForDelete(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "delete" => {
                check self.executeRemoteFunc(genericDataType, "delete", "DeleteService", "onDelete");
            }
        }
    }

    private isolated function matchRemoteFuncForMeta(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "meta_deleted" => {
                check self.executeRemoteFunc(genericDataType, "meta_deleted", "MetaService", "onMetaDeleted");
            }
        }
    }

    private isolated function matchRemoteFuncForWorkflowDispatch(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "workflow_dispatch" => {
                check self.executeRemoteFunc(genericDataType, "workflow_dispatch", "WorkflowDispatchService", "onWorkflowDispatch");
            }
        }
    }

    private isolated function matchRemoteFuncForSecurityAndAnalysis(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "security_and_analysis" => {
                check self.executeRemoteFunc(genericDataType, "security_and_analysis", "SecurityAndAnalysisService", "onSecurityAndAnalysis");
            }
        }
    }

    private isolated function matchRemoteFuncForDeployKey(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "deploy_key_created" => {
                check self.executeRemoteFunc(genericDataType, "deploy_key_created", "DeployKeyService", "onDeployKeyCreated");
            }
            "deploy_key_deleted" => {
                check self.executeRemoteFunc(genericDataType, "deploy_key_deleted", "DeployKeyService", "onDeployKeyDeleted");
            }
        }
    }

    private isolated function matchRemoteFuncForProjectColumn(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "project_column_moved" => {
                check self.executeRemoteFunc(genericDataType, "project_column_moved", "ProjectColumnService", "onProjectColumnMoved");
            }
            "project_column_edited" => {
                check self.executeRemoteFunc(genericDataType, "project_column_edited", "ProjectColumnService", "onProjectColumnEdited");
            }
            "project_column_deleted" => {
                check self.executeRemoteFunc(genericDataType, "project_column_deleted", "ProjectColumnService", "onProjectColumnDeleted");
            }
            "project_column_created" => {
                check self.executeRemoteFunc(genericDataType, "project_column_created", "ProjectColumnService", "onProjectColumnCreated");
            }
        }
    }

    private isolated function matchRemoteFuncForMarketplacePurchase(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "marketplace_purchase_purchased" => {
                check self.executeRemoteFunc(genericDataType, "marketplace_purchase_purchased", "MarketplacePurchaseService", "onMarketplacePurchasePurchased");
            }
            "marketplace_purchase_cancelled" => {
                check self.executeRemoteFunc(genericDataType, "marketplace_purchase_cancelled", "MarketplacePurchaseService", "onMarketplacePurchaseCancelled");
            }
            "marketplace_purchase_pending_change_cancelled" => {
                check self.executeRemoteFunc(genericDataType, "marketplace_purchase_pending_change_cancelled", "MarketplacePurchaseService", "onMarketplacePurchasePendingChangeCancelled");
            }
            "marketplace_purchase_pending_change" => {
                check self.executeRemoteFunc(genericDataType, "marketplace_purchase_pending_change", "MarketplacePurchaseService", "onMarketplacePurchasePendingChange");
            }
            "marketplace_purchase_changed" => {
                check self.executeRemoteFunc(genericDataType, "marketplace_purchase_changed", "MarketplacePurchaseService", "onMarketplacePurchaseChanged");
            }
        }
    }

    private isolated function matchRemoteFuncForBranchProtectionConfiguration(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "branch_protection_configuration_enabled" => {
                check self.executeRemoteFunc(genericDataType, "branch_protection_configuration_enabled", "BranchProtectionConfigurationService", "onBranchProtectionConfigurationEnabled");
            }
            "branch_protection_configuration_disabled" => {
                check self.executeRemoteFunc(genericDataType, "branch_protection_configuration_disabled", "BranchProtectionConfigurationService", "onBranchProtectionConfigurationDisabled");
            }
        }
    }

    private isolated function matchRemoteFuncForPullRequest(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "pull_request_enqueued" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_enqueued", "PullRequestService", "onPullRequestEnqueued");
            }
            "pull_request_review_request_removed" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_review_request_removed", "PullRequestService", "onPullRequestReviewRequestRemoved");
            }
            "pull_request_opened" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_opened", "PullRequestService", "onPullRequestOpened");
            }
            "pull_request_ready_for_review" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_ready_for_review", "PullRequestService", "onPullRequestReadyForReview");
            }
            "pull_request_labeled" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_labeled", "PullRequestService", "onPullRequestLabeled");
            }
            "pull_request_unassigned" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_unassigned", "PullRequestService", "onPullRequestUnassigned");
            }
            "pull_request_edited" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_edited", "PullRequestService", "onPullRequestEdited");
            }
            "pull_request_synchronize" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_synchronize", "PullRequestService", "onPullRequestSynchronize");
            }
            "pull_request_review_requested" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_review_requested", "PullRequestService", "onPullRequestReviewRequested");
            }
            "pull_request_reopened" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_reopened", "PullRequestService", "onPullRequestReopened");
            }
            "pull_request_auto_merge_disabled" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_auto_merge_disabled", "PullRequestService", "onPullRequestAutoMergeDisabled");
            }
            "pull_request_locked" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_locked", "PullRequestService", "onPullRequestLocked");
            }
            "pull_request_auto_merge_enabled" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_auto_merge_enabled", "PullRequestService", "onPullRequestAutoMergeEnabled");
            }
            "pull_request_milestoned" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_milestoned", "PullRequestService", "onPullRequestMilestoned");
            }
            "pull_request_dequeued" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_dequeued", "PullRequestService", "onPullRequestDequeued");
            }
            "pull_request_unlabeled" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_unlabeled", "PullRequestService", "onPullRequestUnlabeled");
            }
            "pull_request_closed" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_closed", "PullRequestService", "onPullRequestClosed");
            }
            "pull_request_unlocked" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_unlocked", "PullRequestService", "onPullRequestUnlocked");
            }
            "pull_request_assigned" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_assigned", "PullRequestService", "onPullRequestAssigned");
            }
            "pull_request_converted_to_draft" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_converted_to_draft", "PullRequestService", "onPullRequestConvertedToDraft");
            }
            "pull_request_demilestoned" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_demilestoned", "PullRequestService", "onPullRequestDemilestoned");
            }
        }
    }

    private isolated function matchRemoteFuncForLabel(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "label_edited" => {
                check self.executeRemoteFunc(genericDataType, "label_edited", "LabelService", "onLabelEdited");
            }
            "label_created" => {
                check self.executeRemoteFunc(genericDataType, "label_created", "LabelService", "onLabelCreated");
            }
            "label_deleted" => {
                check self.executeRemoteFunc(genericDataType, "label_deleted", "LabelService", "onLabelDeleted");
            }
        }
    }

    private isolated function matchRemoteFuncForDeployment(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "deployment_created" => {
                check self.executeRemoteFunc(genericDataType, "deployment_created", "DeploymentService", "onDeploymentCreated");
            }
        }
    }

    private isolated function matchRemoteFuncForTeamAdd(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "team_add" => {
                check self.executeRemoteFunc(genericDataType, "team_add", "TeamAddService", "onTeamAdd");
            }
        }
    }

    private isolated function matchRemoteFuncForCodeScanningAlert(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "code_scanning_alert_appeared_in_branch" => {
                check self.executeRemoteFunc(genericDataType, "code_scanning_alert_appeared_in_branch", "CodeScanningAlertService", "onCodeScanningAlertAppearedInBranch");
            }
            "code_scanning_alert_closed_by_user" => {
                check self.executeRemoteFunc(genericDataType, "code_scanning_alert_closed_by_user", "CodeScanningAlertService", "onCodeScanningAlertClosedByUser");
            }
            "code_scanning_alert_created" => {
                check self.executeRemoteFunc(genericDataType, "code_scanning_alert_created", "CodeScanningAlertService", "onCodeScanningAlertCreated");
            }
            "code_scanning_alert_fixed" => {
                check self.executeRemoteFunc(genericDataType, "code_scanning_alert_fixed", "CodeScanningAlertService", "onCodeScanningAlertFixed");
            }
            "code_scanning_alert_reopened" => {
                check self.executeRemoteFunc(genericDataType, "code_scanning_alert_reopened", "CodeScanningAlertService", "onCodeScanningAlertReopened");
            }
            "code_scanning_alert_reopened_by_user" => {
                check self.executeRemoteFunc(genericDataType, "code_scanning_alert_reopened_by_user", "CodeScanningAlertService", "onCodeScanningAlertReopenedByUser");
            }
            "code_scanning_alert_updated_assignment" => {
                check self.executeRemoteFunc(genericDataType, "code_scanning_alert_updated_assignment", "CodeScanningAlertService", "onCodeScanningAlertUpdatedAssignment");
            }
        }
    }

    private isolated function matchRemoteFuncForMembership(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "membership_added" => {
                check self.executeRemoteFunc(genericDataType, "membership_added", "MembershipService", "onMembershipAdded");
            }
            "membership_removed" => {
                check self.executeRemoteFunc(genericDataType, "membership_removed", "MembershipService", "onMembershipRemoved");
            }
        }
    }

    private isolated function matchRemoteFuncForSecretScanningAlert(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "secret_scanning_alert_assigned" => {
                check self.executeRemoteFunc(genericDataType, "secret_scanning_alert_assigned", "SecretScanningAlertService", "onSecretScanningAlertAssigned");
            }
            "secret_scanning_alert_reopened" => {
                check self.executeRemoteFunc(genericDataType, "secret_scanning_alert_reopened", "SecretScanningAlertService", "onSecretScanningAlertReopened");
            }
            "secret_scanning_alert_unassigned" => {
                check self.executeRemoteFunc(genericDataType, "secret_scanning_alert_unassigned", "SecretScanningAlertService", "onSecretScanningAlertUnassigned");
            }
            "secret_scanning_alert_created" => {
                check self.executeRemoteFunc(genericDataType, "secret_scanning_alert_created", "SecretScanningAlertService", "onSecretScanningAlertCreated");
            }
            "secret_scanning_alert_publicly_leaked" => {
                check self.executeRemoteFunc(genericDataType, "secret_scanning_alert_publicly_leaked", "SecretScanningAlertService", "onSecretScanningAlertPubliclyLeaked");
            }
            "secret_scanning_alert_validated" => {
                check self.executeRemoteFunc(genericDataType, "secret_scanning_alert_validated", "SecretScanningAlertService", "onSecretScanningAlertValidated");
            }
            "secret_scanning_alert_resolved" => {
                check self.executeRemoteFunc(genericDataType, "secret_scanning_alert_resolved", "SecretScanningAlertService", "onSecretScanningAlertResolved");
            }
        }
    }

    private isolated function matchRemoteFuncForPush(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "push" => {
                check self.executeRemoteFunc(genericDataType, "push", "PushService", "onPush");
            }
        }
    }

    private isolated function matchRemoteFuncForMember(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "member_edited" => {
                check self.executeRemoteFunc(genericDataType, "member_edited", "MemberService", "onMemberEdited");
            }
            "member_added" => {
                check self.executeRemoteFunc(genericDataType, "member_added", "MemberService", "onMemberAdded");
            }
            "member_removed" => {
                check self.executeRemoteFunc(genericDataType, "member_removed", "MemberService", "onMemberRemoved");
            }
        }
    }

    private isolated function matchRemoteFuncForRepositoryDispatch(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventType {
            "repository_dispatch" => {
                check self.executeRemoteFunc(genericDataType, "repository_dispatch", "RepositoryDispatchService", "onRepositoryDispatch");
            }
        }
    }

    private isolated function matchRemoteFuncForStatus(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "status" => {
                check self.executeRemoteFunc(genericDataType, "status", "StatusService", "onStatus");
            }
        }
    }

    private isolated function matchRemoteFuncForRepositoryImport(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "repository_import" => {
                check self.executeRemoteFunc(genericDataType, "repository_import", "RepositoryImportService", "onRepositoryImport");
            }
        }
    }

    private isolated function matchRemoteFuncForPersonalAccessTokenRequest(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "personal_access_token_request_created" => {
                check self.executeRemoteFunc(genericDataType, "personal_access_token_request_created", "PersonalAccessTokenRequestService", "onPersonalAccessTokenRequestCreated");
            }
            "personal_access_token_request_approved" => {
                check self.executeRemoteFunc(genericDataType, "personal_access_token_request_approved", "PersonalAccessTokenRequestService", "onPersonalAccessTokenRequestApproved");
            }
            "personal_access_token_request_denied" => {
                check self.executeRemoteFunc(genericDataType, "personal_access_token_request_denied", "PersonalAccessTokenRequestService", "onPersonalAccessTokenRequestDenied");
            }
            "personal_access_token_request_cancelled" => {
                check self.executeRemoteFunc(genericDataType, "personal_access_token_request_cancelled", "PersonalAccessTokenRequestService", "onPersonalAccessTokenRequestCancelled");
            }
        }
    }

    private isolated function matchRemoteFuncForSubIssues(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "sub_issues_sub_issue_added" => {
                check self.executeRemoteFunc(genericDataType, "sub_issues_sub_issue_added", "SubIssuesService", "onSubIssuesSubIssueAdded");
            }
            "sub_issues_parent_issue_added" => {
                check self.executeRemoteFunc(genericDataType, "sub_issues_parent_issue_added", "SubIssuesService", "onSubIssuesParentIssueAdded");
            }
            "sub_issues_sub_issue_removed" => {
                check self.executeRemoteFunc(genericDataType, "sub_issues_sub_issue_removed", "SubIssuesService", "onSubIssuesSubIssueRemoved");
            }
            "sub_issues_parent_issue_removed" => {
                check self.executeRemoteFunc(genericDataType, "sub_issues_parent_issue_removed", "SubIssuesService", "onSubIssuesParentIssueRemoved");
            }
        }
    }

    private isolated function matchRemoteFuncForRepositoryRuleset(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "repository_ruleset_created" => {
                check self.executeRemoteFunc(genericDataType, "repository_ruleset_created", "RepositoryRulesetService", "onRepositoryRulesetCreated");
            }
            "repository_ruleset_edited" => {
                check self.executeRemoteFunc(genericDataType, "repository_ruleset_edited", "RepositoryRulesetService", "onRepositoryRulesetEdited");
            }
            "repository_ruleset_deleted" => {
                check self.executeRemoteFunc(genericDataType, "repository_ruleset_deleted", "RepositoryRulesetService", "onRepositoryRulesetDeleted");
            }
        }
    }

    private isolated function matchRemoteFuncForMilestone(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "milestone_created" => {
                check self.executeRemoteFunc(genericDataType, "milestone_created", "MilestoneService", "onMilestoneCreated");
            }
            "milestone_edited" => {
                check self.executeRemoteFunc(genericDataType, "milestone_edited", "MilestoneService", "onMilestoneEdited");
            }
            "milestone_opened" => {
                check self.executeRemoteFunc(genericDataType, "milestone_opened", "MilestoneService", "onMilestoneOpened");
            }
            "milestone_deleted" => {
                check self.executeRemoteFunc(genericDataType, "milestone_deleted", "MilestoneService", "onMilestoneDeleted");
            }
            "milestone_closed" => {
                check self.executeRemoteFunc(genericDataType, "milestone_closed", "MilestoneService", "onMilestoneClosed");
            }
        }
    }

    private isolated function matchRemoteFuncForPublic(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "public" => {
                check self.executeRemoteFunc(genericDataType, "public", "PublicService", "onPublic");
            }
        }
    }

    private isolated function matchRemoteFuncForWorkflowRun(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "workflow_run_in_progress" => {
                check self.executeRemoteFunc(genericDataType, "workflow_run_in_progress", "WorkflowRunService", "onWorkflowRunInProgress");
            }
            "workflow_run_completed" => {
                check self.executeRemoteFunc(genericDataType, "workflow_run_completed", "WorkflowRunService", "onWorkflowRunCompleted");
            }
            "workflow_run_requested" => {
                check self.executeRemoteFunc(genericDataType, "workflow_run_requested", "WorkflowRunService", "onWorkflowRunRequested");
            }
        }
    }

    private isolated function matchRemoteFuncForProjectsV2statusUpdate(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "projects_v2_status_update_edited" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_status_update_edited", "ProjectsV2statusUpdateService", "onProjectsV2StatusUpdateEdited");
            }
            "projects_v2_status_update_deleted" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_status_update_deleted", "ProjectsV2statusUpdateService", "onProjectsV2StatusUpdateDeleted");
            }
            "projects_v2_status_update_created" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_status_update_created", "ProjectsV2statusUpdateService", "onProjectsV2StatusUpdateCreated");
            }
        }
    }

    private isolated function matchRemoteFuncForProjectsV2item(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "projects_v2_item_edited" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_item_edited", "ProjectsV2itemService", "onProjectsV2ItemEdited");
            }
            "projects_v2_item_created" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_item_created", "ProjectsV2itemService", "onProjectsV2ItemCreated");
            }
            "projects_v2_item_archived" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_item_archived", "ProjectsV2itemService", "onProjectsV2ItemArchived");
            }
            "projects_v2_item_deleted" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_item_deleted", "ProjectsV2itemService", "onProjectsV2ItemDeleted");
            }
            "projects_v2_item_restored" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_item_restored", "ProjectsV2itemService", "onProjectsV2ItemRestored");
            }
            "projects_v2_item_reordered" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_item_reordered", "ProjectsV2itemService", "onProjectsV2ItemReordered");
            }
            "projects_v2_item_converted" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_item_converted", "ProjectsV2itemService", "onProjectsV2ItemConverted");
            }
        }
    }

    private isolated function matchRemoteFuncForSponsorship(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "sponsorship_cancelled" => {
                check self.executeRemoteFunc(genericDataType, "sponsorship_cancelled", "SponsorshipService", "onSponsorshipCancelled");
            }
            "sponsorship_edited" => {
                check self.executeRemoteFunc(genericDataType, "sponsorship_edited", "SponsorshipService", "onSponsorshipEdited");
            }
            "sponsorship_tier_changed" => {
                check self.executeRemoteFunc(genericDataType, "sponsorship_tier_changed", "SponsorshipService", "onSponsorshipTierChanged");
            }
            "sponsorship_pending_cancellation" => {
                check self.executeRemoteFunc(genericDataType, "sponsorship_pending_cancellation", "SponsorshipService", "onSponsorshipPendingCancellation");
            }
            "sponsorship_created" => {
                check self.executeRemoteFunc(genericDataType, "sponsorship_created", "SponsorshipService", "onSponsorshipCreated");
            }
            "sponsorship_pending_tier_change" => {
                check self.executeRemoteFunc(genericDataType, "sponsorship_pending_tier_change", "SponsorshipService", "onSponsorshipPendingTierChange");
            }
        }
    }

    private isolated function matchRemoteFuncForMergeGroup(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "merge_group_destroyed" => {
                check self.executeRemoteFunc(genericDataType, "merge_group_destroyed", "MergeGroupService", "onMergeGroupDestroyed");
            }
            "merge_group_checks_requested" => {
                check self.executeRemoteFunc(genericDataType, "merge_group_checks_requested", "MergeGroupService", "onMergeGroupChecksRequested");
            }
        }
    }

    private isolated function matchRemoteFuncForProject(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "project_deleted" => {
                check self.executeRemoteFunc(genericDataType, "project_deleted", "ProjectService", "onProjectDeleted");
            }
            "project_created" => {
                check self.executeRemoteFunc(genericDataType, "project_created", "ProjectService", "onProjectCreated");
            }
            "project_closed" => {
                check self.executeRemoteFunc(genericDataType, "project_closed", "ProjectService", "onProjectClosed");
            }
            "project_reopened" => {
                check self.executeRemoteFunc(genericDataType, "project_reopened", "ProjectService", "onProjectReopened");
            }
            "project_edited" => {
                check self.executeRemoteFunc(genericDataType, "project_edited", "ProjectService", "onProjectEdited");
            }
        }
    }

    private isolated function matchRemoteFuncForOrgBlock(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "org_block_blocked" => {
                check self.executeRemoteFunc(genericDataType, "org_block_blocked", "OrgBlockService", "onOrgBlockBlocked");
            }
            "org_block_unblocked" => {
                check self.executeRemoteFunc(genericDataType, "org_block_unblocked", "OrgBlockService", "onOrgBlockUnblocked");
            }
        }
    }

    private isolated function matchRemoteFuncForSecretScanningAlertLocation(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "secret_scanning_alert_location" => {
                check self.executeRemoteFunc(genericDataType, "secret_scanning_alert_location", "SecretScanningAlertLocationService", "onSecretScanningAlertLocation");
            }
        }
    }

    private isolated function matchRemoteFuncForInstallationTarget(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "installation_target_renamed" => {
                check self.executeRemoteFunc(genericDataType, "installation_target_renamed", "InstallationTargetService", "onInstallationTargetRenamed");
            }
        }
    }

    private isolated function matchRemoteFuncForCheckSuite(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "check_suite_completed" => {
                check self.executeRemoteFunc(genericDataType, "check_suite_completed", "CheckSuiteService", "onCheckSuiteCompleted");
            }
            "check_suite_requested" => {
                check self.executeRemoteFunc(genericDataType, "check_suite_requested", "CheckSuiteService", "onCheckSuiteRequested");
            }
            "check_suite_rerequested" => {
                check self.executeRemoteFunc(genericDataType, "check_suite_rerequested", "CheckSuiteService", "onCheckSuiteRerequested");
            }
        }
    }

    private isolated function matchRemoteFuncForPing(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "ping" => {
                check self.executeRemoteFunc(genericDataType, "ping", "PingService", "onPing");
            }
        }
    }

    private isolated function matchRemoteFuncForIssueComment(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "issue_comment_edited" => {
                check self.executeRemoteFunc(genericDataType, "issue_comment_edited", "IssueCommentService", "onIssueCommentEdited");
            }
            "issue_comment_pinned" => {
                check self.executeRemoteFunc(genericDataType, "issue_comment_pinned", "IssueCommentService", "onIssueCommentPinned");
            }
            "issue_comment_deleted" => {
                check self.executeRemoteFunc(genericDataType, "issue_comment_deleted", "IssueCommentService", "onIssueCommentDeleted");
            }
            "issue_comment_created" => {
                check self.executeRemoteFunc(genericDataType, "issue_comment_created", "IssueCommentService", "onIssueCommentCreated");
            }
            "issue_comment_unpinned" => {
                check self.executeRemoteFunc(genericDataType, "issue_comment_unpinned", "IssueCommentService", "onIssueCommentUnpinned");
            }
        }
    }

    private isolated function matchRemoteFuncForSecurityAdvisory(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "security_advisory_withdrawn" => {
                check self.executeRemoteFunc(genericDataType, "security_advisory_withdrawn", "SecurityAdvisoryService", "onSecurityAdvisoryWithdrawn");
            }
            "security_advisory_published" => {
                check self.executeRemoteFunc(genericDataType, "security_advisory_published", "SecurityAdvisoryService", "onSecurityAdvisoryPublished");
            }
            "security_advisory_updated" => {
                check self.executeRemoteFunc(genericDataType, "security_advisory_updated", "SecurityAdvisoryService", "onSecurityAdvisoryUpdated");
            }
        }
    }

    private isolated function matchRemoteFuncForPackage(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "package_published" => {
                check self.executeRemoteFunc(genericDataType, "package_published", "PackageService", "onPackagePublished");
            }
            "package_updated" => {
                check self.executeRemoteFunc(genericDataType, "package_updated", "PackageService", "onPackageUpdated");
            }
        }
    }

    private isolated function matchRemoteFuncForDiscussion(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "discussion_unanswered" => {
                check self.executeRemoteFunc(genericDataType, "discussion_unanswered", "DiscussionService", "onDiscussionUnanswered");
            }
            "discussion_created" => {
                check self.executeRemoteFunc(genericDataType, "discussion_created", "DiscussionService", "onDiscussionCreated");
            }
            "discussion_transferred" => {
                check self.executeRemoteFunc(genericDataType, "discussion_transferred", "DiscussionService", "onDiscussionTransferred");
            }
            "discussion_category_changed" => {
                check self.executeRemoteFunc(genericDataType, "discussion_category_changed", "DiscussionService", "onDiscussionCategoryChanged");
            }
            "discussion_deleted" => {
                check self.executeRemoteFunc(genericDataType, "discussion_deleted", "DiscussionService", "onDiscussionDeleted");
            }
            "discussion_unlocked" => {
                check self.executeRemoteFunc(genericDataType, "discussion_unlocked", "DiscussionService", "onDiscussionUnlocked");
            }
            "discussion_pinned" => {
                check self.executeRemoteFunc(genericDataType, "discussion_pinned", "DiscussionService", "onDiscussionPinned");
            }
            "discussion_edited" => {
                check self.executeRemoteFunc(genericDataType, "discussion_edited", "DiscussionService", "onDiscussionEdited");
            }
            "discussion_reopened" => {
                check self.executeRemoteFunc(genericDataType, "discussion_reopened", "DiscussionService", "onDiscussionReopened");
            }
            "discussion_answered" => {
                check self.executeRemoteFunc(genericDataType, "discussion_answered", "DiscussionService", "onDiscussionAnswered");
            }
            "discussion_closed" => {
                check self.executeRemoteFunc(genericDataType, "discussion_closed", "DiscussionService", "onDiscussionClosed");
            }
            "discussion_unlabeled" => {
                check self.executeRemoteFunc(genericDataType, "discussion_unlabeled", "DiscussionService", "onDiscussionUnlabeled");
            }
            "discussion_labeled" => {
                check self.executeRemoteFunc(genericDataType, "discussion_labeled", "DiscussionService", "onDiscussionLabeled");
            }
            "discussion_unpinned" => {
                check self.executeRemoteFunc(genericDataType, "discussion_unpinned", "DiscussionService", "onDiscussionUnpinned");
            }
            "discussion_locked" => {
                check self.executeRemoteFunc(genericDataType, "discussion_locked", "DiscussionService", "onDiscussionLocked");
            }
        }
    }

    private isolated function matchRemoteFuncForFork(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "fork" => {
                check self.executeRemoteFunc(genericDataType, "fork", "ForkService", "onFork");
            }
        }
    }

    private isolated function matchRemoteFuncForPullRequestReview(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "pull_request_review_submitted" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_review_submitted", "PullRequestReviewService", "onPullRequestReviewSubmitted");
            }
            "pull_request_review_edited" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_review_edited", "PullRequestReviewService", "onPullRequestReviewEdited");
            }
            "pull_request_review_dismissed" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_review_dismissed", "PullRequestReviewService", "onPullRequestReviewDismissed");
            }
        }
    }

    private isolated function matchRemoteFuncForOrganization(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "organization_member_added" => {
                check self.executeRemoteFunc(genericDataType, "organization_member_added", "OrganizationService", "onOrganizationMemberAdded");
            }
            "organization_member_removed" => {
                check self.executeRemoteFunc(genericDataType, "organization_member_removed", "OrganizationService", "onOrganizationMemberRemoved");
            }
            "organization_deleted" => {
                check self.executeRemoteFunc(genericDataType, "organization_deleted", "OrganizationService", "onOrganizationDeleted");
            }
            "organization_renamed" => {
                check self.executeRemoteFunc(genericDataType, "organization_renamed", "OrganizationService", "onOrganizationRenamed");
            }
            "organization_member_invited" => {
                check self.executeRemoteFunc(genericDataType, "organization_member_invited", "OrganizationService", "onOrganizationMemberInvited");
            }
        }
    }

    private isolated function matchRemoteFuncForIssues(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "issues_reopened" => {
                check self.executeRemoteFunc(genericDataType, "issues_reopened", "IssuesService", "onIssuesReopened");
            }
            "issues_transferred" => {
                check self.executeRemoteFunc(genericDataType, "issues_transferred", "IssuesService", "onIssuesTransferred");
            }
            "issues_unpinned" => {
                check self.executeRemoteFunc(genericDataType, "issues_unpinned", "IssuesService", "onIssuesUnpinned");
            }
            "issues_assigned" => {
                check self.executeRemoteFunc(genericDataType, "issues_assigned", "IssuesService", "onIssuesAssigned");
            }
            "issues_milestoned" => {
                check self.executeRemoteFunc(genericDataType, "issues_milestoned", "IssuesService", "onIssuesMilestoned");
            }
            "issues_labeled" => {
                check self.executeRemoteFunc(genericDataType, "issues_labeled", "IssuesService", "onIssuesLabeled");
            }
            "issues_opened" => {
                check self.executeRemoteFunc(genericDataType, "issues_opened", "IssuesService", "onIssuesOpened");
            }
            "issues_pinned" => {
                check self.executeRemoteFunc(genericDataType, "issues_pinned", "IssuesService", "onIssuesPinned");
            }
            "issues_typed" => {
                check self.executeRemoteFunc(genericDataType, "issues_typed", "IssuesService", "onIssuesTyped");
            }
            "issues_edited" => {
                check self.executeRemoteFunc(genericDataType, "issues_edited", "IssuesService", "onIssuesEdited");
            }
            "issues_untyped" => {
                check self.executeRemoteFunc(genericDataType, "issues_untyped", "IssuesService", "onIssuesUntyped");
            }
            "issues_demilestoned" => {
                check self.executeRemoteFunc(genericDataType, "issues_demilestoned", "IssuesService", "onIssuesDemilestoned");
            }
            "issues_locked" => {
                check self.executeRemoteFunc(genericDataType, "issues_locked", "IssuesService", "onIssuesLocked");
            }
            "issues_unassigned" => {
                check self.executeRemoteFunc(genericDataType, "issues_unassigned", "IssuesService", "onIssuesUnassigned");
            }
            "issues_unlocked" => {
                check self.executeRemoteFunc(genericDataType, "issues_unlocked", "IssuesService", "onIssuesUnlocked");
            }
            "issues_unlabeled" => {
                check self.executeRemoteFunc(genericDataType, "issues_unlabeled", "IssuesService", "onIssuesUnlabeled");
            }
            "issues_closed" => {
                check self.executeRemoteFunc(genericDataType, "issues_closed", "IssuesService", "onIssuesClosed");
            }
            "issues_deleted" => {
                check self.executeRemoteFunc(genericDataType, "issues_deleted", "IssuesService", "onIssuesDeleted");
            }
        }
    }

    private isolated function matchRemoteFuncForRegistryPackage(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "registry_package_updated" => {
                check self.executeRemoteFunc(genericDataType, "registry_package_updated", "RegistryPackageService", "onRegistryPackageUpdated");
            }
            "registry_package_published" => {
                check self.executeRemoteFunc(genericDataType, "registry_package_published", "RegistryPackageService", "onRegistryPackagePublished");
            }
        }
    }

    private isolated function matchRemoteFuncForProjectsV2(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "projects_v2_created" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_created", "ProjectsV2Service", "onProjectsV2Created");
            }
            "projects_v2_edited" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_edited", "ProjectsV2Service", "onProjectsV2Edited");
            }
            "projects_v2_closed" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_closed", "ProjectsV2Service", "onProjectsV2Closed");
            }
            "projects_v2_reopened" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_reopened", "ProjectsV2Service", "onProjectsV2Reopened");
            }
            "projects_v2_deleted" => {
                check self.executeRemoteFunc(genericDataType, "projects_v2_deleted", "ProjectsV2Service", "onProjectsV2Deleted");
            }
        }
    }

    private isolated function matchRemoteFuncForRepositoryVulnerabilityAlert(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "repository_vulnerability_alert_resolve" => {
                check self.executeRemoteFunc(genericDataType, "repository_vulnerability_alert_resolve", "RepositoryVulnerabilityAlertService", "onRepositoryVulnerabilityAlertResolve");
            }
            "repository_vulnerability_alert_reopen" => {
                check self.executeRemoteFunc(genericDataType, "repository_vulnerability_alert_reopen", "RepositoryVulnerabilityAlertService", "onRepositoryVulnerabilityAlertReopen");
            }
            "repository_vulnerability_alert_dismiss" => {
                check self.executeRemoteFunc(genericDataType, "repository_vulnerability_alert_dismiss", "RepositoryVulnerabilityAlertService", "onRepositoryVulnerabilityAlertDismiss");
            }
            "repository_vulnerability_alert_create" => {
                check self.executeRemoteFunc(genericDataType, "repository_vulnerability_alert_create", "RepositoryVulnerabilityAlertService", "onRepositoryVulnerabilityAlertCreate");
            }
        }
    }

    private isolated function matchRemoteFuncForStar(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "star_created" => {
                check self.executeRemoteFunc(genericDataType, "star_created", "StarService", "onStarCreated");
            }
            "star_deleted" => {
                check self.executeRemoteFunc(genericDataType, "star_deleted", "StarService", "onStarDeleted");
            }
        }
    }

    private isolated function matchRemoteFuncForCreate(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "create" => {
                check self.executeRemoteFunc(genericDataType, "create", "CreateService", "onCreate");
            }
        }
    }

    private isolated function matchRemoteFuncForDeploymentReview(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "deployment_review_requested" => {
                check self.executeRemoteFunc(genericDataType, "deployment_review_requested", "DeploymentReviewService", "onDeploymentReviewRequested");
            }
            "deployment_review_rejected" => {
                check self.executeRemoteFunc(genericDataType, "deployment_review_rejected", "DeploymentReviewService", "onDeploymentReviewRejected");
            }
            "deployment_review_approved" => {
                check self.executeRemoteFunc(genericDataType, "deployment_review_approved", "DeploymentReviewService", "onDeploymentReviewApproved");
            }
        }
    }

    private isolated function matchRemoteFuncForGollum(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "gollum" => {
                check self.executeRemoteFunc(genericDataType, "gollum", "GollumService", "onGollum");
            }
        }
    }

    private isolated function matchRemoteFuncForGithubAppAuthorization(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "github_app_authorization_revoked" => {
                check self.executeRemoteFunc(genericDataType, "github_app_authorization_revoked", "GithubAppAuthorizationService", "onGithubAppAuthorizationRevoked");
            }
        }
    }

    private isolated function matchRemoteFuncForWatch(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "watch_started" => {
                check self.executeRemoteFunc(genericDataType, "watch_started", "WatchService", "onWatchStarted");
            }
        }
    }

    private isolated function matchRemoteFuncForTeam(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "team_created" => {
                check self.executeRemoteFunc(genericDataType, "team_created", "TeamService", "onTeamCreated");
            }
            "team_deleted" => {
                check self.executeRemoteFunc(genericDataType, "team_deleted", "TeamService", "onTeamDeleted");
            }
            "team_edited" => {
                check self.executeRemoteFunc(genericDataType, "team_edited", "TeamService", "onTeamEdited");
            }
            "team_added_to_repository" => {
                check self.executeRemoteFunc(genericDataType, "team_added_to_repository", "TeamService", "onTeamAddedToRepository");
            }
            "team_removed_from_repository" => {
                check self.executeRemoteFunc(genericDataType, "team_removed_from_repository", "TeamService", "onTeamRemovedFromRepository");
            }
        }
    }

    private isolated function matchRemoteFuncForWorkflowJob(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "workflow_job_queued" => {
                check self.executeRemoteFunc(genericDataType, "workflow_job_queued", "WorkflowJobService", "onWorkflowJobQueued");
            }
            "workflow_job_waiting" => {
                check self.executeRemoteFunc(genericDataType, "workflow_job_waiting", "WorkflowJobService", "onWorkflowJobWaiting");
            }
            "workflow_job_completed" => {
                check self.executeRemoteFunc(genericDataType, "workflow_job_completed", "WorkflowJobService", "onWorkflowJobCompleted");
            }
            "workflow_job_in_progress" => {
                check self.executeRemoteFunc(genericDataType, "workflow_job_in_progress", "WorkflowJobService", "onWorkflowJobInProgress");
            }
        }
    }

    private isolated function matchRemoteFuncForRelease(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "release_created" => {
                check self.executeRemoteFunc(genericDataType, "release_created", "ReleaseService", "onReleaseCreated");
            }
            "release_published" => {
                check self.executeRemoteFunc(genericDataType, "release_published", "ReleaseService", "onReleasePublished");
            }
            "release_released" => {
                check self.executeRemoteFunc(genericDataType, "release_released", "ReleaseService", "onReleaseReleased");
            }
            "release_prereleased" => {
                check self.executeRemoteFunc(genericDataType, "release_prereleased", "ReleaseService", "onReleasePrereleased");
            }
            "release_unpublished" => {
                check self.executeRemoteFunc(genericDataType, "release_unpublished", "ReleaseService", "onReleaseUnpublished");
            }
            "release_deleted" => {
                check self.executeRemoteFunc(genericDataType, "release_deleted", "ReleaseService", "onReleaseDeleted");
            }
            "release_edited" => {
                check self.executeRemoteFunc(genericDataType, "release_edited", "ReleaseService", "onReleaseEdited");
            }
        }
    }

    private isolated function matchRemoteFuncForInstallation(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "installation_new_permissions_accepted" => {
                check self.executeRemoteFunc(genericDataType, "installation_new_permissions_accepted", "InstallationService", "onInstallationNewPermissionsAccepted");
            }
            "installation_suspend" => {
                check self.executeRemoteFunc(genericDataType, "installation_suspend", "InstallationService", "onInstallationSuspend");
            }
            "installation_created" => {
                check self.executeRemoteFunc(genericDataType, "installation_created", "InstallationService", "onInstallationCreated");
            }
            "installation_deleted" => {
                check self.executeRemoteFunc(genericDataType, "installation_deleted", "InstallationService", "onInstallationDeleted");
            }
            "installation_unsuspend" => {
                check self.executeRemoteFunc(genericDataType, "installation_unsuspend", "InstallationService", "onInstallationUnsuspend");
            }
        }
    }

    private isolated function matchRemoteFuncForCommitComment(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "commit_comment_created" => {
                check self.executeRemoteFunc(genericDataType, "commit_comment_created", "CommitCommentService", "onCommitCommentCreated");
            }
        }
    }

    private isolated function matchRemoteFuncForDiscussionComment(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "discussion_comment_deleted" => {
                check self.executeRemoteFunc(genericDataType, "discussion_comment_deleted", "DiscussionCommentService", "onDiscussionCommentDeleted");
            }
            "discussion_comment_created" => {
                check self.executeRemoteFunc(genericDataType, "discussion_comment_created", "DiscussionCommentService", "onDiscussionCommentCreated");
            }
            "discussion_comment_edited" => {
                check self.executeRemoteFunc(genericDataType, "discussion_comment_edited", "DiscussionCommentService", "onDiscussionCommentEdited");
            }
        }
    }

    private isolated function matchRemoteFuncForBranchProtectionRule(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "branch_protection_rule_deleted" => {
                check self.executeRemoteFunc(genericDataType, "branch_protection_rule_deleted", "BranchProtectionRuleService", "onBranchProtectionRuleDeleted");
            }
            "branch_protection_rule_edited" => {
                check self.executeRemoteFunc(genericDataType, "branch_protection_rule_edited", "BranchProtectionRuleService", "onBranchProtectionRuleEdited");
            }
            "branch_protection_rule_created" => {
                check self.executeRemoteFunc(genericDataType, "branch_protection_rule_created", "BranchProtectionRuleService", "onBranchProtectionRuleCreated");
            }
        }
    }

    private isolated function matchRemoteFuncForIssueDependencies(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "issue_dependencies_blocking_removed" => {
                check self.executeRemoteFunc(genericDataType, "issue_dependencies_blocking_removed", "IssueDependenciesService", "onIssueDependenciesBlockingRemoved");
            }
            "issue_dependencies_blocked_by_removed" => {
                check self.executeRemoteFunc(genericDataType, "issue_dependencies_blocked_by_removed", "IssueDependenciesService", "onIssueDependenciesBlockedByRemoved");
            }
            "issue_dependencies_blocking_added" => {
                check self.executeRemoteFunc(genericDataType, "issue_dependencies_blocking_added", "IssueDependenciesService", "onIssueDependenciesBlockingAdded");
            }
            "issue_dependencies_blocked_by_added" => {
                check self.executeRemoteFunc(genericDataType, "issue_dependencies_blocked_by_added", "IssueDependenciesService", "onIssueDependenciesBlockedByAdded");
            }
        }
    }

    private isolated function matchRemoteFuncForRepository(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "repository_privatized" => {
                check self.executeRemoteFunc(genericDataType, "repository_privatized", "RepositoryService", "onRepositoryPrivatized");
            }
            "repository_created" => {
                check self.executeRemoteFunc(genericDataType, "repository_created", "RepositoryService", "onRepositoryCreated");
            }
            "repository_renamed" => {
                check self.executeRemoteFunc(genericDataType, "repository_renamed", "RepositoryService", "onRepositoryRenamed");
            }
            "repository_transferred" => {
                check self.executeRemoteFunc(genericDataType, "repository_transferred", "RepositoryService", "onRepositoryTransferred");
            }
            "repository_edited" => {
                check self.executeRemoteFunc(genericDataType, "repository_edited", "RepositoryService", "onRepositoryEdited");
            }
            "repository_deleted" => {
                check self.executeRemoteFunc(genericDataType, "repository_deleted", "RepositoryService", "onRepositoryDeleted");
            }
            "repository_archived" => {
                check self.executeRemoteFunc(genericDataType, "repository_archived", "RepositoryService", "onRepositoryArchived");
            }
            "repository_publicized" => {
                check self.executeRemoteFunc(genericDataType, "repository_publicized", "RepositoryService", "onRepositoryPublicized");
            }
            "repository_unarchived" => {
                check self.executeRemoteFunc(genericDataType, "repository_unarchived", "RepositoryService", "onRepositoryUnarchived");
            }
        }
    }

    private isolated function matchRemoteFuncForPullRequestReviewComment(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "pull_request_review_comment_created" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_review_comment_created", "PullRequestReviewCommentService", "onPullRequestReviewCommentCreated");
            }
            "pull_request_review_comment_deleted" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_review_comment_deleted", "PullRequestReviewCommentService", "onPullRequestReviewCommentDeleted");
            }
            "pull_request_review_comment_edited" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_review_comment_edited", "PullRequestReviewCommentService", "onPullRequestReviewCommentEdited");
            }
        }
    }

    private isolated function matchRemoteFuncForDeploymentProtectionRule(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "deployment_protection_rule" => {
                check self.executeRemoteFunc(genericDataType, "deployment_protection_rule", "DeploymentProtectionRuleService", "onDeploymentProtectionRule");
            }
        }
    }

    private isolated function matchRemoteFuncForCustomPropertyValues(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "custom_property_values_updated" => {
                check self.executeRemoteFunc(genericDataType, "custom_property_values_updated", "CustomPropertyValuesService", "onCustomPropertyValuesUpdated");
            }
        }
    }

    private isolated function matchRemoteFuncForInstallationRepositories(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "installation_repositories_removed" => {
                check self.executeRemoteFunc(genericDataType, "installation_repositories_removed", "InstallationRepositoriesService", "onInstallationRepositoriesRemoved");
            }
            "installation_repositories_added" => {
                check self.executeRemoteFunc(genericDataType, "installation_repositories_added", "InstallationRepositoriesService", "onInstallationRepositoriesAdded");
            }
        }
    }

    private isolated function matchRemoteFuncForSecretScanningScan(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "secret_scanning_scan" => {
                check self.executeRemoteFunc(genericDataType, "secret_scanning_scan", "SecretScanningScanService", "onSecretScanningScan");
            }
        }
    }

    private isolated function matchRemoteFuncForProjectCard(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "project_card_edited" => {
                check self.executeRemoteFunc(genericDataType, "project_card_edited", "ProjectCardService", "onProjectCardEdited");
            }
            "project_card_deleted" => {
                check self.executeRemoteFunc(genericDataType, "project_card_deleted", "ProjectCardService", "onProjectCardDeleted");
            }
            "project_card_moved" => {
                check self.executeRemoteFunc(genericDataType, "project_card_moved", "ProjectCardService", "onProjectCardMoved");
            }
            "project_card_converted" => {
                check self.executeRemoteFunc(genericDataType, "project_card_converted", "ProjectCardService", "onProjectCardConverted");
            }
            "project_card_created" => {
                check self.executeRemoteFunc(genericDataType, "project_card_created", "ProjectCardService", "onProjectCardCreated");
            }
        }
    }

    private isolated function matchRemoteFuncForCheckRun(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "check_run_created" => {
                check self.executeRemoteFunc(genericDataType, "check_run_created", "CheckRunService", "onCheckRunCreated");
            }
            "check_run_completed" => {
                check self.executeRemoteFunc(genericDataType, "check_run_completed", "CheckRunService", "onCheckRunCompleted");
            }
            "check_run_requested_action" => {
                check self.executeRemoteFunc(genericDataType, "check_run_requested_action", "CheckRunService", "onCheckRunRequestedAction");
            }
            "check_run_rerequested" => {
                check self.executeRemoteFunc(genericDataType, "check_run_rerequested", "CheckRunService", "onCheckRunRerequested");
            }
        }
    }

    private isolated function matchRemoteFuncForPageBuild(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "page_build" => {
                check self.executeRemoteFunc(genericDataType, "page_build", "PageBuildService", "onPageBuild");
            }
        }
    }

    private isolated function matchRemoteFuncForCustomProperty(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "custom_property_updated" => {
                check self.executeRemoteFunc(genericDataType, "custom_property_updated", "CustomPropertyService", "onCustomPropertyUpdated");
            }
            "custom_property_deleted" => {
                check self.executeRemoteFunc(genericDataType, "custom_property_deleted", "CustomPropertyService", "onCustomPropertyDeleted");
            }
            "custom_property_promote_to_enterprise" => {
                check self.executeRemoteFunc(genericDataType, "custom_property_promote_to_enterprise", "CustomPropertyService", "onCustomPropertyPromoteToEnterprise");
            }
            "custom_property_created" => {
                check self.executeRemoteFunc(genericDataType, "custom_property_created", "CustomPropertyService", "onCustomPropertyCreated");
            }
        }
    }

    private isolated function matchRemoteFuncForDependabotAlert(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "dependabot_alert_auto_dismissed" => {
                check self.executeRemoteFunc(genericDataType, "dependabot_alert_auto_dismissed", "DependabotAlertService", "onDependabotAlertAutoDismissed");
            }
            "dependabot_alert_auto_reopened" => {
                check self.executeRemoteFunc(genericDataType, "dependabot_alert_auto_reopened", "DependabotAlertService", "onDependabotAlertAutoReopened");
            }
            "dependabot_alert_created" => {
                check self.executeRemoteFunc(genericDataType, "dependabot_alert_created", "DependabotAlertService", "onDependabotAlertCreated");
            }
            "dependabot_alert_dismissed" => {
                check self.executeRemoteFunc(genericDataType, "dependabot_alert_dismissed", "DependabotAlertService", "onDependabotAlertDismissed");
            }
            "dependabot_alert_reopened" => {
                check self.executeRemoteFunc(genericDataType, "dependabot_alert_reopened", "DependabotAlertService", "onDependabotAlertReopened");
            }
            "dependabot_alert_reintroduced" => {
                check self.executeRemoteFunc(genericDataType, "dependabot_alert_reintroduced", "DependabotAlertService", "onDependabotAlertReintroduced");
            }
            "dependabot_alert_assignees_changed" => {
                check self.executeRemoteFunc(genericDataType, "dependabot_alert_assignees_changed", "DependabotAlertService", "onDependabotAlertAssigneesChanged");
            }
            "dependabot_alert_fixed" => {
                check self.executeRemoteFunc(genericDataType, "dependabot_alert_fixed", "DependabotAlertService", "onDependabotAlertFixed");
            }
        }
    }

    private isolated function matchRemoteFuncForDeploymentStatus(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "deployment_status_created" => {
                check self.executeRemoteFunc(genericDataType, "deployment_status_created", "DeploymentStatusService", "onDeploymentStatusCreated");
            }
        }
    }

    private isolated function matchRemoteFuncForRepositoryAdvisory(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "repository_advisory_reported" => {
                check self.executeRemoteFunc(genericDataType, "repository_advisory_reported", "RepositoryAdvisoryService", "onRepositoryAdvisoryReported");
            }
            "repository_advisory_published" => {
                check self.executeRemoteFunc(genericDataType, "repository_advisory_published", "RepositoryAdvisoryService", "onRepositoryAdvisoryPublished");
            }
        }
    }

    private isolated function matchRemoteFuncForPullRequestReviewThread(GenericDataType genericDataType, string eventIdentifier, string eventType) returns error? {
        match eventIdentifier {
            "pull_request_review_thread_unresolved" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_review_thread_unresolved", "PullRequestReviewThreadService", "onPullRequestReviewThreadUnresolved");
            }
            "pull_request_review_thread_resolved" => {
                check self.executeRemoteFunc(genericDataType, "pull_request_review_thread_resolved", "PullRequestReviewThreadService", "onPullRequestReviewThreadResolved");
            }
        }
    }

    private isolated function executeRemoteFunc(GenericDataType genericEvent, string eventName, string serviceTypeStr, string eventFunction) returns error? {
        GenericServiceType? genericService = self.services[serviceTypeStr];
        if genericService is GenericServiceType {
            check self.nativeHandler.invokeRemoteFunction(genericEvent, eventName, eventFunction, genericService);
        }
    }
}
