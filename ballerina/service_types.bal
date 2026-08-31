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

# Attachable service type exposing the DeleteService family of webhook events.
public type DeleteService service object {
    # Triggered on Delete.
    # + payload - the DeletePayload webhook payload
    # + return - an error if handling the event fails
    remote function onDelete(DeletePayload payload) returns error?;
};

# Attachable service type exposing the MetaService family of webhook events.
public type MetaService service object {
    # Triggered on Meta deleted.
    # + payload - the MetaPayload webhook payload
    # + return - an error if handling the event fails
    remote function onMetaDeleted(MetaPayload payload) returns error?;
};

# Attachable service type exposing the WorkflowDispatchService family of webhook events.
public type WorkflowDispatchService service object {
    # Triggered on Workflow dispatch.
    # + payload - the WorkflowDispatchPayload webhook payload
    # + return - an error if handling the event fails
    remote function onWorkflowDispatch(WorkflowDispatchPayload payload) returns error?;
};

# Attachable service type exposing the SecurityAndAnalysisService family of webhook events.
public type SecurityAndAnalysisService service object {
    # Triggered on Security and analysis.
    # + payload - the SecurityAndAnalysisPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecurityAndAnalysis(SecurityAndAnalysisPayload payload) returns error?;
};

# Attachable service type exposing the DeployKeyService family of webhook events.
public type DeployKeyService service object {
    # Triggered on Deploy key created.
    # + payload - the DeployKeyPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDeployKeyCreated(DeployKeyPayload payload) returns error?;
    # Triggered on Deploy key deleted.
    # + payload - the DeployKeyPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDeployKeyDeleted(DeployKeyPayload payload) returns error?;
};

# Attachable service type exposing the ProjectColumnService family of webhook events.
public type ProjectColumnService service object {
    # Triggered on Project column moved.
    # + payload - the ProjectColumnPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectColumnMoved(ProjectColumnPayload payload) returns error?;
    # Triggered on Project column edited.
    # + payload - the ProjectColumnPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectColumnEdited(ProjectColumnPayload payload) returns error?;
    # Triggered on Project column deleted.
    # + payload - the ProjectColumnPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectColumnDeleted(ProjectColumnPayload payload) returns error?;
    # Triggered on Project column created.
    # + payload - the ProjectColumnPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectColumnCreated(ProjectColumnPayload payload) returns error?;
};

# Attachable service type exposing the MarketplacePurchaseService family of webhook events.
public type MarketplacePurchaseService service object {
    # Triggered on Marketplace purchase purchased.
    # + payload - the MarketplacePurchasePayload webhook payload
    # + return - an error if handling the event fails
    remote function onMarketplacePurchasePurchased(MarketplacePurchasePayload payload) returns error?;
    # Triggered on Marketplace purchase cancelled.
    # + payload - the MarketplacePurchasePayload webhook payload
    # + return - an error if handling the event fails
    remote function onMarketplacePurchaseCancelled(MarketplacePurchasePayload payload) returns error?;
    # Triggered on Marketplace purchase pending change cancelled.
    # + payload - the MarketplacePurchasePayload webhook payload
    # + return - an error if handling the event fails
    remote function onMarketplacePurchasePendingChangeCancelled(MarketplacePurchasePayload payload) returns error?;
    # Triggered on Marketplace purchase pending change.
    # + payload - the MarketplacePurchasePayload webhook payload
    # + return - an error if handling the event fails
    remote function onMarketplacePurchasePendingChange(MarketplacePurchasePayload payload) returns error?;
    # Triggered on Marketplace purchase changed.
    # + payload - the MarketplacePurchasePayload webhook payload
    # + return - an error if handling the event fails
    remote function onMarketplacePurchaseChanged(MarketplacePurchasePayload payload) returns error?;
};

# Attachable service type exposing the BranchProtectionConfigurationService family of webhook events.
public type BranchProtectionConfigurationService service object {
    # Triggered on Branch protection configuration enabled.
    # + payload - the BranchProtectionConfigurationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onBranchProtectionConfigurationEnabled(BranchProtectionConfigurationPayload payload) returns error?;
    # Triggered on Branch protection configuration disabled.
    # + payload - the BranchProtectionConfigurationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onBranchProtectionConfigurationDisabled(BranchProtectionConfigurationPayload payload) returns error?;
};

# Attachable service type exposing the PullRequestService family of webhook events.
public type PullRequestService service object {
    # Triggered on Pull request enqueued.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestEnqueued(PullRequestPayload payload) returns error?;
    # Triggered on Pull request review request removed.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestReviewRequestRemoved(PullRequestPayload payload) returns error?;
    # Triggered on Pull request opened.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestOpened(PullRequestPayload payload) returns error?;
    # Triggered on Pull request ready for review.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestReadyForReview(PullRequestPayload payload) returns error?;
    # Triggered on Pull request labeled.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestLabeled(PullRequestPayload payload) returns error?;
    # Triggered on Pull request unassigned.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestUnassigned(PullRequestPayload payload) returns error?;
    # Triggered on Pull request edited.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestEdited(PullRequestPayload payload) returns error?;
    # Triggered on Pull request synchronize.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestSynchronize(PullRequestPayload payload) returns error?;
    # Triggered on Pull request review requested.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestReviewRequested(PullRequestPayload payload) returns error?;
    # Triggered on Pull request reopened.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestReopened(PullRequestPayload payload) returns error?;
    # Triggered on Pull request auto merge disabled.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestAutoMergeDisabled(PullRequestPayload payload) returns error?;
    # Triggered on Pull request locked.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestLocked(PullRequestPayload payload) returns error?;
    # Triggered on Pull request auto merge enabled.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestAutoMergeEnabled(PullRequestPayload payload) returns error?;
    # Triggered on Pull request milestoned.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestMilestoned(PullRequestPayload payload) returns error?;
    # Triggered on Pull request dequeued.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestDequeued(PullRequestPayload payload) returns error?;
    # Triggered on Pull request unlabeled.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestUnlabeled(PullRequestPayload payload) returns error?;
    # Triggered on Pull request closed.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestClosed(PullRequestPayload payload) returns error?;
    # Triggered on Pull request unlocked.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestUnlocked(PullRequestPayload payload) returns error?;
    # Triggered on Pull request assigned.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestAssigned(PullRequestPayload payload) returns error?;
    # Triggered on Pull request converted to draft.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestConvertedToDraft(PullRequestPayload payload) returns error?;
    # Triggered on Pull request demilestoned.
    # + payload - the PullRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestDemilestoned(PullRequestPayload payload) returns error?;
};

# Attachable service type exposing the LabelService family of webhook events.
public type LabelService service object {
    # Triggered on Label edited.
    # + payload - the LabelPayload webhook payload
    # + return - an error if handling the event fails
    remote function onLabelEdited(LabelPayload payload) returns error?;
    # Triggered on Label created.
    # + payload - the LabelPayload webhook payload
    # + return - an error if handling the event fails
    remote function onLabelCreated(LabelPayload payload) returns error?;
    # Triggered on Label deleted.
    # + payload - the LabelPayload webhook payload
    # + return - an error if handling the event fails
    remote function onLabelDeleted(LabelPayload payload) returns error?;
};

# Attachable service type exposing the DeploymentService family of webhook events.
public type DeploymentService service object {
    # Triggered on Deployment created.
    # + payload - the DeploymentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDeploymentCreated(DeploymentPayload payload) returns error?;
};

# Attachable service type exposing the TeamAddService family of webhook events.
public type TeamAddService service object {
    # Triggered on Team add.
    # + payload - the TeamAddPayload webhook payload
    # + return - an error if handling the event fails
    remote function onTeamAdd(TeamAddPayload payload) returns error?;
};

# Attachable service type exposing the CodeScanningAlertService family of webhook events.
public type CodeScanningAlertService service object {
    # Triggered on Code scanning alert appeared in branch.
    # + payload - the CodeScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCodeScanningAlertAppearedInBranch(CodeScanningAlertPayload payload) returns error?;
    # Triggered on Code scanning alert closed by user.
    # + payload - the CodeScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCodeScanningAlertClosedByUser(CodeScanningAlertPayload payload) returns error?;
    # Triggered on Code scanning alert created.
    # + payload - the CodeScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCodeScanningAlertCreated(CodeScanningAlertPayload payload) returns error?;
    # Triggered on Code scanning alert fixed.
    # + payload - the CodeScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCodeScanningAlertFixed(CodeScanningAlertPayload payload) returns error?;
    # Triggered on Code scanning alert reopened.
    # + payload - the CodeScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCodeScanningAlertReopened(CodeScanningAlertPayload payload) returns error?;
    # Triggered on Code scanning alert reopened by user.
    # + payload - the CodeScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCodeScanningAlertReopenedByUser(CodeScanningAlertPayload payload) returns error?;
    # Triggered on Code scanning alert updated assignment.
    # + payload - the CodeScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCodeScanningAlertUpdatedAssignment(CodeScanningAlertPayload payload) returns error?;
};

# Attachable service type exposing the MembershipService family of webhook events.
public type MembershipService service object {
    # Triggered on Membership added.
    # + payload - the MembershipPayload webhook payload
    # + return - an error if handling the event fails
    remote function onMembershipAdded(MembershipPayload payload) returns error?;
    # Triggered on Membership removed.
    # + payload - the MembershipPayload webhook payload
    # + return - an error if handling the event fails
    remote function onMembershipRemoved(MembershipPayload payload) returns error?;
};

# Attachable service type exposing the SecretScanningAlertService family of webhook events.
public type SecretScanningAlertService service object {
    # Triggered on Secret scanning alert assigned.
    # + payload - the SecretScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecretScanningAlertAssigned(SecretScanningAlertPayload payload) returns error?;
    # Triggered on Secret scanning alert reopened.
    # + payload - the SecretScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecretScanningAlertReopened(SecretScanningAlertPayload payload) returns error?;
    # Triggered on Secret scanning alert unassigned.
    # + payload - the SecretScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecretScanningAlertUnassigned(SecretScanningAlertPayload payload) returns error?;
    # Triggered on Secret scanning alert created.
    # + payload - the SecretScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecretScanningAlertCreated(SecretScanningAlertPayload payload) returns error?;
    # Triggered on Secret scanning alert publicly leaked.
    # + payload - the SecretScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecretScanningAlertPubliclyLeaked(SecretScanningAlertPayload payload) returns error?;
    # Triggered on Secret scanning alert validated.
    # + payload - the SecretScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecretScanningAlertValidated(SecretScanningAlertPayload payload) returns error?;
    # Triggered on Secret scanning alert resolved.
    # + payload - the SecretScanningAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecretScanningAlertResolved(SecretScanningAlertPayload payload) returns error?;
};

# Attachable service type exposing the PushService family of webhook events.
public type PushService service object {
    # Triggered on Push.
    # + payload - the PushPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPush(PushPayload payload) returns error?;
};

# Attachable service type exposing the MemberService family of webhook events.
public type MemberService service object {
    # Triggered on Member edited.
    # + payload - the MemberPayload webhook payload
    # + return - an error if handling the event fails
    remote function onMemberEdited(MemberPayload payload) returns error?;
    # Triggered on Member added.
    # + payload - the MemberPayload webhook payload
    # + return - an error if handling the event fails
    remote function onMemberAdded(MemberPayload payload) returns error?;
    # Triggered on Member removed.
    # + payload - the MemberPayload webhook payload
    # + return - an error if handling the event fails
    remote function onMemberRemoved(MemberPayload payload) returns error?;
};

# Attachable service type exposing the RepositoryDispatchService family of webhook events.
public type RepositoryDispatchService service object {
    # Triggered on Repository dispatch.
    # + payload - the RepositoryDispatchPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryDispatch(RepositoryDispatchPayload payload) returns error?;
};

# Attachable service type exposing the StatusService family of webhook events.
public type StatusService service object {
    # Triggered on Status.
    # + payload - the StatusPayload webhook payload
    # + return - an error if handling the event fails
    remote function onStatus(StatusPayload payload) returns error?;
};

# Attachable service type exposing the RepositoryImportService family of webhook events.
public type RepositoryImportService service object {
    # Triggered on Repository import.
    # + payload - the RepositoryImportPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryImport(RepositoryImportPayload payload) returns error?;
};

# Attachable service type exposing the PersonalAccessTokenRequestService family of webhook events.
public type PersonalAccessTokenRequestService service object {
    # Triggered on Personal access token request created.
    # + payload - the PersonalAccessTokenRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPersonalAccessTokenRequestCreated(PersonalAccessTokenRequestPayload payload) returns error?;
    # Triggered on Personal access token request approved.
    # + payload - the PersonalAccessTokenRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPersonalAccessTokenRequestApproved(PersonalAccessTokenRequestPayload payload) returns error?;
    # Triggered on Personal access token request denied.
    # + payload - the PersonalAccessTokenRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPersonalAccessTokenRequestDenied(PersonalAccessTokenRequestPayload payload) returns error?;
    # Triggered on Personal access token request cancelled.
    # + payload - the PersonalAccessTokenRequestPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPersonalAccessTokenRequestCancelled(PersonalAccessTokenRequestPayload payload) returns error?;
};

# Attachable service type exposing the SubIssuesService family of webhook events.
public type SubIssuesService service object {
    # Triggered on Sub issues sub issue added.
    # + payload - the SubIssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSubIssuesSubIssueAdded(SubIssuesPayload payload) returns error?;
    # Triggered on Sub issues parent issue added.
    # + payload - the SubIssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSubIssuesParentIssueAdded(SubIssuesPayload payload) returns error?;
    # Triggered on Sub issues sub issue removed.
    # + payload - the SubIssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSubIssuesSubIssueRemoved(SubIssuesPayload payload) returns error?;
    # Triggered on Sub issues parent issue removed.
    # + payload - the SubIssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSubIssuesParentIssueRemoved(SubIssuesPayload payload) returns error?;
};

# Attachable service type exposing the RepositoryRulesetService family of webhook events.
public type RepositoryRulesetService service object {
    # Triggered on Repository ruleset created.
    # + payload - the RepositoryRulesetPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryRulesetCreated(RepositoryRulesetPayload payload) returns error?;
    # Triggered on Repository ruleset edited.
    # + payload - the RepositoryRulesetPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryRulesetEdited(RepositoryRulesetPayload payload) returns error?;
    # Triggered on Repository ruleset deleted.
    # + payload - the RepositoryRulesetPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryRulesetDeleted(RepositoryRulesetPayload payload) returns error?;
};

# Attachable service type exposing the MilestoneService family of webhook events.
public type MilestoneService service object {
    # Triggered on Milestone created.
    # + payload - the MilestonePayload webhook payload
    # + return - an error if handling the event fails
    remote function onMilestoneCreated(MilestonePayload payload) returns error?;
    # Triggered on Milestone edited.
    # + payload - the MilestonePayload webhook payload
    # + return - an error if handling the event fails
    remote function onMilestoneEdited(MilestonePayload payload) returns error?;
    # Triggered on Milestone opened.
    # + payload - the MilestonePayload webhook payload
    # + return - an error if handling the event fails
    remote function onMilestoneOpened(MilestonePayload payload) returns error?;
    # Triggered on Milestone deleted.
    # + payload - the MilestonePayload webhook payload
    # + return - an error if handling the event fails
    remote function onMilestoneDeleted(MilestonePayload payload) returns error?;
    # Triggered on Milestone closed.
    # + payload - the MilestonePayload webhook payload
    # + return - an error if handling the event fails
    remote function onMilestoneClosed(MilestonePayload payload) returns error?;
};

# Attachable service type exposing the PublicService family of webhook events.
public type PublicService service object {
    # Triggered on Public.
    # + payload - the PublicPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPublic(PublicPayload payload) returns error?;
};

# Attachable service type exposing the WorkflowRunService family of webhook events.
public type WorkflowRunService service object {
    # Triggered on Workflow run in progress.
    # + payload - the WorkflowRunPayload webhook payload
    # + return - an error if handling the event fails
    remote function onWorkflowRunInProgress(WorkflowRunPayload payload) returns error?;
    # Triggered on Workflow run completed.
    # + payload - the WorkflowRunPayload webhook payload
    # + return - an error if handling the event fails
    remote function onWorkflowRunCompleted(WorkflowRunPayload payload) returns error?;
    # Triggered on Workflow run requested.
    # + payload - the WorkflowRunPayload webhook payload
    # + return - an error if handling the event fails
    remote function onWorkflowRunRequested(WorkflowRunPayload payload) returns error?;
};

# Attachable service type exposing the ProjectsV2statusUpdateService family of webhook events.
public type ProjectsV2statusUpdateService service object {
    # Triggered on Projects v2 status update edited.
    # + payload - the 'ProjectsV2StatusUpdatePayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2StatusUpdateEdited('ProjectsV2StatusUpdatePayload payload) returns error?;
    # Triggered on Projects v2 status update deleted.
    # + payload - the 'ProjectsV2StatusUpdatePayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2StatusUpdateDeleted('ProjectsV2StatusUpdatePayload payload) returns error?;
    # Triggered on Projects v2 status update created.
    # + payload - the 'ProjectsV2StatusUpdatePayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2StatusUpdateCreated('ProjectsV2StatusUpdatePayload payload) returns error?;
};

# Attachable service type exposing the ProjectsV2itemService family of webhook events.
public type ProjectsV2itemService service object {
    # Triggered on Projects v2 item edited.
    # + payload - the 'ProjectsV2ItemPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2ItemEdited('ProjectsV2ItemPayload payload) returns error?;
    # Triggered on Projects v2 item created.
    # + payload - the 'ProjectsV2ItemPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2ItemCreated('ProjectsV2ItemPayload payload) returns error?;
    # Triggered on Projects v2 item archived.
    # + payload - the 'ProjectsV2ItemPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2ItemArchived('ProjectsV2ItemPayload payload) returns error?;
    # Triggered on Projects v2 item deleted.
    # + payload - the 'ProjectsV2ItemPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2ItemDeleted('ProjectsV2ItemPayload payload) returns error?;
    # Triggered on Projects v2 item restored.
    # + payload - the 'ProjectsV2ItemPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2ItemRestored('ProjectsV2ItemPayload payload) returns error?;
    # Triggered on Projects v2 item reordered.
    # + payload - the 'ProjectsV2ItemPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2ItemReordered('ProjectsV2ItemPayload payload) returns error?;
    # Triggered on Projects v2 item converted.
    # + payload - the 'ProjectsV2ItemPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2ItemConverted('ProjectsV2ItemPayload payload) returns error?;
};

# Attachable service type exposing the SponsorshipService family of webhook events.
public type SponsorshipService service object {
    # Triggered on Sponsorship cancelled.
    # + payload - the SponsorshipPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSponsorshipCancelled(SponsorshipPayload payload) returns error?;
    # Triggered on Sponsorship edited.
    # + payload - the SponsorshipPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSponsorshipEdited(SponsorshipPayload payload) returns error?;
    # Triggered on Sponsorship tier changed.
    # + payload - the SponsorshipPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSponsorshipTierChanged(SponsorshipPayload payload) returns error?;
    # Triggered on Sponsorship pending cancellation.
    # + payload - the SponsorshipPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSponsorshipPendingCancellation(SponsorshipPayload payload) returns error?;
    # Triggered on Sponsorship created.
    # + payload - the SponsorshipPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSponsorshipCreated(SponsorshipPayload payload) returns error?;
    # Triggered on Sponsorship pending tier change.
    # + payload - the SponsorshipPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSponsorshipPendingTierChange(SponsorshipPayload payload) returns error?;
};

# Attachable service type exposing the MergeGroupService family of webhook events.
public type MergeGroupService service object {
    # Triggered on Merge group destroyed.
    # + payload - the MergeGroupPayload webhook payload
    # + return - an error if handling the event fails
    remote function onMergeGroupDestroyed(MergeGroupPayload payload) returns error?;
    # Triggered on Merge group checks requested.
    # + payload - the MergeGroupPayload webhook payload
    # + return - an error if handling the event fails
    remote function onMergeGroupChecksRequested(MergeGroupPayload payload) returns error?;
};

# Attachable service type exposing the ProjectService family of webhook events.
public type ProjectService service object {
    # Triggered on Project deleted.
    # + payload - the ProjectPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectDeleted(ProjectPayload payload) returns error?;
    # Triggered on Project created.
    # + payload - the ProjectPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectCreated(ProjectPayload payload) returns error?;
    # Triggered on Project closed.
    # + payload - the ProjectPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectClosed(ProjectPayload payload) returns error?;
    # Triggered on Project reopened.
    # + payload - the ProjectPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectReopened(ProjectPayload payload) returns error?;
    # Triggered on Project edited.
    # + payload - the ProjectPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectEdited(ProjectPayload payload) returns error?;
};

# Attachable service type exposing the OrgBlockService family of webhook events.
public type OrgBlockService service object {
    # Triggered on Org block blocked.
    # + payload - the OrgBlockPayload webhook payload
    # + return - an error if handling the event fails
    remote function onOrgBlockBlocked(OrgBlockPayload payload) returns error?;
    # Triggered on Org block unblocked.
    # + payload - the OrgBlockPayload webhook payload
    # + return - an error if handling the event fails
    remote function onOrgBlockUnblocked(OrgBlockPayload payload) returns error?;
};

# Attachable service type exposing the SecretScanningAlertLocationService family of webhook events.
public type SecretScanningAlertLocationService service object {
    # Triggered on Secret scanning alert location.
    # + payload - the SecretScanningAlertLocationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecretScanningAlertLocation(SecretScanningAlertLocationPayload payload) returns error?;
};

# Attachable service type exposing the InstallationTargetService family of webhook events.
public type InstallationTargetService service object {
    # Triggered on Installation target renamed.
    # + payload - the InstallationTargetPayload webhook payload
    # + return - an error if handling the event fails
    remote function onInstallationTargetRenamed(InstallationTargetPayload payload) returns error?;
};

# Attachable service type exposing the CheckSuiteService family of webhook events.
public type CheckSuiteService service object {
    # Triggered on Check suite completed.
    # + payload - the CheckSuitePayload webhook payload
    # + return - an error if handling the event fails
    remote function onCheckSuiteCompleted(CheckSuitePayload payload) returns error?;
    # Triggered on Check suite requested.
    # + payload - the CheckSuitePayload webhook payload
    # + return - an error if handling the event fails
    remote function onCheckSuiteRequested(CheckSuitePayload payload) returns error?;
    # Triggered on Check suite rerequested.
    # + payload - the CheckSuitePayload webhook payload
    # + return - an error if handling the event fails
    remote function onCheckSuiteRerequested(CheckSuitePayload payload) returns error?;
};

# Attachable service type exposing the PingService family of webhook events.
public type PingService service object {
    # Triggered on Ping.
    # + payload - the PingPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPing(PingPayload payload) returns error?;
};

# Attachable service type exposing the IssueCommentService family of webhook events.
public type IssueCommentService service object {
    # Triggered on Issue comment edited.
    # + payload - the IssueCommentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssueCommentEdited(IssueCommentPayload payload) returns error?;
    # Triggered on Issue comment pinned.
    # + payload - the IssueCommentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssueCommentPinned(IssueCommentPayload payload) returns error?;
    # Triggered on Issue comment deleted.
    # + payload - the IssueCommentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssueCommentDeleted(IssueCommentPayload payload) returns error?;
    # Triggered on Issue comment created.
    # + payload - the IssueCommentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssueCommentCreated(IssueCommentPayload payload) returns error?;
    # Triggered on Issue comment unpinned.
    # + payload - the IssueCommentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssueCommentUnpinned(IssueCommentPayload payload) returns error?;
};

# Attachable service type exposing the SecurityAdvisoryService family of webhook events.
public type SecurityAdvisoryService service object {
    # Triggered on Security advisory withdrawn.
    # + payload - the SecurityAdvisoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecurityAdvisoryWithdrawn(SecurityAdvisoryPayload payload) returns error?;
    # Triggered on Security advisory published.
    # + payload - the SecurityAdvisoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecurityAdvisoryPublished(SecurityAdvisoryPayload payload) returns error?;
    # Triggered on Security advisory updated.
    # + payload - the SecurityAdvisoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecurityAdvisoryUpdated(SecurityAdvisoryPayload payload) returns error?;
};

# Attachable service type exposing the PackageService family of webhook events.
public type PackageService service object {
    # Triggered on Package published.
    # + payload - the PackagePayload webhook payload
    # + return - an error if handling the event fails
    remote function onPackagePublished(PackagePayload payload) returns error?;
    # Triggered on Package updated.
    # + payload - the PackagePayload webhook payload
    # + return - an error if handling the event fails
    remote function onPackageUpdated(PackagePayload payload) returns error?;
};

# Attachable service type exposing the DiscussionService family of webhook events.
public type DiscussionService service object {
    # Triggered on Discussion unanswered.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionUnanswered(DiscussionPayload payload) returns error?;
    # Triggered on Discussion created.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionCreated(DiscussionPayload payload) returns error?;
    # Triggered on Discussion transferred.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionTransferred(DiscussionPayload payload) returns error?;
    # Triggered on Discussion category changed.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionCategoryChanged(DiscussionPayload payload) returns error?;
    # Triggered on Discussion deleted.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionDeleted(DiscussionPayload payload) returns error?;
    # Triggered on Discussion unlocked.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionUnlocked(DiscussionPayload payload) returns error?;
    # Triggered on Discussion pinned.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionPinned(DiscussionPayload payload) returns error?;
    # Triggered on Discussion edited.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionEdited(DiscussionPayload payload) returns error?;
    # Triggered on Discussion reopened.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionReopened(DiscussionPayload payload) returns error?;
    # Triggered on Discussion answered.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionAnswered(DiscussionPayload payload) returns error?;
    # Triggered on Discussion closed.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionClosed(DiscussionPayload payload) returns error?;
    # Triggered on Discussion unlabeled.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionUnlabeled(DiscussionPayload payload) returns error?;
    # Triggered on Discussion labeled.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionLabeled(DiscussionPayload payload) returns error?;
    # Triggered on Discussion unpinned.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionUnpinned(DiscussionPayload payload) returns error?;
    # Triggered on Discussion locked.
    # + payload - the DiscussionPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionLocked(DiscussionPayload payload) returns error?;
};

# Attachable service type exposing the ForkService family of webhook events.
public type ForkService service object {
    # Triggered on Fork.
    # + payload - the ForkPayload webhook payload
    # + return - an error if handling the event fails
    remote function onFork(ForkPayload payload) returns error?;
};

# Attachable service type exposing the PullRequestReviewService family of webhook events.
public type PullRequestReviewService service object {
    # Triggered on Pull request review submitted.
    # + payload - the PullRequestReviewPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestReviewSubmitted(PullRequestReviewPayload payload) returns error?;
    # Triggered on Pull request review edited.
    # + payload - the PullRequestReviewPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestReviewEdited(PullRequestReviewPayload payload) returns error?;
    # Triggered on Pull request review dismissed.
    # + payload - the PullRequestReviewPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestReviewDismissed(PullRequestReviewPayload payload) returns error?;
};

# Attachable service type exposing the OrganizationService family of webhook events.
public type OrganizationService service object {
    # Triggered on Organization member added.
    # + payload - the OrganizationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onOrganizationMemberAdded(OrganizationPayload payload) returns error?;
    # Triggered on Organization member removed.
    # + payload - the OrganizationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onOrganizationMemberRemoved(OrganizationPayload payload) returns error?;
    # Triggered on Organization deleted.
    # + payload - the OrganizationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onOrganizationDeleted(OrganizationPayload payload) returns error?;
    # Triggered on Organization renamed.
    # + payload - the OrganizationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onOrganizationRenamed(OrganizationPayload payload) returns error?;
    # Triggered on Organization member invited.
    # + payload - the OrganizationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onOrganizationMemberInvited(OrganizationPayload payload) returns error?;
};

# Attachable service type exposing the IssuesService family of webhook events.
public type IssuesService service object {
    # Triggered on Issues reopened.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesReopened(IssuesPayload payload) returns error?;
    # Triggered on Issues transferred.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesTransferred(IssuesPayload payload) returns error?;
    # Triggered on Issues unpinned.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesUnpinned(IssuesPayload payload) returns error?;
    # Triggered on Issues assigned.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesAssigned(IssuesPayload payload) returns error?;
    # Triggered on Issues milestoned.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesMilestoned(IssuesPayload payload) returns error?;
    # Triggered on Issues labeled.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesLabeled(IssuesPayload payload) returns error?;
    # Triggered on Issues opened.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesOpened(IssuesPayload payload) returns error?;
    # Triggered on Issues pinned.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesPinned(IssuesPayload payload) returns error?;
    # Triggered on Issues typed.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesTyped(IssuesPayload payload) returns error?;
    # Triggered on Issues edited.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesEdited(IssuesPayload payload) returns error?;
    # Triggered on Issues untyped.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesUntyped(IssuesPayload payload) returns error?;
    # Triggered on Issues demilestoned.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesDemilestoned(IssuesPayload payload) returns error?;
    # Triggered on Issues locked.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesLocked(IssuesPayload payload) returns error?;
    # Triggered on Issues unassigned.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesUnassigned(IssuesPayload payload) returns error?;
    # Triggered on Issues unlocked.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesUnlocked(IssuesPayload payload) returns error?;
    # Triggered on Issues unlabeled.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesUnlabeled(IssuesPayload payload) returns error?;
    # Triggered on Issues closed.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesClosed(IssuesPayload payload) returns error?;
    # Triggered on Issues deleted.
    # + payload - the IssuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssuesDeleted(IssuesPayload payload) returns error?;
};

# Attachable service type exposing the RegistryPackageService family of webhook events.
public type RegistryPackageService service object {
    # Triggered on Registry package updated.
    # + payload - the RegistryPackagePayload webhook payload
    # + return - an error if handling the event fails
    remote function onRegistryPackageUpdated(RegistryPackagePayload payload) returns error?;
    # Triggered on Registry package published.
    # + payload - the RegistryPackagePayload webhook payload
    # + return - an error if handling the event fails
    remote function onRegistryPackagePublished(RegistryPackagePayload payload) returns error?;
};

# Attachable service type exposing the ProjectsV2Service family of webhook events.
public type ProjectsV2Service service object {
    # Triggered on Projects v2 created.
    # + payload - the 'ProjectsV2Payload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2Created('ProjectsV2Payload payload) returns error?;
    # Triggered on Projects v2 edited.
    # + payload - the 'ProjectsV2Payload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2Edited('ProjectsV2Payload payload) returns error?;
    # Triggered on Projects v2 closed.
    # + payload - the 'ProjectsV2Payload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2Closed('ProjectsV2Payload payload) returns error?;
    # Triggered on Projects v2 reopened.
    # + payload - the 'ProjectsV2Payload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2Reopened('ProjectsV2Payload payload) returns error?;
    # Triggered on Projects v2 deleted.
    # + payload - the 'ProjectsV2Payload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectsV2Deleted('ProjectsV2Payload payload) returns error?;
};

# Attachable service type exposing the RepositoryVulnerabilityAlertService family of webhook events.
public type RepositoryVulnerabilityAlertService service object {
    # Triggered on Repository vulnerability alert resolve.
    # + payload - the RepositoryVulnerabilityAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryVulnerabilityAlertResolve(RepositoryVulnerabilityAlertPayload payload) returns error?;
    # Triggered on Repository vulnerability alert reopen.
    # + payload - the RepositoryVulnerabilityAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryVulnerabilityAlertReopen(RepositoryVulnerabilityAlertPayload payload) returns error?;
    # Triggered on Repository vulnerability alert dismiss.
    # + payload - the RepositoryVulnerabilityAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryVulnerabilityAlertDismiss(RepositoryVulnerabilityAlertPayload payload) returns error?;
    # Triggered on Repository vulnerability alert create.
    # + payload - the RepositoryVulnerabilityAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryVulnerabilityAlertCreate(RepositoryVulnerabilityAlertPayload payload) returns error?;
};

# Attachable service type exposing the StarService family of webhook events.
public type StarService service object {
    # Triggered on Star created.
    # + payload - the StarPayload webhook payload
    # + return - an error if handling the event fails
    remote function onStarCreated(StarPayload payload) returns error?;
    # Triggered on Star deleted.
    # + payload - the StarPayload webhook payload
    # + return - an error if handling the event fails
    remote function onStarDeleted(StarPayload payload) returns error?;
};

# Attachable service type exposing the CreateService family of webhook events.
public type CreateService service object {
    # Triggered on Create.
    # + payload - the CreatePayload webhook payload
    # + return - an error if handling the event fails
    remote function onCreate(CreatePayload payload) returns error?;
};

# Attachable service type exposing the DeploymentReviewService family of webhook events.
public type DeploymentReviewService service object {
    # Triggered on Deployment review requested.
    # + payload - the DeploymentReviewPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDeploymentReviewRequested(DeploymentReviewPayload payload) returns error?;
    # Triggered on Deployment review rejected.
    # + payload - the DeploymentReviewPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDeploymentReviewRejected(DeploymentReviewPayload payload) returns error?;
    # Triggered on Deployment review approved.
    # + payload - the DeploymentReviewPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDeploymentReviewApproved(DeploymentReviewPayload payload) returns error?;
};

# Attachable service type exposing the GollumService family of webhook events.
public type GollumService service object {
    # Triggered on Gollum.
    # + payload - the GollumPayload webhook payload
    # + return - an error if handling the event fails
    remote function onGollum(GollumPayload payload) returns error?;
};

# Attachable service type exposing the GithubAppAuthorizationService family of webhook events.
public type GithubAppAuthorizationService service object {
    # Triggered on Github app authorization revoked.
    # + payload - the GithubAppAuthorizationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onGithubAppAuthorizationRevoked(GithubAppAuthorizationPayload payload) returns error?;
};

# Attachable service type exposing the WatchService family of webhook events.
public type WatchService service object {
    # Triggered on Watch started.
    # + payload - the WatchPayload webhook payload
    # + return - an error if handling the event fails
    remote function onWatchStarted(WatchPayload payload) returns error?;
};

# Attachable service type exposing the TeamService family of webhook events.
public type TeamService service object {
    # Triggered on Team created.
    # + payload - the TeamPayload webhook payload
    # + return - an error if handling the event fails
    remote function onTeamCreated(TeamPayload payload) returns error?;
    # Triggered on Team deleted.
    # + payload - the TeamPayload webhook payload
    # + return - an error if handling the event fails
    remote function onTeamDeleted(TeamPayload payload) returns error?;
    # Triggered on Team edited.
    # + payload - the TeamPayload webhook payload
    # + return - an error if handling the event fails
    remote function onTeamEdited(TeamPayload payload) returns error?;
    # Triggered on Team added to repository.
    # + payload - the TeamPayload webhook payload
    # + return - an error if handling the event fails
    remote function onTeamAddedToRepository(TeamPayload payload) returns error?;
    # Triggered on Team removed from repository.
    # + payload - the TeamPayload webhook payload
    # + return - an error if handling the event fails
    remote function onTeamRemovedFromRepository(TeamPayload payload) returns error?;
};

# Attachable service type exposing the WorkflowJobService family of webhook events.
public type WorkflowJobService service object {
    # Triggered on Workflow job queued.
    # + payload - the WorkflowJobPayload webhook payload
    # + return - an error if handling the event fails
    remote function onWorkflowJobQueued(WorkflowJobPayload payload) returns error?;
    # Triggered on Workflow job waiting.
    # + payload - the WorkflowJobPayload webhook payload
    # + return - an error if handling the event fails
    remote function onWorkflowJobWaiting(WorkflowJobPayload payload) returns error?;
    # Triggered on Workflow job completed.
    # + payload - the WorkflowJobPayload webhook payload
    # + return - an error if handling the event fails
    remote function onWorkflowJobCompleted(WorkflowJobPayload payload) returns error?;
    # Triggered on Workflow job in progress.
    # + payload - the WorkflowJobPayload webhook payload
    # + return - an error if handling the event fails
    remote function onWorkflowJobInProgress(WorkflowJobPayload payload) returns error?;
};

# Attachable service type exposing the ReleaseService family of webhook events.
public type ReleaseService service object {
    # Triggered on Release created.
    # + payload - the ReleasePayload webhook payload
    # + return - an error if handling the event fails
    remote function onReleaseCreated(ReleasePayload payload) returns error?;
    # Triggered on Release published.
    # + payload - the ReleasePayload webhook payload
    # + return - an error if handling the event fails
    remote function onReleasePublished(ReleasePayload payload) returns error?;
    # Triggered on Release released.
    # + payload - the ReleasePayload webhook payload
    # + return - an error if handling the event fails
    remote function onReleaseReleased(ReleasePayload payload) returns error?;
    # Triggered on Release prereleased.
    # + payload - the ReleasePayload webhook payload
    # + return - an error if handling the event fails
    remote function onReleasePrereleased(ReleasePayload payload) returns error?;
    # Triggered on Release unpublished.
    # + payload - the ReleasePayload webhook payload
    # + return - an error if handling the event fails
    remote function onReleaseUnpublished(ReleasePayload payload) returns error?;
    # Triggered on Release deleted.
    # + payload - the ReleasePayload webhook payload
    # + return - an error if handling the event fails
    remote function onReleaseDeleted(ReleasePayload payload) returns error?;
    # Triggered on Release edited.
    # + payload - the ReleasePayload webhook payload
    # + return - an error if handling the event fails
    remote function onReleaseEdited(ReleasePayload payload) returns error?;
};

# Attachable service type exposing the InstallationService family of webhook events.
public type InstallationService service object {
    # Triggered on Installation new permissions accepted.
    # + payload - the InstallationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onInstallationNewPermissionsAccepted(InstallationPayload payload) returns error?;
    # Triggered on Installation suspend.
    # + payload - the InstallationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onInstallationSuspend(InstallationPayload payload) returns error?;
    # Triggered on Installation created.
    # + payload - the InstallationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onInstallationCreated(InstallationPayload payload) returns error?;
    # Triggered on Installation deleted.
    # + payload - the InstallationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onInstallationDeleted(InstallationPayload payload) returns error?;
    # Triggered on Installation unsuspend.
    # + payload - the InstallationPayload webhook payload
    # + return - an error if handling the event fails
    remote function onInstallationUnsuspend(InstallationPayload payload) returns error?;
};

# Attachable service type exposing the CommitCommentService family of webhook events.
public type CommitCommentService service object {
    # Triggered on Commit comment created.
    # + payload - the CommitCommentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCommitCommentCreated(CommitCommentPayload payload) returns error?;
};

# Attachable service type exposing the DiscussionCommentService family of webhook events.
public type DiscussionCommentService service object {
    # Triggered on Discussion comment deleted.
    # + payload - the DiscussionCommentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionCommentDeleted(DiscussionCommentPayload payload) returns error?;
    # Triggered on Discussion comment created.
    # + payload - the DiscussionCommentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionCommentCreated(DiscussionCommentPayload payload) returns error?;
    # Triggered on Discussion comment edited.
    # + payload - the DiscussionCommentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDiscussionCommentEdited(DiscussionCommentPayload payload) returns error?;
};

# Attachable service type exposing the BranchProtectionRuleService family of webhook events.
public type BranchProtectionRuleService service object {
    # Triggered on Branch protection rule deleted.
    # + payload - the BranchProtectionRulePayload webhook payload
    # + return - an error if handling the event fails
    remote function onBranchProtectionRuleDeleted(BranchProtectionRulePayload payload) returns error?;
    # Triggered on Branch protection rule edited.
    # + payload - the BranchProtectionRulePayload webhook payload
    # + return - an error if handling the event fails
    remote function onBranchProtectionRuleEdited(BranchProtectionRulePayload payload) returns error?;
    # Triggered on Branch protection rule created.
    # + payload - the BranchProtectionRulePayload webhook payload
    # + return - an error if handling the event fails
    remote function onBranchProtectionRuleCreated(BranchProtectionRulePayload payload) returns error?;
};

# Attachable service type exposing the IssueDependenciesService family of webhook events.
public type IssueDependenciesService service object {
    # Triggered on Issue dependencies blocking removed.
    # + payload - the IssueDependenciesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssueDependenciesBlockingRemoved(IssueDependenciesPayload payload) returns error?;
    # Triggered on Issue dependencies blocked by removed.
    # + payload - the IssueDependenciesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssueDependenciesBlockedByRemoved(IssueDependenciesPayload payload) returns error?;
    # Triggered on Issue dependencies blocking added.
    # + payload - the IssueDependenciesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssueDependenciesBlockingAdded(IssueDependenciesPayload payload) returns error?;
    # Triggered on Issue dependencies blocked by added.
    # + payload - the IssueDependenciesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onIssueDependenciesBlockedByAdded(IssueDependenciesPayload payload) returns error?;
};

# Attachable service type exposing the RepositoryService family of webhook events.
public type RepositoryService service object {
    # Triggered on Repository privatized.
    # + payload - the RepositoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryPrivatized(RepositoryPayload payload) returns error?;
    # Triggered on Repository created.
    # + payload - the RepositoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryCreated(RepositoryPayload payload) returns error?;
    # Triggered on Repository renamed.
    # + payload - the RepositoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryRenamed(RepositoryPayload payload) returns error?;
    # Triggered on Repository transferred.
    # + payload - the RepositoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryTransferred(RepositoryPayload payload) returns error?;
    # Triggered on Repository edited.
    # + payload - the RepositoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryEdited(RepositoryPayload payload) returns error?;
    # Triggered on Repository deleted.
    # + payload - the RepositoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryDeleted(RepositoryPayload payload) returns error?;
    # Triggered on Repository archived.
    # + payload - the RepositoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryArchived(RepositoryPayload payload) returns error?;
    # Triggered on Repository publicized.
    # + payload - the RepositoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryPublicized(RepositoryPayload payload) returns error?;
    # Triggered on Repository unarchived.
    # + payload - the RepositoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryUnarchived(RepositoryPayload payload) returns error?;
};

# Attachable service type exposing the PullRequestReviewCommentService family of webhook events.
public type PullRequestReviewCommentService service object {
    # Triggered on Pull request review comment created.
    # + payload - the PullRequestReviewCommentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestReviewCommentCreated(PullRequestReviewCommentPayload payload) returns error?;
    # Triggered on Pull request review comment deleted.
    # + payload - the PullRequestReviewCommentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestReviewCommentDeleted(PullRequestReviewCommentPayload payload) returns error?;
    # Triggered on Pull request review comment edited.
    # + payload - the PullRequestReviewCommentPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestReviewCommentEdited(PullRequestReviewCommentPayload payload) returns error?;
};

# Attachable service type exposing the DeploymentProtectionRuleService family of webhook events.
public type DeploymentProtectionRuleService service object {
    # Triggered on Deployment protection rule.
    # + payload - the DeploymentProtectionRulePayload webhook payload
    # + return - an error if handling the event fails
    remote function onDeploymentProtectionRule(DeploymentProtectionRulePayload payload) returns error?;
};

# Attachable service type exposing the CustomPropertyValuesService family of webhook events.
public type CustomPropertyValuesService service object {
    # Triggered on Custom property values updated.
    # + payload - the CustomPropertyValuesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCustomPropertyValuesUpdated(CustomPropertyValuesPayload payload) returns error?;
};

# Attachable service type exposing the InstallationRepositoriesService family of webhook events.
public type InstallationRepositoriesService service object {
    # Triggered on Installation repositories removed.
    # + payload - the InstallationRepositoriesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onInstallationRepositoriesRemoved(InstallationRepositoriesPayload payload) returns error?;
    # Triggered on Installation repositories added.
    # + payload - the InstallationRepositoriesPayload webhook payload
    # + return - an error if handling the event fails
    remote function onInstallationRepositoriesAdded(InstallationRepositoriesPayload payload) returns error?;
};

# Attachable service type exposing the SecretScanningScanService family of webhook events.
public type SecretScanningScanService service object {
    # Triggered on Secret scanning scan.
    # + payload - the SecretScanningScanPayload webhook payload
    # + return - an error if handling the event fails
    remote function onSecretScanningScan(SecretScanningScanPayload payload) returns error?;
};

# Attachable service type exposing the ProjectCardService family of webhook events.
public type ProjectCardService service object {
    # Triggered on Project card edited.
    # + payload - the ProjectCardPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectCardEdited(ProjectCardPayload payload) returns error?;
    # Triggered on Project card deleted.
    # + payload - the ProjectCardPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectCardDeleted(ProjectCardPayload payload) returns error?;
    # Triggered on Project card moved.
    # + payload - the ProjectCardPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectCardMoved(ProjectCardPayload payload) returns error?;
    # Triggered on Project card converted.
    # + payload - the ProjectCardPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectCardConverted(ProjectCardPayload payload) returns error?;
    # Triggered on Project card created.
    # + payload - the ProjectCardPayload webhook payload
    # + return - an error if handling the event fails
    remote function onProjectCardCreated(ProjectCardPayload payload) returns error?;
};

# Attachable service type exposing the CheckRunService family of webhook events.
public type CheckRunService service object {
    # Triggered on Check run created.
    # + payload - the CheckRunPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCheckRunCreated(CheckRunPayload payload) returns error?;
    # Triggered on Check run completed.
    # + payload - the CheckRunPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCheckRunCompleted(CheckRunPayload payload) returns error?;
    # Triggered on Check run requested action.
    # + payload - the CheckRunPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCheckRunRequestedAction(CheckRunPayload payload) returns error?;
    # Triggered on Check run rerequested.
    # + payload - the CheckRunPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCheckRunRerequested(CheckRunPayload payload) returns error?;
};

# Attachable service type exposing the PageBuildService family of webhook events.
public type PageBuildService service object {
    # Triggered on Page build.
    # + payload - the PageBuildPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPageBuild(PageBuildPayload payload) returns error?;
};

# Attachable service type exposing the CustomPropertyService family of webhook events.
public type CustomPropertyService service object {
    # Triggered on Custom property updated.
    # + payload - the CustomPropertyPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCustomPropertyUpdated(CustomPropertyPayload payload) returns error?;
    # Triggered on Custom property deleted.
    # + payload - the CustomPropertyPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCustomPropertyDeleted(CustomPropertyPayload payload) returns error?;
    # Triggered on Custom property promote to enterprise.
    # + payload - the CustomPropertyPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCustomPropertyPromoteToEnterprise(CustomPropertyPayload payload) returns error?;
    # Triggered on Custom property created.
    # + payload - the CustomPropertyPayload webhook payload
    # + return - an error if handling the event fails
    remote function onCustomPropertyCreated(CustomPropertyPayload payload) returns error?;
};

# Attachable service type exposing the DependabotAlertService family of webhook events.
public type DependabotAlertService service object {
    # Triggered on Dependabot alert auto dismissed.
    # + payload - the DependabotAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDependabotAlertAutoDismissed(DependabotAlertPayload payload) returns error?;
    # Triggered on Dependabot alert auto reopened.
    # + payload - the DependabotAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDependabotAlertAutoReopened(DependabotAlertPayload payload) returns error?;
    # Triggered on Dependabot alert created.
    # + payload - the DependabotAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDependabotAlertCreated(DependabotAlertPayload payload) returns error?;
    # Triggered on Dependabot alert dismissed.
    # + payload - the DependabotAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDependabotAlertDismissed(DependabotAlertPayload payload) returns error?;
    # Triggered on Dependabot alert reopened.
    # + payload - the DependabotAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDependabotAlertReopened(DependabotAlertPayload payload) returns error?;
    # Triggered on Dependabot alert reintroduced.
    # + payload - the DependabotAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDependabotAlertReintroduced(DependabotAlertPayload payload) returns error?;
    # Triggered on Dependabot alert assignees changed.
    # + payload - the DependabotAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDependabotAlertAssigneesChanged(DependabotAlertPayload payload) returns error?;
    # Triggered on Dependabot alert fixed.
    # + payload - the DependabotAlertPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDependabotAlertFixed(DependabotAlertPayload payload) returns error?;
};

# Attachable service type exposing the DeploymentStatusService family of webhook events.
public type DeploymentStatusService service object {
    # Triggered on Deployment status created.
    # + payload - the DeploymentStatusPayload webhook payload
    # + return - an error if handling the event fails
    remote function onDeploymentStatusCreated(DeploymentStatusPayload payload) returns error?;
};

# Attachable service type exposing the RepositoryAdvisoryService family of webhook events.
public type RepositoryAdvisoryService service object {
    # Triggered on Repository advisory reported.
    # + payload - the RepositoryAdvisoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryAdvisoryReported(RepositoryAdvisoryPayload payload) returns error?;
    # Triggered on Repository advisory published.
    # + payload - the RepositoryAdvisoryPayload webhook payload
    # + return - an error if handling the event fails
    remote function onRepositoryAdvisoryPublished(RepositoryAdvisoryPayload payload) returns error?;
};

# Attachable service type exposing the PullRequestReviewThreadService family of webhook events.
public type PullRequestReviewThreadService service object {
    # Triggered on Pull request review thread unresolved.
    # + payload - the PullRequestReviewThreadPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestReviewThreadUnresolved(PullRequestReviewThreadPayload payload) returns error?;
    # Triggered on Pull request review thread resolved.
    # + payload - the PullRequestReviewThreadPayload webhook payload
    # + return - an error if handling the event fails
    remote function onPullRequestReviewThreadResolved(PullRequestReviewThreadPayload payload) returns error?;
};

# The union of every service type that can be attached to this listener.
public type GenericServiceType DeleteService|MetaService|WorkflowDispatchService|SecurityAndAnalysisService|DeployKeyService|ProjectColumnService|MarketplacePurchaseService|BranchProtectionConfigurationService|PullRequestService|LabelService|DeploymentService|TeamAddService|CodeScanningAlertService|MembershipService|SecretScanningAlertService|PushService|MemberService|RepositoryDispatchService|StatusService|RepositoryImportService|PersonalAccessTokenRequestService|SubIssuesService|RepositoryRulesetService|MilestoneService|PublicService|WorkflowRunService|ProjectsV2statusUpdateService|ProjectsV2itemService|SponsorshipService|MergeGroupService|ProjectService|OrgBlockService|SecretScanningAlertLocationService|InstallationTargetService|CheckSuiteService|PingService|IssueCommentService|SecurityAdvisoryService|PackageService|DiscussionService|ForkService|PullRequestReviewService|OrganizationService|IssuesService|RegistryPackageService|ProjectsV2Service|RepositoryVulnerabilityAlertService|StarService|CreateService|DeploymentReviewService|GollumService|GithubAppAuthorizationService|WatchService|TeamService|WorkflowJobService|ReleaseService|InstallationService|CommitCommentService|DiscussionCommentService|BranchProtectionRuleService|IssueDependenciesService|RepositoryService|PullRequestReviewCommentService|DeploymentProtectionRuleService|CustomPropertyValuesService|InstallationRepositoriesService|SecretScanningScanService|ProjectCardService|CheckRunService|PageBuildService|CustomPropertyService|DependabotAlertService|DeploymentStatusService|RepositoryAdvisoryService|PullRequestReviewThreadService;

