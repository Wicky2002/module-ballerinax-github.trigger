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
import ballerina/http;
import ballerina/log;
import ballerinax/asyncapi.native.handler;

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
        http:Response ackResponse = new;
        ackResponse.statusCode = http:STATUS_OK;
        check caller->respond(ackResponse);
        boolean|error dispatchResult = self.matchRemoteFunc(payload, eventIdentifier, eventType);
        if dispatchResult is error {
            log:printError("DISPATCH_FAILED", dispatchResult);
        } else if !dispatchResult {
            log:printWarn("NO_HANDLER_FOR_EVENT", eventIdentifier = eventIdentifier);
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

    private isolated function matchRemoteFunc(json payload, string eventIdentifier, string eventType) returns boolean|error {
        if check self.matchRemoteFuncForDelete(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForMeta(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForWorkflowDispatch(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForSecurityAndAnalysis(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForDeployKey(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForProjectColumn(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForMarketplacePurchase(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForBranchProtectionConfiguration(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForPullRequest(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForLabel(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForDeployment(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForTeamAdd(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForCodeScanningAlert(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForMembership(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForSecretScanningAlert(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForPush(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForMember(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForRepositoryDispatch(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForStatus(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForRepositoryImport(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForPersonalAccessTokenRequest(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForSubIssues(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForRepositoryRuleset(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForMilestone(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForPublic(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForWorkflowRun(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForProjectsV2statusUpdate(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForProjectsV2item(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForSponsorship(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForMergeGroup(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForProject(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForOrgBlock(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForSecretScanningAlertLocation(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForInstallationTarget(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForCheckSuite(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForPing(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForIssueComment(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForSecurityAdvisory(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForPackage(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForDiscussion(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForFork(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForPullRequestReview(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForOrganization(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForIssues(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForRegistryPackage(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForProjectsV2(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForRepositoryVulnerabilityAlert(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForStar(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForCreate(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForDeploymentReview(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForGollum(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForGithubAppAuthorization(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForWatch(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForTeam(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForWorkflowJob(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForRelease(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForInstallation(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForCommitComment(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForDiscussionComment(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForBranchProtectionRule(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForIssueDependencies(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForRepository(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForPullRequestReviewComment(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForDeploymentProtectionRule(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForCustomPropertyValues(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForInstallationRepositories(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForSecretScanningScan(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForProjectCard(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForCheckRun(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForPageBuild(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForCustomProperty(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForDependabotAlert(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForDeploymentStatus(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForRepositoryAdvisory(payload, eventIdentifier, eventType) {
            return true;
        }
        if check self.matchRemoteFuncForPullRequestReviewThread(payload, eventIdentifier, eventType) {
            return true;
        }
        return false;
    }

    private isolated function matchRemoteFuncForDelete(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "delete" => {
                check self.executeRemoteFunc(payload, "delete", "DeleteService", "onDelete");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForMeta(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "meta_deleted" => {
                check self.executeRemoteFunc(payload, "meta_deleted", "MetaService", "onMetaDeleted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForWorkflowDispatch(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "workflow_dispatch" => {
                check self.executeRemoteFunc(payload, "workflow_dispatch", "WorkflowDispatchService", "onWorkflowDispatch");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForSecurityAndAnalysis(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "security_and_analysis" => {
                check self.executeRemoteFunc(payload, "security_and_analysis", "SecurityAndAnalysisService", "onSecurityAndAnalysis");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForDeployKey(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "deploy_key_created" => {
                check self.executeRemoteFunc(payload, "deploy_key_created", "DeployKeyService", "onDeployKeyCreated");
                return true;
            }
            "deploy_key_deleted" => {
                check self.executeRemoteFunc(payload, "deploy_key_deleted", "DeployKeyService", "onDeployKeyDeleted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForProjectColumn(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "project_column_moved" => {
                check self.executeRemoteFunc(payload, "project_column_moved", "ProjectColumnService", "onProjectColumnMoved");
                return true;
            }
            "project_column_edited" => {
                check self.executeRemoteFunc(payload, "project_column_edited", "ProjectColumnService", "onProjectColumnEdited");
                return true;
            }
            "project_column_deleted" => {
                check self.executeRemoteFunc(payload, "project_column_deleted", "ProjectColumnService", "onProjectColumnDeleted");
                return true;
            }
            "project_column_created" => {
                check self.executeRemoteFunc(payload, "project_column_created", "ProjectColumnService", "onProjectColumnCreated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForMarketplacePurchase(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "marketplace_purchase_purchased" => {
                check self.executeRemoteFunc(payload, "marketplace_purchase_purchased", "MarketplacePurchaseService", "onMarketplacePurchasePurchased");
                return true;
            }
            "marketplace_purchase_cancelled" => {
                check self.executeRemoteFunc(payload, "marketplace_purchase_cancelled", "MarketplacePurchaseService", "onMarketplacePurchaseCancelled");
                return true;
            }
            "marketplace_purchase_pending_change_cancelled" => {
                check self.executeRemoteFunc(payload, "marketplace_purchase_pending_change_cancelled", "MarketplacePurchaseService", "onMarketplacePurchasePendingChangeCancelled");
                return true;
            }
            "marketplace_purchase_pending_change" => {
                check self.executeRemoteFunc(payload, "marketplace_purchase_pending_change", "MarketplacePurchaseService", "onMarketplacePurchasePendingChange");
                return true;
            }
            "marketplace_purchase_changed" => {
                check self.executeRemoteFunc(payload, "marketplace_purchase_changed", "MarketplacePurchaseService", "onMarketplacePurchaseChanged");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForBranchProtectionConfiguration(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "branch_protection_configuration_enabled" => {
                check self.executeRemoteFunc(payload, "branch_protection_configuration_enabled", "BranchProtectionConfigurationService", "onBranchProtectionConfigurationEnabled");
                return true;
            }
            "branch_protection_configuration_disabled" => {
                check self.executeRemoteFunc(payload, "branch_protection_configuration_disabled", "BranchProtectionConfigurationService", "onBranchProtectionConfigurationDisabled");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForPullRequest(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "pull_request_enqueued" => {
                check self.executeRemoteFunc(payload, "pull_request_enqueued", "PullRequestService", "onPullRequestEnqueued");
                return true;
            }
            "pull_request_review_request_removed" => {
                check self.executeRemoteFunc(payload, "pull_request_review_request_removed", "PullRequestService", "onPullRequestReviewRequestRemoved");
                return true;
            }
            "pull_request_opened" => {
                check self.executeRemoteFunc(payload, "pull_request_opened", "PullRequestService", "onPullRequestOpened");
                return true;
            }
            "pull_request_ready_for_review" => {
                check self.executeRemoteFunc(payload, "pull_request_ready_for_review", "PullRequestService", "onPullRequestReadyForReview");
                return true;
            }
            "pull_request_labeled" => {
                check self.executeRemoteFunc(payload, "pull_request_labeled", "PullRequestService", "onPullRequestLabeled");
                return true;
            }
            "pull_request_unassigned" => {
                check self.executeRemoteFunc(payload, "pull_request_unassigned", "PullRequestService", "onPullRequestUnassigned");
                return true;
            }
            "pull_request_edited" => {
                check self.executeRemoteFunc(payload, "pull_request_edited", "PullRequestService", "onPullRequestEdited");
                return true;
            }
            "pull_request_synchronize" => {
                check self.executeRemoteFunc(payload, "pull_request_synchronize", "PullRequestService", "onPullRequestSynchronize");
                return true;
            }
            "pull_request_review_requested" => {
                check self.executeRemoteFunc(payload, "pull_request_review_requested", "PullRequestService", "onPullRequestReviewRequested");
                return true;
            }
            "pull_request_reopened" => {
                check self.executeRemoteFunc(payload, "pull_request_reopened", "PullRequestService", "onPullRequestReopened");
                return true;
            }
            "pull_request_auto_merge_disabled" => {
                check self.executeRemoteFunc(payload, "pull_request_auto_merge_disabled", "PullRequestService", "onPullRequestAutoMergeDisabled");
                return true;
            }
            "pull_request_locked" => {
                check self.executeRemoteFunc(payload, "pull_request_locked", "PullRequestService", "onPullRequestLocked");
                return true;
            }
            "pull_request_auto_merge_enabled" => {
                check self.executeRemoteFunc(payload, "pull_request_auto_merge_enabled", "PullRequestService", "onPullRequestAutoMergeEnabled");
                return true;
            }
            "pull_request_milestoned" => {
                check self.executeRemoteFunc(payload, "pull_request_milestoned", "PullRequestService", "onPullRequestMilestoned");
                return true;
            }
            "pull_request_dequeued" => {
                check self.executeRemoteFunc(payload, "pull_request_dequeued", "PullRequestService", "onPullRequestDequeued");
                return true;
            }
            "pull_request_unlabeled" => {
                check self.executeRemoteFunc(payload, "pull_request_unlabeled", "PullRequestService", "onPullRequestUnlabeled");
                return true;
            }
            "pull_request_closed" => {
                check self.executeRemoteFunc(payload, "pull_request_closed", "PullRequestService", "onPullRequestClosed");
                return true;
            }
            "pull_request_unlocked" => {
                check self.executeRemoteFunc(payload, "pull_request_unlocked", "PullRequestService", "onPullRequestUnlocked");
                return true;
            }
            "pull_request_assigned" => {
                check self.executeRemoteFunc(payload, "pull_request_assigned", "PullRequestService", "onPullRequestAssigned");
                return true;
            }
            "pull_request_converted_to_draft" => {
                check self.executeRemoteFunc(payload, "pull_request_converted_to_draft", "PullRequestService", "onPullRequestConvertedToDraft");
                return true;
            }
            "pull_request_demilestoned" => {
                check self.executeRemoteFunc(payload, "pull_request_demilestoned", "PullRequestService", "onPullRequestDemilestoned");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForLabel(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "label_edited" => {
                check self.executeRemoteFunc(payload, "label_edited", "LabelService", "onLabelEdited");
                return true;
            }
            "label_created" => {
                check self.executeRemoteFunc(payload, "label_created", "LabelService", "onLabelCreated");
                return true;
            }
            "label_deleted" => {
                check self.executeRemoteFunc(payload, "label_deleted", "LabelService", "onLabelDeleted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForDeployment(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "deployment_created" => {
                check self.executeRemoteFunc(payload, "deployment_created", "DeploymentService", "onDeploymentCreated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForTeamAdd(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "team_add" => {
                check self.executeRemoteFunc(payload, "team_add", "TeamAddService", "onTeamAdd");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForCodeScanningAlert(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "code_scanning_alert_appeared_in_branch" => {
                check self.executeRemoteFunc(payload, "code_scanning_alert_appeared_in_branch", "CodeScanningAlertService", "onCodeScanningAlertAppearedInBranch");
                return true;
            }
            "code_scanning_alert_closed_by_user" => {
                check self.executeRemoteFunc(payload, "code_scanning_alert_closed_by_user", "CodeScanningAlertService", "onCodeScanningAlertClosedByUser");
                return true;
            }
            "code_scanning_alert_created" => {
                check self.executeRemoteFunc(payload, "code_scanning_alert_created", "CodeScanningAlertService", "onCodeScanningAlertCreated");
                return true;
            }
            "code_scanning_alert_fixed" => {
                check self.executeRemoteFunc(payload, "code_scanning_alert_fixed", "CodeScanningAlertService", "onCodeScanningAlertFixed");
                return true;
            }
            "code_scanning_alert_reopened" => {
                check self.executeRemoteFunc(payload, "code_scanning_alert_reopened", "CodeScanningAlertService", "onCodeScanningAlertReopened");
                return true;
            }
            "code_scanning_alert_reopened_by_user" => {
                check self.executeRemoteFunc(payload, "code_scanning_alert_reopened_by_user", "CodeScanningAlertService", "onCodeScanningAlertReopenedByUser");
                return true;
            }
            "code_scanning_alert_updated_assignment" => {
                check self.executeRemoteFunc(payload, "code_scanning_alert_updated_assignment", "CodeScanningAlertService", "onCodeScanningAlertUpdatedAssignment");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForMembership(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "membership_added" => {
                check self.executeRemoteFunc(payload, "membership_added", "MembershipService", "onMembershipAdded");
                return true;
            }
            "membership_removed" => {
                check self.executeRemoteFunc(payload, "membership_removed", "MembershipService", "onMembershipRemoved");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForSecretScanningAlert(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "secret_scanning_alert_assigned" => {
                check self.executeRemoteFunc(payload, "secret_scanning_alert_assigned", "SecretScanningAlertService", "onSecretScanningAlertAssigned");
                return true;
            }
            "secret_scanning_alert_reopened" => {
                check self.executeRemoteFunc(payload, "secret_scanning_alert_reopened", "SecretScanningAlertService", "onSecretScanningAlertReopened");
                return true;
            }
            "secret_scanning_alert_unassigned" => {
                check self.executeRemoteFunc(payload, "secret_scanning_alert_unassigned", "SecretScanningAlertService", "onSecretScanningAlertUnassigned");
                return true;
            }
            "secret_scanning_alert_created" => {
                check self.executeRemoteFunc(payload, "secret_scanning_alert_created", "SecretScanningAlertService", "onSecretScanningAlertCreated");
                return true;
            }
            "secret_scanning_alert_publicly_leaked" => {
                check self.executeRemoteFunc(payload, "secret_scanning_alert_publicly_leaked", "SecretScanningAlertService", "onSecretScanningAlertPubliclyLeaked");
                return true;
            }
            "secret_scanning_alert_validated" => {
                check self.executeRemoteFunc(payload, "secret_scanning_alert_validated", "SecretScanningAlertService", "onSecretScanningAlertValidated");
                return true;
            }
            "secret_scanning_alert_resolved" => {
                check self.executeRemoteFunc(payload, "secret_scanning_alert_resolved", "SecretScanningAlertService", "onSecretScanningAlertResolved");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForPush(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "push" => {
                check self.executeRemoteFunc(payload, "push", "PushService", "onPush");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForMember(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "member_edited" => {
                check self.executeRemoteFunc(payload, "member_edited", "MemberService", "onMemberEdited");
                return true;
            }
            "member_added" => {
                check self.executeRemoteFunc(payload, "member_added", "MemberService", "onMemberAdded");
                return true;
            }
            "member_removed" => {
                check self.executeRemoteFunc(payload, "member_removed", "MemberService", "onMemberRemoved");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForRepositoryDispatch(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventType {
            "repository_dispatch" => {
                check self.executeRemoteFunc(payload, "repository_dispatch", "RepositoryDispatchService", "onRepositoryDispatch");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForStatus(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "status" => {
                check self.executeRemoteFunc(payload, "status", "StatusService", "onStatus");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForRepositoryImport(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "repository_import" => {
                check self.executeRemoteFunc(payload, "repository_import", "RepositoryImportService", "onRepositoryImport");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForPersonalAccessTokenRequest(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "personal_access_token_request_created" => {
                check self.executeRemoteFunc(payload, "personal_access_token_request_created", "PersonalAccessTokenRequestService", "onPersonalAccessTokenRequestCreated");
                return true;
            }
            "personal_access_token_request_approved" => {
                check self.executeRemoteFunc(payload, "personal_access_token_request_approved", "PersonalAccessTokenRequestService", "onPersonalAccessTokenRequestApproved");
                return true;
            }
            "personal_access_token_request_denied" => {
                check self.executeRemoteFunc(payload, "personal_access_token_request_denied", "PersonalAccessTokenRequestService", "onPersonalAccessTokenRequestDenied");
                return true;
            }
            "personal_access_token_request_cancelled" => {
                check self.executeRemoteFunc(payload, "personal_access_token_request_cancelled", "PersonalAccessTokenRequestService", "onPersonalAccessTokenRequestCancelled");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForSubIssues(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "sub_issues_sub_issue_added" => {
                check self.executeRemoteFunc(payload, "sub_issues_sub_issue_added", "SubIssuesService", "onSubIssuesSubIssueAdded");
                return true;
            }
            "sub_issues_parent_issue_added" => {
                check self.executeRemoteFunc(payload, "sub_issues_parent_issue_added", "SubIssuesService", "onSubIssuesParentIssueAdded");
                return true;
            }
            "sub_issues_sub_issue_removed" => {
                check self.executeRemoteFunc(payload, "sub_issues_sub_issue_removed", "SubIssuesService", "onSubIssuesSubIssueRemoved");
                return true;
            }
            "sub_issues_parent_issue_removed" => {
                check self.executeRemoteFunc(payload, "sub_issues_parent_issue_removed", "SubIssuesService", "onSubIssuesParentIssueRemoved");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForRepositoryRuleset(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "repository_ruleset_created" => {
                check self.executeRemoteFunc(payload, "repository_ruleset_created", "RepositoryRulesetService", "onRepositoryRulesetCreated");
                return true;
            }
            "repository_ruleset_edited" => {
                check self.executeRemoteFunc(payload, "repository_ruleset_edited", "RepositoryRulesetService", "onRepositoryRulesetEdited");
                return true;
            }
            "repository_ruleset_deleted" => {
                check self.executeRemoteFunc(payload, "repository_ruleset_deleted", "RepositoryRulesetService", "onRepositoryRulesetDeleted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForMilestone(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "milestone_created" => {
                check self.executeRemoteFunc(payload, "milestone_created", "MilestoneService", "onMilestoneCreated");
                return true;
            }
            "milestone_edited" => {
                check self.executeRemoteFunc(payload, "milestone_edited", "MilestoneService", "onMilestoneEdited");
                return true;
            }
            "milestone_opened" => {
                check self.executeRemoteFunc(payload, "milestone_opened", "MilestoneService", "onMilestoneOpened");
                return true;
            }
            "milestone_deleted" => {
                check self.executeRemoteFunc(payload, "milestone_deleted", "MilestoneService", "onMilestoneDeleted");
                return true;
            }
            "milestone_closed" => {
                check self.executeRemoteFunc(payload, "milestone_closed", "MilestoneService", "onMilestoneClosed");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForPublic(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "public" => {
                check self.executeRemoteFunc(payload, "public", "PublicService", "onPublic");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForWorkflowRun(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "workflow_run_in_progress" => {
                check self.executeRemoteFunc(payload, "workflow_run_in_progress", "WorkflowRunService", "onWorkflowRunInProgress");
                return true;
            }
            "workflow_run_completed" => {
                check self.executeRemoteFunc(payload, "workflow_run_completed", "WorkflowRunService", "onWorkflowRunCompleted");
                return true;
            }
            "workflow_run_requested" => {
                check self.executeRemoteFunc(payload, "workflow_run_requested", "WorkflowRunService", "onWorkflowRunRequested");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForProjectsV2statusUpdate(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "projects_v2_status_update_edited" => {
                check self.executeRemoteFunc(payload, "projects_v2_status_update_edited", "ProjectsV2statusUpdateService", "onProjectsV2StatusUpdateEdited");
                return true;
            }
            "projects_v2_status_update_deleted" => {
                check self.executeRemoteFunc(payload, "projects_v2_status_update_deleted", "ProjectsV2statusUpdateService", "onProjectsV2StatusUpdateDeleted");
                return true;
            }
            "projects_v2_status_update_created" => {
                check self.executeRemoteFunc(payload, "projects_v2_status_update_created", "ProjectsV2statusUpdateService", "onProjectsV2StatusUpdateCreated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForProjectsV2item(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "projects_v2_item_edited" => {
                check self.executeRemoteFunc(payload, "projects_v2_item_edited", "ProjectsV2itemService", "onProjectsV2ItemEdited");
                return true;
            }
            "projects_v2_item_created" => {
                check self.executeRemoteFunc(payload, "projects_v2_item_created", "ProjectsV2itemService", "onProjectsV2ItemCreated");
                return true;
            }
            "projects_v2_item_archived" => {
                check self.executeRemoteFunc(payload, "projects_v2_item_archived", "ProjectsV2itemService", "onProjectsV2ItemArchived");
                return true;
            }
            "projects_v2_item_deleted" => {
                check self.executeRemoteFunc(payload, "projects_v2_item_deleted", "ProjectsV2itemService", "onProjectsV2ItemDeleted");
                return true;
            }
            "projects_v2_item_restored" => {
                check self.executeRemoteFunc(payload, "projects_v2_item_restored", "ProjectsV2itemService", "onProjectsV2ItemRestored");
                return true;
            }
            "projects_v2_item_reordered" => {
                check self.executeRemoteFunc(payload, "projects_v2_item_reordered", "ProjectsV2itemService", "onProjectsV2ItemReordered");
                return true;
            }
            "projects_v2_item_converted" => {
                check self.executeRemoteFunc(payload, "projects_v2_item_converted", "ProjectsV2itemService", "onProjectsV2ItemConverted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForSponsorship(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "sponsorship_cancelled" => {
                check self.executeRemoteFunc(payload, "sponsorship_cancelled", "SponsorshipService", "onSponsorshipCancelled");
                return true;
            }
            "sponsorship_edited" => {
                check self.executeRemoteFunc(payload, "sponsorship_edited", "SponsorshipService", "onSponsorshipEdited");
                return true;
            }
            "sponsorship_tier_changed" => {
                check self.executeRemoteFunc(payload, "sponsorship_tier_changed", "SponsorshipService", "onSponsorshipTierChanged");
                return true;
            }
            "sponsorship_pending_cancellation" => {
                check self.executeRemoteFunc(payload, "sponsorship_pending_cancellation", "SponsorshipService", "onSponsorshipPendingCancellation");
                return true;
            }
            "sponsorship_created" => {
                check self.executeRemoteFunc(payload, "sponsorship_created", "SponsorshipService", "onSponsorshipCreated");
                return true;
            }
            "sponsorship_pending_tier_change" => {
                check self.executeRemoteFunc(payload, "sponsorship_pending_tier_change", "SponsorshipService", "onSponsorshipPendingTierChange");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForMergeGroup(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "merge_group_destroyed" => {
                check self.executeRemoteFunc(payload, "merge_group_destroyed", "MergeGroupService", "onMergeGroupDestroyed");
                return true;
            }
            "merge_group_checks_requested" => {
                check self.executeRemoteFunc(payload, "merge_group_checks_requested", "MergeGroupService", "onMergeGroupChecksRequested");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForProject(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "project_deleted" => {
                check self.executeRemoteFunc(payload, "project_deleted", "ProjectService", "onProjectDeleted");
                return true;
            }
            "project_created" => {
                check self.executeRemoteFunc(payload, "project_created", "ProjectService", "onProjectCreated");
                return true;
            }
            "project_closed" => {
                check self.executeRemoteFunc(payload, "project_closed", "ProjectService", "onProjectClosed");
                return true;
            }
            "project_reopened" => {
                check self.executeRemoteFunc(payload, "project_reopened", "ProjectService", "onProjectReopened");
                return true;
            }
            "project_edited" => {
                check self.executeRemoteFunc(payload, "project_edited", "ProjectService", "onProjectEdited");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForOrgBlock(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "org_block_blocked" => {
                check self.executeRemoteFunc(payload, "org_block_blocked", "OrgBlockService", "onOrgBlockBlocked");
                return true;
            }
            "org_block_unblocked" => {
                check self.executeRemoteFunc(payload, "org_block_unblocked", "OrgBlockService", "onOrgBlockUnblocked");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForSecretScanningAlertLocation(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "secret_scanning_alert_location" => {
                check self.executeRemoteFunc(payload, "secret_scanning_alert_location", "SecretScanningAlertLocationService", "onSecretScanningAlertLocation");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForInstallationTarget(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "installation_target_renamed" => {
                check self.executeRemoteFunc(payload, "installation_target_renamed", "InstallationTargetService", "onInstallationTargetRenamed");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForCheckSuite(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "check_suite_completed" => {
                check self.executeRemoteFunc(payload, "check_suite_completed", "CheckSuiteService", "onCheckSuiteCompleted");
                return true;
            }
            "check_suite_requested" => {
                check self.executeRemoteFunc(payload, "check_suite_requested", "CheckSuiteService", "onCheckSuiteRequested");
                return true;
            }
            "check_suite_rerequested" => {
                check self.executeRemoteFunc(payload, "check_suite_rerequested", "CheckSuiteService", "onCheckSuiteRerequested");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForPing(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "ping" => {
                check self.executeRemoteFunc(payload, "ping", "PingService", "onPing");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForIssueComment(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "issue_comment_edited" => {
                check self.executeRemoteFunc(payload, "issue_comment_edited", "IssueCommentService", "onIssueCommentEdited");
                return true;
            }
            "issue_comment_pinned" => {
                check self.executeRemoteFunc(payload, "issue_comment_pinned", "IssueCommentService", "onIssueCommentPinned");
                return true;
            }
            "issue_comment_deleted" => {
                check self.executeRemoteFunc(payload, "issue_comment_deleted", "IssueCommentService", "onIssueCommentDeleted");
                return true;
            }
            "issue_comment_created" => {
                check self.executeRemoteFunc(payload, "issue_comment_created", "IssueCommentService", "onIssueCommentCreated");
                return true;
            }
            "issue_comment_unpinned" => {
                check self.executeRemoteFunc(payload, "issue_comment_unpinned", "IssueCommentService", "onIssueCommentUnpinned");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForSecurityAdvisory(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "security_advisory_withdrawn" => {
                check self.executeRemoteFunc(payload, "security_advisory_withdrawn", "SecurityAdvisoryService", "onSecurityAdvisoryWithdrawn");
                return true;
            }
            "security_advisory_published" => {
                check self.executeRemoteFunc(payload, "security_advisory_published", "SecurityAdvisoryService", "onSecurityAdvisoryPublished");
                return true;
            }
            "security_advisory_updated" => {
                check self.executeRemoteFunc(payload, "security_advisory_updated", "SecurityAdvisoryService", "onSecurityAdvisoryUpdated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForPackage(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "package_published" => {
                check self.executeRemoteFunc(payload, "package_published", "PackageService", "onPackagePublished");
                return true;
            }
            "package_updated" => {
                check self.executeRemoteFunc(payload, "package_updated", "PackageService", "onPackageUpdated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForDiscussion(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "discussion_unanswered" => {
                check self.executeRemoteFunc(payload, "discussion_unanswered", "DiscussionService", "onDiscussionUnanswered");
                return true;
            }
            "discussion_created" => {
                check self.executeRemoteFunc(payload, "discussion_created", "DiscussionService", "onDiscussionCreated");
                return true;
            }
            "discussion_transferred" => {
                check self.executeRemoteFunc(payload, "discussion_transferred", "DiscussionService", "onDiscussionTransferred");
                return true;
            }
            "discussion_category_changed" => {
                check self.executeRemoteFunc(payload, "discussion_category_changed", "DiscussionService", "onDiscussionCategoryChanged");
                return true;
            }
            "discussion_deleted" => {
                check self.executeRemoteFunc(payload, "discussion_deleted", "DiscussionService", "onDiscussionDeleted");
                return true;
            }
            "discussion_unlocked" => {
                check self.executeRemoteFunc(payload, "discussion_unlocked", "DiscussionService", "onDiscussionUnlocked");
                return true;
            }
            "discussion_pinned" => {
                check self.executeRemoteFunc(payload, "discussion_pinned", "DiscussionService", "onDiscussionPinned");
                return true;
            }
            "discussion_edited" => {
                check self.executeRemoteFunc(payload, "discussion_edited", "DiscussionService", "onDiscussionEdited");
                return true;
            }
            "discussion_reopened" => {
                check self.executeRemoteFunc(payload, "discussion_reopened", "DiscussionService", "onDiscussionReopened");
                return true;
            }
            "discussion_answered" => {
                check self.executeRemoteFunc(payload, "discussion_answered", "DiscussionService", "onDiscussionAnswered");
                return true;
            }
            "discussion_closed" => {
                check self.executeRemoteFunc(payload, "discussion_closed", "DiscussionService", "onDiscussionClosed");
                return true;
            }
            "discussion_unlabeled" => {
                check self.executeRemoteFunc(payload, "discussion_unlabeled", "DiscussionService", "onDiscussionUnlabeled");
                return true;
            }
            "discussion_labeled" => {
                check self.executeRemoteFunc(payload, "discussion_labeled", "DiscussionService", "onDiscussionLabeled");
                return true;
            }
            "discussion_unpinned" => {
                check self.executeRemoteFunc(payload, "discussion_unpinned", "DiscussionService", "onDiscussionUnpinned");
                return true;
            }
            "discussion_locked" => {
                check self.executeRemoteFunc(payload, "discussion_locked", "DiscussionService", "onDiscussionLocked");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForFork(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "fork" => {
                check self.executeRemoteFunc(payload, "fork", "ForkService", "onFork");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForPullRequestReview(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "pull_request_review_submitted" => {
                check self.executeRemoteFunc(payload, "pull_request_review_submitted", "PullRequestReviewService", "onPullRequestReviewSubmitted");
                return true;
            }
            "pull_request_review_edited" => {
                check self.executeRemoteFunc(payload, "pull_request_review_edited", "PullRequestReviewService", "onPullRequestReviewEdited");
                return true;
            }
            "pull_request_review_dismissed" => {
                check self.executeRemoteFunc(payload, "pull_request_review_dismissed", "PullRequestReviewService", "onPullRequestReviewDismissed");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForOrganization(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "organization_member_added" => {
                check self.executeRemoteFunc(payload, "organization_member_added", "OrganizationService", "onOrganizationMemberAdded");
                return true;
            }
            "organization_member_removed" => {
                check self.executeRemoteFunc(payload, "organization_member_removed", "OrganizationService", "onOrganizationMemberRemoved");
                return true;
            }
            "organization_deleted" => {
                check self.executeRemoteFunc(payload, "organization_deleted", "OrganizationService", "onOrganizationDeleted");
                return true;
            }
            "organization_renamed" => {
                check self.executeRemoteFunc(payload, "organization_renamed", "OrganizationService", "onOrganizationRenamed");
                return true;
            }
            "organization_member_invited" => {
                check self.executeRemoteFunc(payload, "organization_member_invited", "OrganizationService", "onOrganizationMemberInvited");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForIssues(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "issues_reopened" => {
                check self.executeRemoteFunc(payload, "issues_reopened", "IssuesService", "onIssuesReopened");
                return true;
            }
            "issues_transferred" => {
                check self.executeRemoteFunc(payload, "issues_transferred", "IssuesService", "onIssuesTransferred");
                return true;
            }
            "issues_unpinned" => {
                check self.executeRemoteFunc(payload, "issues_unpinned", "IssuesService", "onIssuesUnpinned");
                return true;
            }
            "issues_assigned" => {
                check self.executeRemoteFunc(payload, "issues_assigned", "IssuesService", "onIssuesAssigned");
                return true;
            }
            "issues_milestoned" => {
                check self.executeRemoteFunc(payload, "issues_milestoned", "IssuesService", "onIssuesMilestoned");
                return true;
            }
            "issues_labeled" => {
                check self.executeRemoteFunc(payload, "issues_labeled", "IssuesService", "onIssuesLabeled");
                return true;
            }
            "issues_opened" => {
                check self.executeRemoteFunc(payload, "issues_opened", "IssuesService", "onIssuesOpened");
                return true;
            }
            "issues_pinned" => {
                check self.executeRemoteFunc(payload, "issues_pinned", "IssuesService", "onIssuesPinned");
                return true;
            }
            "issues_typed" => {
                check self.executeRemoteFunc(payload, "issues_typed", "IssuesService", "onIssuesTyped");
                return true;
            }
            "issues_edited" => {
                check self.executeRemoteFunc(payload, "issues_edited", "IssuesService", "onIssuesEdited");
                return true;
            }
            "issues_untyped" => {
                check self.executeRemoteFunc(payload, "issues_untyped", "IssuesService", "onIssuesUntyped");
                return true;
            }
            "issues_demilestoned" => {
                check self.executeRemoteFunc(payload, "issues_demilestoned", "IssuesService", "onIssuesDemilestoned");
                return true;
            }
            "issues_locked" => {
                check self.executeRemoteFunc(payload, "issues_locked", "IssuesService", "onIssuesLocked");
                return true;
            }
            "issues_unassigned" => {
                check self.executeRemoteFunc(payload, "issues_unassigned", "IssuesService", "onIssuesUnassigned");
                return true;
            }
            "issues_unlocked" => {
                check self.executeRemoteFunc(payload, "issues_unlocked", "IssuesService", "onIssuesUnlocked");
                return true;
            }
            "issues_unlabeled" => {
                check self.executeRemoteFunc(payload, "issues_unlabeled", "IssuesService", "onIssuesUnlabeled");
                return true;
            }
            "issues_closed" => {
                check self.executeRemoteFunc(payload, "issues_closed", "IssuesService", "onIssuesClosed");
                return true;
            }
            "issues_deleted" => {
                check self.executeRemoteFunc(payload, "issues_deleted", "IssuesService", "onIssuesDeleted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForRegistryPackage(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "registry_package_updated" => {
                check self.executeRemoteFunc(payload, "registry_package_updated", "RegistryPackageService", "onRegistryPackageUpdated");
                return true;
            }
            "registry_package_published" => {
                check self.executeRemoteFunc(payload, "registry_package_published", "RegistryPackageService", "onRegistryPackagePublished");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForProjectsV2(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "projects_v2_created" => {
                check self.executeRemoteFunc(payload, "projects_v2_created", "ProjectsV2Service", "onProjectsV2Created");
                return true;
            }
            "projects_v2_edited" => {
                check self.executeRemoteFunc(payload, "projects_v2_edited", "ProjectsV2Service", "onProjectsV2Edited");
                return true;
            }
            "projects_v2_closed" => {
                check self.executeRemoteFunc(payload, "projects_v2_closed", "ProjectsV2Service", "onProjectsV2Closed");
                return true;
            }
            "projects_v2_reopened" => {
                check self.executeRemoteFunc(payload, "projects_v2_reopened", "ProjectsV2Service", "onProjectsV2Reopened");
                return true;
            }
            "projects_v2_deleted" => {
                check self.executeRemoteFunc(payload, "projects_v2_deleted", "ProjectsV2Service", "onProjectsV2Deleted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForRepositoryVulnerabilityAlert(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "repository_vulnerability_alert_resolve" => {
                check self.executeRemoteFunc(payload, "repository_vulnerability_alert_resolve", "RepositoryVulnerabilityAlertService", "onRepositoryVulnerabilityAlertResolve");
                return true;
            }
            "repository_vulnerability_alert_reopen" => {
                check self.executeRemoteFunc(payload, "repository_vulnerability_alert_reopen", "RepositoryVulnerabilityAlertService", "onRepositoryVulnerabilityAlertReopen");
                return true;
            }
            "repository_vulnerability_alert_dismiss" => {
                check self.executeRemoteFunc(payload, "repository_vulnerability_alert_dismiss", "RepositoryVulnerabilityAlertService", "onRepositoryVulnerabilityAlertDismiss");
                return true;
            }
            "repository_vulnerability_alert_create" => {
                check self.executeRemoteFunc(payload, "repository_vulnerability_alert_create", "RepositoryVulnerabilityAlertService", "onRepositoryVulnerabilityAlertCreate");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForStar(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "star_created" => {
                check self.executeRemoteFunc(payload, "star_created", "StarService", "onStarCreated");
                return true;
            }
            "star_deleted" => {
                check self.executeRemoteFunc(payload, "star_deleted", "StarService", "onStarDeleted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForCreate(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "create" => {
                check self.executeRemoteFunc(payload, "create", "CreateService", "onCreate");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForDeploymentReview(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "deployment_review_requested" => {
                check self.executeRemoteFunc(payload, "deployment_review_requested", "DeploymentReviewService", "onDeploymentReviewRequested");
                return true;
            }
            "deployment_review_rejected" => {
                check self.executeRemoteFunc(payload, "deployment_review_rejected", "DeploymentReviewService", "onDeploymentReviewRejected");
                return true;
            }
            "deployment_review_approved" => {
                check self.executeRemoteFunc(payload, "deployment_review_approved", "DeploymentReviewService", "onDeploymentReviewApproved");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForGollum(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "gollum" => {
                check self.executeRemoteFunc(payload, "gollum", "GollumService", "onGollum");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForGithubAppAuthorization(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "github_app_authorization_revoked" => {
                check self.executeRemoteFunc(payload, "github_app_authorization_revoked", "GithubAppAuthorizationService", "onGithubAppAuthorizationRevoked");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForWatch(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "watch_started" => {
                check self.executeRemoteFunc(payload, "watch_started", "WatchService", "onWatchStarted");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForTeam(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "team_created" => {
                check self.executeRemoteFunc(payload, "team_created", "TeamService", "onTeamCreated");
                return true;
            }
            "team_deleted" => {
                check self.executeRemoteFunc(payload, "team_deleted", "TeamService", "onTeamDeleted");
                return true;
            }
            "team_edited" => {
                check self.executeRemoteFunc(payload, "team_edited", "TeamService", "onTeamEdited");
                return true;
            }
            "team_added_to_repository" => {
                check self.executeRemoteFunc(payload, "team_added_to_repository", "TeamService", "onTeamAddedToRepository");
                return true;
            }
            "team_removed_from_repository" => {
                check self.executeRemoteFunc(payload, "team_removed_from_repository", "TeamService", "onTeamRemovedFromRepository");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForWorkflowJob(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "workflow_job_queued" => {
                check self.executeRemoteFunc(payload, "workflow_job_queued", "WorkflowJobService", "onWorkflowJobQueued");
                return true;
            }
            "workflow_job_waiting" => {
                check self.executeRemoteFunc(payload, "workflow_job_waiting", "WorkflowJobService", "onWorkflowJobWaiting");
                return true;
            }
            "workflow_job_completed" => {
                check self.executeRemoteFunc(payload, "workflow_job_completed", "WorkflowJobService", "onWorkflowJobCompleted");
                return true;
            }
            "workflow_job_in_progress" => {
                check self.executeRemoteFunc(payload, "workflow_job_in_progress", "WorkflowJobService", "onWorkflowJobInProgress");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForRelease(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "release_created" => {
                check self.executeRemoteFunc(payload, "release_created", "ReleaseService", "onReleaseCreated");
                return true;
            }
            "release_published" => {
                check self.executeRemoteFunc(payload, "release_published", "ReleaseService", "onReleasePublished");
                return true;
            }
            "release_released" => {
                check self.executeRemoteFunc(payload, "release_released", "ReleaseService", "onReleaseReleased");
                return true;
            }
            "release_prereleased" => {
                check self.executeRemoteFunc(payload, "release_prereleased", "ReleaseService", "onReleasePrereleased");
                return true;
            }
            "release_unpublished" => {
                check self.executeRemoteFunc(payload, "release_unpublished", "ReleaseService", "onReleaseUnpublished");
                return true;
            }
            "release_deleted" => {
                check self.executeRemoteFunc(payload, "release_deleted", "ReleaseService", "onReleaseDeleted");
                return true;
            }
            "release_edited" => {
                check self.executeRemoteFunc(payload, "release_edited", "ReleaseService", "onReleaseEdited");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForInstallation(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "installation_new_permissions_accepted" => {
                check self.executeRemoteFunc(payload, "installation_new_permissions_accepted", "InstallationService", "onInstallationNewPermissionsAccepted");
                return true;
            }
            "installation_suspend" => {
                check self.executeRemoteFunc(payload, "installation_suspend", "InstallationService", "onInstallationSuspend");
                return true;
            }
            "installation_created" => {
                check self.executeRemoteFunc(payload, "installation_created", "InstallationService", "onInstallationCreated");
                return true;
            }
            "installation_deleted" => {
                check self.executeRemoteFunc(payload, "installation_deleted", "InstallationService", "onInstallationDeleted");
                return true;
            }
            "installation_unsuspend" => {
                check self.executeRemoteFunc(payload, "installation_unsuspend", "InstallationService", "onInstallationUnsuspend");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForCommitComment(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "commit_comment_created" => {
                check self.executeRemoteFunc(payload, "commit_comment_created", "CommitCommentService", "onCommitCommentCreated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForDiscussionComment(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "discussion_comment_deleted" => {
                check self.executeRemoteFunc(payload, "discussion_comment_deleted", "DiscussionCommentService", "onDiscussionCommentDeleted");
                return true;
            }
            "discussion_comment_created" => {
                check self.executeRemoteFunc(payload, "discussion_comment_created", "DiscussionCommentService", "onDiscussionCommentCreated");
                return true;
            }
            "discussion_comment_edited" => {
                check self.executeRemoteFunc(payload, "discussion_comment_edited", "DiscussionCommentService", "onDiscussionCommentEdited");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForBranchProtectionRule(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "branch_protection_rule_deleted" => {
                check self.executeRemoteFunc(payload, "branch_protection_rule_deleted", "BranchProtectionRuleService", "onBranchProtectionRuleDeleted");
                return true;
            }
            "branch_protection_rule_edited" => {
                check self.executeRemoteFunc(payload, "branch_protection_rule_edited", "BranchProtectionRuleService", "onBranchProtectionRuleEdited");
                return true;
            }
            "branch_protection_rule_created" => {
                check self.executeRemoteFunc(payload, "branch_protection_rule_created", "BranchProtectionRuleService", "onBranchProtectionRuleCreated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForIssueDependencies(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "issue_dependencies_blocking_removed" => {
                check self.executeRemoteFunc(payload, "issue_dependencies_blocking_removed", "IssueDependenciesService", "onIssueDependenciesBlockingRemoved");
                return true;
            }
            "issue_dependencies_blocked_by_removed" => {
                check self.executeRemoteFunc(payload, "issue_dependencies_blocked_by_removed", "IssueDependenciesService", "onIssueDependenciesBlockedByRemoved");
                return true;
            }
            "issue_dependencies_blocking_added" => {
                check self.executeRemoteFunc(payload, "issue_dependencies_blocking_added", "IssueDependenciesService", "onIssueDependenciesBlockingAdded");
                return true;
            }
            "issue_dependencies_blocked_by_added" => {
                check self.executeRemoteFunc(payload, "issue_dependencies_blocked_by_added", "IssueDependenciesService", "onIssueDependenciesBlockedByAdded");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForRepository(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "repository_privatized" => {
                check self.executeRemoteFunc(payload, "repository_privatized", "RepositoryService", "onRepositoryPrivatized");
                return true;
            }
            "repository_created" => {
                check self.executeRemoteFunc(payload, "repository_created", "RepositoryService", "onRepositoryCreated");
                return true;
            }
            "repository_renamed" => {
                check self.executeRemoteFunc(payload, "repository_renamed", "RepositoryService", "onRepositoryRenamed");
                return true;
            }
            "repository_transferred" => {
                check self.executeRemoteFunc(payload, "repository_transferred", "RepositoryService", "onRepositoryTransferred");
                return true;
            }
            "repository_edited" => {
                check self.executeRemoteFunc(payload, "repository_edited", "RepositoryService", "onRepositoryEdited");
                return true;
            }
            "repository_deleted" => {
                check self.executeRemoteFunc(payload, "repository_deleted", "RepositoryService", "onRepositoryDeleted");
                return true;
            }
            "repository_archived" => {
                check self.executeRemoteFunc(payload, "repository_archived", "RepositoryService", "onRepositoryArchived");
                return true;
            }
            "repository_publicized" => {
                check self.executeRemoteFunc(payload, "repository_publicized", "RepositoryService", "onRepositoryPublicized");
                return true;
            }
            "repository_unarchived" => {
                check self.executeRemoteFunc(payload, "repository_unarchived", "RepositoryService", "onRepositoryUnarchived");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForPullRequestReviewComment(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "pull_request_review_comment_created" => {
                check self.executeRemoteFunc(payload, "pull_request_review_comment_created", "PullRequestReviewCommentService", "onPullRequestReviewCommentCreated");
                return true;
            }
            "pull_request_review_comment_deleted" => {
                check self.executeRemoteFunc(payload, "pull_request_review_comment_deleted", "PullRequestReviewCommentService", "onPullRequestReviewCommentDeleted");
                return true;
            }
            "pull_request_review_comment_edited" => {
                check self.executeRemoteFunc(payload, "pull_request_review_comment_edited", "PullRequestReviewCommentService", "onPullRequestReviewCommentEdited");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForDeploymentProtectionRule(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "deployment_protection_rule" => {
                check self.executeRemoteFunc(payload, "deployment_protection_rule", "DeploymentProtectionRuleService", "onDeploymentProtectionRule");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForCustomPropertyValues(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "custom_property_values_updated" => {
                check self.executeRemoteFunc(payload, "custom_property_values_updated", "CustomPropertyValuesService", "onCustomPropertyValuesUpdated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForInstallationRepositories(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "installation_repositories_removed" => {
                check self.executeRemoteFunc(payload, "installation_repositories_removed", "InstallationRepositoriesService", "onInstallationRepositoriesRemoved");
                return true;
            }
            "installation_repositories_added" => {
                check self.executeRemoteFunc(payload, "installation_repositories_added", "InstallationRepositoriesService", "onInstallationRepositoriesAdded");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForSecretScanningScan(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "secret_scanning_scan" => {
                check self.executeRemoteFunc(payload, "secret_scanning_scan", "SecretScanningScanService", "onSecretScanningScan");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForProjectCard(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "project_card_edited" => {
                check self.executeRemoteFunc(payload, "project_card_edited", "ProjectCardService", "onProjectCardEdited");
                return true;
            }
            "project_card_deleted" => {
                check self.executeRemoteFunc(payload, "project_card_deleted", "ProjectCardService", "onProjectCardDeleted");
                return true;
            }
            "project_card_moved" => {
                check self.executeRemoteFunc(payload, "project_card_moved", "ProjectCardService", "onProjectCardMoved");
                return true;
            }
            "project_card_converted" => {
                check self.executeRemoteFunc(payload, "project_card_converted", "ProjectCardService", "onProjectCardConverted");
                return true;
            }
            "project_card_created" => {
                check self.executeRemoteFunc(payload, "project_card_created", "ProjectCardService", "onProjectCardCreated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForCheckRun(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "check_run_created" => {
                check self.executeRemoteFunc(payload, "check_run_created", "CheckRunService", "onCheckRunCreated");
                return true;
            }
            "check_run_completed" => {
                check self.executeRemoteFunc(payload, "check_run_completed", "CheckRunService", "onCheckRunCompleted");
                return true;
            }
            "check_run_requested_action" => {
                check self.executeRemoteFunc(payload, "check_run_requested_action", "CheckRunService", "onCheckRunRequestedAction");
                return true;
            }
            "check_run_rerequested" => {
                check self.executeRemoteFunc(payload, "check_run_rerequested", "CheckRunService", "onCheckRunRerequested");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForPageBuild(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "page_build" => {
                check self.executeRemoteFunc(payload, "page_build", "PageBuildService", "onPageBuild");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForCustomProperty(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "custom_property_updated" => {
                check self.executeRemoteFunc(payload, "custom_property_updated", "CustomPropertyService", "onCustomPropertyUpdated");
                return true;
            }
            "custom_property_deleted" => {
                check self.executeRemoteFunc(payload, "custom_property_deleted", "CustomPropertyService", "onCustomPropertyDeleted");
                return true;
            }
            "custom_property_promote_to_enterprise" => {
                check self.executeRemoteFunc(payload, "custom_property_promote_to_enterprise", "CustomPropertyService", "onCustomPropertyPromoteToEnterprise");
                return true;
            }
            "custom_property_created" => {
                check self.executeRemoteFunc(payload, "custom_property_created", "CustomPropertyService", "onCustomPropertyCreated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForDependabotAlert(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "dependabot_alert_auto_dismissed" => {
                check self.executeRemoteFunc(payload, "dependabot_alert_auto_dismissed", "DependabotAlertService", "onDependabotAlertAutoDismissed");
                return true;
            }
            "dependabot_alert_auto_reopened" => {
                check self.executeRemoteFunc(payload, "dependabot_alert_auto_reopened", "DependabotAlertService", "onDependabotAlertAutoReopened");
                return true;
            }
            "dependabot_alert_created" => {
                check self.executeRemoteFunc(payload, "dependabot_alert_created", "DependabotAlertService", "onDependabotAlertCreated");
                return true;
            }
            "dependabot_alert_dismissed" => {
                check self.executeRemoteFunc(payload, "dependabot_alert_dismissed", "DependabotAlertService", "onDependabotAlertDismissed");
                return true;
            }
            "dependabot_alert_reopened" => {
                check self.executeRemoteFunc(payload, "dependabot_alert_reopened", "DependabotAlertService", "onDependabotAlertReopened");
                return true;
            }
            "dependabot_alert_reintroduced" => {
                check self.executeRemoteFunc(payload, "dependabot_alert_reintroduced", "DependabotAlertService", "onDependabotAlertReintroduced");
                return true;
            }
            "dependabot_alert_assignees_changed" => {
                check self.executeRemoteFunc(payload, "dependabot_alert_assignees_changed", "DependabotAlertService", "onDependabotAlertAssigneesChanged");
                return true;
            }
            "dependabot_alert_fixed" => {
                check self.executeRemoteFunc(payload, "dependabot_alert_fixed", "DependabotAlertService", "onDependabotAlertFixed");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForDeploymentStatus(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "deployment_status_created" => {
                check self.executeRemoteFunc(payload, "deployment_status_created", "DeploymentStatusService", "onDeploymentStatusCreated");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForRepositoryAdvisory(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "repository_advisory_reported" => {
                check self.executeRemoteFunc(payload, "repository_advisory_reported", "RepositoryAdvisoryService", "onRepositoryAdvisoryReported");
                return true;
            }
            "repository_advisory_published" => {
                check self.executeRemoteFunc(payload, "repository_advisory_published", "RepositoryAdvisoryService", "onRepositoryAdvisoryPublished");
                return true;
            }
        }
        return false;
    }

    private isolated function matchRemoteFuncForPullRequestReviewThread(json payload, string eventIdentifier, string eventType) returns boolean|error {
        match eventIdentifier {
            "pull_request_review_thread_unresolved" => {
                check self.executeRemoteFunc(payload, "pull_request_review_thread_unresolved", "PullRequestReviewThreadService", "onPullRequestReviewThreadUnresolved");
                return true;
            }
            "pull_request_review_thread_resolved" => {
                check self.executeRemoteFunc(payload, "pull_request_review_thread_resolved", "PullRequestReviewThreadService", "onPullRequestReviewThreadResolved");
                return true;
            }
        }
        return false;
    }

    private isolated function executeRemoteFunc(json payload, string eventName, string serviceTypeStr, string eventFunction) returns error? {
        GenericServiceType? genericService = self.services[serviceTypeStr];
        if genericService is GenericServiceType {
            any boundEvent = check self.nativeHandler.bindEventPayload(genericService, eventFunction, payload);
            check self.nativeHandler.invokeRemoteFunction(boundEvent, eventName, eventFunction, genericService);
        } else {
            log:printDebug("SERVICE_NOT_ATTACHED", serviceType = serviceTypeStr, eventName = eventName);
        }
    }
}
