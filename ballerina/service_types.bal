// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com) All Rights Reserved.
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

public type DeleteService service object {
    remote function onDelete(DeletePayload payload) returns error?;
};

public type MetaService service object {
    remote function onMetaDeleted(MetaPayload payload) returns error?;
};

public type WorkflowDispatchService service object {
    remote function onWorkflowDispatch(WorkflowDispatchPayload payload) returns error?;
};

public type SecurityAndAnalysisService service object {
    remote function onSecurityAndAnalysis(SecurityAndAnalysisPayload payload) returns error?;
};

public type DeployKeyService service object {
    remote function onDeployKeyCreated(DeployKeyPayload payload) returns error?;
    remote function onDeployKeyDeleted(DeployKeyPayload payload) returns error?;
};

public type ProjectColumnService service object {
    remote function onProjectColumnMoved(ProjectColumnPayload payload) returns error?;
    remote function onProjectColumnEdited(ProjectColumnPayload payload) returns error?;
    remote function onProjectColumnDeleted(ProjectColumnPayload payload) returns error?;
    remote function onProjectColumnCreated(ProjectColumnPayload payload) returns error?;
};

public type MarketplacePurchaseService service object {
    remote function onMarketplacePurchasePurchased(MarketplacePurchasePayload payload) returns error?;
    remote function onMarketplacePurchaseCancelled(MarketplacePurchasePayload payload) returns error?;
    remote function onMarketplacePurchasePendingChangeCancelled(MarketplacePurchasePayload payload) returns error?;
    remote function onMarketplacePurchasePendingChange(MarketplacePurchasePayload payload) returns error?;
    remote function onMarketplacePurchaseChanged(MarketplacePurchasePayload payload) returns error?;
};

public type BranchProtectionConfigurationService service object {
    remote function onBranchProtectionConfigurationEnabled(BranchProtectionConfigurationPayload payload) returns error?;
    remote function onBranchProtectionConfigurationDisabled(BranchProtectionConfigurationPayload payload) returns error?;
};

public type PullRequestService service object {
    remote function onPullRequestEnqueued(PullRequestPayload payload) returns error?;
    remote function onPullRequestReviewRequestRemoved(PullRequestPayload payload) returns error?;
    remote function onPullRequestOpened(PullRequestPayload payload) returns error?;
    remote function onPullRequestReadyForReview(PullRequestPayload payload) returns error?;
    remote function onPullRequestLabeled(PullRequestPayload payload) returns error?;
    remote function onPullRequestUnassigned(PullRequestPayload payload) returns error?;
    remote function onPullRequestEdited(PullRequestPayload payload) returns error?;
    remote function onPullRequestSynchronize(PullRequestPayload payload) returns error?;
    remote function onPullRequestReviewRequested(PullRequestPayload payload) returns error?;
    remote function onPullRequestReopened(PullRequestPayload payload) returns error?;
    remote function onPullRequestAutoMergeDisabled(PullRequestPayload payload) returns error?;
    remote function onPullRequestLocked(PullRequestPayload payload) returns error?;
    remote function onPullRequestAutoMergeEnabled(PullRequestPayload payload) returns error?;
    remote function onPullRequestMilestoned(PullRequestPayload payload) returns error?;
    remote function onPullRequestDequeued(PullRequestPayload payload) returns error?;
    remote function onPullRequestUnlabeled(PullRequestPayload payload) returns error?;
    remote function onPullRequestClosed(PullRequestPayload payload) returns error?;
    remote function onPullRequestUnlocked(PullRequestPayload payload) returns error?;
    remote function onPullRequestAssigned(PullRequestPayload payload) returns error?;
    remote function onPullRequestConvertedToDraft(PullRequestPayload payload) returns error?;
    remote function onPullRequestDemilestoned(PullRequestPayload payload) returns error?;
};

public type LabelService service object {
    remote function onLabelEdited(LabelPayload payload) returns error?;
    remote function onLabelCreated(LabelPayload payload) returns error?;
    remote function onLabelDeleted(LabelPayload payload) returns error?;
};

public type DeploymentService service object {
    remote function onDeploymentCreated(DeploymentPayload payload) returns error?;
};

public type TeamAddService service object {
    remote function onTeamAdd(TeamAddPayload payload) returns error?;
};

public type CodeScanningAlertService service object {
    remote function onCodeScanningAlertAppearedInBranch(CodeScanningAlertPayload payload) returns error?;
    remote function onCodeScanningAlertClosedByUser(CodeScanningAlertPayload payload) returns error?;
    remote function onCodeScanningAlertCreated(CodeScanningAlertPayload payload) returns error?;
    remote function onCodeScanningAlertFixed(CodeScanningAlertPayload payload) returns error?;
    remote function onCodeScanningAlertReopened(CodeScanningAlertPayload payload) returns error?;
    remote function onCodeScanningAlertReopenedByUser(CodeScanningAlertPayload payload) returns error?;
    remote function onCodeScanningAlertUpdatedAssignment(CodeScanningAlertPayload payload) returns error?;
};

public type MembershipService service object {
    remote function onMembershipAdded(MembershipPayload payload) returns error?;
    remote function onMembershipRemoved(MembershipPayload payload) returns error?;
};

public type SecretScanningAlertService service object {
    remote function onSecretScanningAlertAssigned(SecretScanningAlertPayload payload) returns error?;
    remote function onSecretScanningAlertReopened(SecretScanningAlertPayload payload) returns error?;
    remote function onSecretScanningAlertUnassigned(SecretScanningAlertPayload payload) returns error?;
    remote function onSecretScanningAlertCreated(SecretScanningAlertPayload payload) returns error?;
    remote function onSecretScanningAlertPubliclyLeaked(SecretScanningAlertPayload payload) returns error?;
    remote function onSecretScanningAlertValidated(SecretScanningAlertPayload payload) returns error?;
    remote function onSecretScanningAlertResolved(SecretScanningAlertPayload payload) returns error?;
};

public type PushService service object {
    remote function onPush(PushPayload payload) returns error?;
};

public type MemberService service object {
    remote function onMemberEdited(MemberPayload payload) returns error?;
    remote function onMemberAdded(MemberPayload payload) returns error?;
    remote function onMemberRemoved(MemberPayload payload) returns error?;
};

public type RepositoryDispatchService service object {
    remote function onRepositoryDispatch(RepositoryDispatchPayload payload) returns error?;
};

public type StatusService service object {
    remote function onStatus(StatusPayload payload) returns error?;
};

public type RepositoryImportService service object {
    remote function onRepositoryImport(RepositoryImportPayload payload) returns error?;
};

public type PersonalAccessTokenRequestService service object {
    remote function onPersonalAccessTokenRequestCreated(PersonalAccessTokenRequestPayload payload) returns error?;
    remote function onPersonalAccessTokenRequestApproved(PersonalAccessTokenRequestPayload payload) returns error?;
    remote function onPersonalAccessTokenRequestDenied(PersonalAccessTokenRequestPayload payload) returns error?;
    remote function onPersonalAccessTokenRequestCancelled(PersonalAccessTokenRequestPayload payload) returns error?;
};

public type SubIssuesService service object {
    remote function onSubIssuesSubIssueAdded(SubIssuesPayload payload) returns error?;
    remote function onSubIssuesParentIssueAdded(SubIssuesPayload payload) returns error?;
    remote function onSubIssuesSubIssueRemoved(SubIssuesPayload payload) returns error?;
    remote function onSubIssuesParentIssueRemoved(SubIssuesPayload payload) returns error?;
};

public type RepositoryRulesetService service object {
    remote function onRepositoryRulesetCreated(RepositoryRulesetPayload payload) returns error?;
    remote function onRepositoryRulesetEdited(RepositoryRulesetPayload payload) returns error?;
    remote function onRepositoryRulesetDeleted(RepositoryRulesetPayload payload) returns error?;
};

public type MilestoneService service object {
    remote function onMilestoneCreated(MilestonePayload payload) returns error?;
    remote function onMilestoneEdited(MilestonePayload payload) returns error?;
    remote function onMilestoneOpened(MilestonePayload payload) returns error?;
    remote function onMilestoneDeleted(MilestonePayload payload) returns error?;
    remote function onMilestoneClosed(MilestonePayload payload) returns error?;
};

public type PublicService service object {
    remote function onPublic(PublicPayload payload) returns error?;
};

public type WorkflowRunService service object {
    remote function onWorkflowRunInProgress(WorkflowRunPayload payload) returns error?;
    remote function onWorkflowRunCompleted(WorkflowRunPayload payload) returns error?;
    remote function onWorkflowRunRequested(WorkflowRunPayload payload) returns error?;
};

public type ProjectsV2statusUpdateService service object {
    remote function onProjectsV2StatusUpdateEdited('ProjectsV2StatusUpdatePayload payload) returns error?;
    remote function onProjectsV2StatusUpdateDeleted('ProjectsV2StatusUpdatePayload payload) returns error?;
    remote function onProjectsV2StatusUpdateCreated('ProjectsV2StatusUpdatePayload payload) returns error?;
};

public type ProjectsV2itemService service object {
    remote function onProjectsV2ItemEdited('ProjectsV2ItemPayload payload) returns error?;
    remote function onProjectsV2ItemCreated('ProjectsV2ItemPayload payload) returns error?;
    remote function onProjectsV2ItemArchived('ProjectsV2ItemPayload payload) returns error?;
    remote function onProjectsV2ItemDeleted('ProjectsV2ItemPayload payload) returns error?;
    remote function onProjectsV2ItemRestored('ProjectsV2ItemPayload payload) returns error?;
    remote function onProjectsV2ItemReordered('ProjectsV2ItemPayload payload) returns error?;
    remote function onProjectsV2ItemConverted('ProjectsV2ItemPayload payload) returns error?;
};

public type SponsorshipService service object {
    remote function onSponsorshipCancelled(SponsorshipPayload payload) returns error?;
    remote function onSponsorshipEdited(SponsorshipPayload payload) returns error?;
    remote function onSponsorshipTierChanged(SponsorshipPayload payload) returns error?;
    remote function onSponsorshipPendingCancellation(SponsorshipPayload payload) returns error?;
    remote function onSponsorshipCreated(SponsorshipPayload payload) returns error?;
    remote function onSponsorshipPendingTierChange(SponsorshipPayload payload) returns error?;
};

public type MergeGroupService service object {
    remote function onMergeGroupDestroyed(MergeGroupPayload payload) returns error?;
    remote function onMergeGroupChecksRequested(MergeGroupPayload payload) returns error?;
};

public type ProjectService service object {
    remote function onProjectDeleted(ProjectPayload payload) returns error?;
    remote function onProjectCreated(ProjectPayload payload) returns error?;
    remote function onProjectClosed(ProjectPayload payload) returns error?;
    remote function onProjectReopened(ProjectPayload payload) returns error?;
    remote function onProjectEdited(ProjectPayload payload) returns error?;
};

public type OrgBlockService service object {
    remote function onOrgBlockBlocked(OrgBlockPayload payload) returns error?;
    remote function onOrgBlockUnblocked(OrgBlockPayload payload) returns error?;
};

public type SecretScanningAlertLocationService service object {
    remote function onSecretScanningAlertLocation(SecretScanningAlertLocationPayload payload) returns error?;
};

public type InstallationTargetService service object {
    remote function onInstallationTargetRenamed(InstallationTargetPayload payload) returns error?;
};

public type CheckSuiteService service object {
    remote function onCheckSuiteCompleted(CheckSuitePayload payload) returns error?;
    remote function onCheckSuiteRequested(CheckSuitePayload payload) returns error?;
    remote function onCheckSuiteRerequested(CheckSuitePayload payload) returns error?;
};

public type PingService service object {
    remote function onPing(PingPayload payload) returns error?;
};

public type IssueCommentService service object {
    remote function onIssueCommentEdited(IssueCommentPayload payload) returns error?;
    remote function onIssueCommentPinned(IssueCommentPayload payload) returns error?;
    remote function onIssueCommentDeleted(IssueCommentPayload payload) returns error?;
    remote function onIssueCommentCreated(IssueCommentPayload payload) returns error?;
    remote function onIssueCommentUnpinned(IssueCommentPayload payload) returns error?;
};

public type SecurityAdvisoryService service object {
    remote function onSecurityAdvisoryWithdrawn(SecurityAdvisoryPayload payload) returns error?;
    remote function onSecurityAdvisoryPublished(SecurityAdvisoryPayload payload) returns error?;
    remote function onSecurityAdvisoryUpdated(SecurityAdvisoryPayload payload) returns error?;
};

public type PackageService service object {
    remote function onPackagePublished(PackagePayload payload) returns error?;
    remote function onPackageUpdated(PackagePayload payload) returns error?;
};

public type DiscussionService service object {
    remote function onDiscussionUnanswered(DiscussionPayload payload) returns error?;
    remote function onDiscussionCreated(DiscussionPayload payload) returns error?;
    remote function onDiscussionTransferred(DiscussionPayload payload) returns error?;
    remote function onDiscussionCategoryChanged(DiscussionPayload payload) returns error?;
    remote function onDiscussionDeleted(DiscussionPayload payload) returns error?;
    remote function onDiscussionUnlocked(DiscussionPayload payload) returns error?;
    remote function onDiscussionPinned(DiscussionPayload payload) returns error?;
    remote function onDiscussionEdited(DiscussionPayload payload) returns error?;
    remote function onDiscussionReopened(DiscussionPayload payload) returns error?;
    remote function onDiscussionAnswered(DiscussionPayload payload) returns error?;
    remote function onDiscussionClosed(DiscussionPayload payload) returns error?;
    remote function onDiscussionUnlabeled(DiscussionPayload payload) returns error?;
    remote function onDiscussionLabeled(DiscussionPayload payload) returns error?;
    remote function onDiscussionUnpinned(DiscussionPayload payload) returns error?;
    remote function onDiscussionLocked(DiscussionPayload payload) returns error?;
};

public type ForkService service object {
    remote function onFork(ForkPayload payload) returns error?;
};

public type PullRequestReviewService service object {
    remote function onPullRequestReviewSubmitted(PullRequestReviewPayload payload) returns error?;
    remote function onPullRequestReviewEdited(PullRequestReviewPayload payload) returns error?;
    remote function onPullRequestReviewDismissed(PullRequestReviewPayload payload) returns error?;
};

public type OrganizationService service object {
    remote function onOrganizationMemberAdded(OrganizationPayload payload) returns error?;
    remote function onOrganizationMemberRemoved(OrganizationPayload payload) returns error?;
    remote function onOrganizationDeleted(OrganizationPayload payload) returns error?;
    remote function onOrganizationRenamed(OrganizationPayload payload) returns error?;
    remote function onOrganizationMemberInvited(OrganizationPayload payload) returns error?;
};

public type IssuesService service object {
    remote function onIssuesReopened(IssuesPayload payload) returns error?;
    remote function onIssuesTransferred(IssuesPayload payload) returns error?;
    remote function onIssuesUnpinned(IssuesPayload payload) returns error?;
    remote function onIssuesAssigned(IssuesPayload payload) returns error?;
    remote function onIssuesMilestoned(IssuesPayload payload) returns error?;
    remote function onIssuesLabeled(IssuesPayload payload) returns error?;
    remote function onIssuesOpened(IssuesPayload payload) returns error?;
    remote function onIssuesPinned(IssuesPayload payload) returns error?;
    remote function onIssuesTyped(IssuesPayload payload) returns error?;
    remote function onIssuesEdited(IssuesPayload payload) returns error?;
    remote function onIssuesUntyped(IssuesPayload payload) returns error?;
    remote function onIssuesDemilestoned(IssuesPayload payload) returns error?;
    remote function onIssuesLocked(IssuesPayload payload) returns error?;
    remote function onIssuesUnassigned(IssuesPayload payload) returns error?;
    remote function onIssuesUnlocked(IssuesPayload payload) returns error?;
    remote function onIssuesUnlabeled(IssuesPayload payload) returns error?;
    remote function onIssuesClosed(IssuesPayload payload) returns error?;
    remote function onIssuesDeleted(IssuesPayload payload) returns error?;
};

public type RegistryPackageService service object {
    remote function onRegistryPackageUpdated(RegistryPackagePayload payload) returns error?;
    remote function onRegistryPackagePublished(RegistryPackagePayload payload) returns error?;
};

public type ProjectsV2Service service object {
    remote function onProjectsV2Created('ProjectsV2Payload payload) returns error?;
    remote function onProjectsV2Edited('ProjectsV2Payload payload) returns error?;
    remote function onProjectsV2Closed('ProjectsV2Payload payload) returns error?;
    remote function onProjectsV2Reopened('ProjectsV2Payload payload) returns error?;
    remote function onProjectsV2Deleted('ProjectsV2Payload payload) returns error?;
};

public type RepositoryVulnerabilityAlertService service object {
    remote function onRepositoryVulnerabilityAlertResolve(RepositoryVulnerabilityAlertPayload payload) returns error?;
    remote function onRepositoryVulnerabilityAlertReopen(RepositoryVulnerabilityAlertPayload payload) returns error?;
    remote function onRepositoryVulnerabilityAlertDismiss(RepositoryVulnerabilityAlertPayload payload) returns error?;
    remote function onRepositoryVulnerabilityAlertCreate(RepositoryVulnerabilityAlertPayload payload) returns error?;
};

public type StarService service object {
    remote function onStarCreated(StarPayload payload) returns error?;
    remote function onStarDeleted(StarPayload payload) returns error?;
};

public type CreateService service object {
    remote function onCreate(CreatePayload payload) returns error?;
};

public type DeploymentReviewService service object {
    remote function onDeploymentReviewRequested(DeploymentReviewPayload payload) returns error?;
    remote function onDeploymentReviewRejected(DeploymentReviewPayload payload) returns error?;
    remote function onDeploymentReviewApproved(DeploymentReviewPayload payload) returns error?;
};

public type GollumService service object {
    remote function onGollum(GollumPayload payload) returns error?;
};

public type GithubAppAuthorizationService service object {
    remote function onGithubAppAuthorizationRevoked(GithubAppAuthorizationPayload payload) returns error?;
};

public type WatchService service object {
    remote function onWatchStarted(WatchPayload payload) returns error?;
};

public type TeamService service object {
    remote function onTeamCreated(TeamPayload payload) returns error?;
    remote function onTeamDeleted(TeamPayload payload) returns error?;
    remote function onTeamEdited(TeamPayload payload) returns error?;
    remote function onTeamAddedToRepository(TeamPayload payload) returns error?;
    remote function onTeamRemovedFromRepository(TeamPayload payload) returns error?;
};

public type WorkflowJobService service object {
    remote function onWorkflowJobQueued(WorkflowJobPayload payload) returns error?;
    remote function onWorkflowJobWaiting(WorkflowJobPayload payload) returns error?;
    remote function onWorkflowJobCompleted(WorkflowJobPayload payload) returns error?;
    remote function onWorkflowJobInProgress(WorkflowJobPayload payload) returns error?;
};

public type ReleaseService service object {
    remote function onReleaseCreated(ReleasePayload payload) returns error?;
    remote function onReleasePublished(ReleasePayload payload) returns error?;
    remote function onReleaseReleased(ReleasePayload payload) returns error?;
    remote function onReleasePrereleased(ReleasePayload payload) returns error?;
    remote function onReleaseUnpublished(ReleasePayload payload) returns error?;
    remote function onReleaseDeleted(ReleasePayload payload) returns error?;
    remote function onReleaseEdited(ReleasePayload payload) returns error?;
};

public type InstallationService service object {
    remote function onInstallationNewPermissionsAccepted(InstallationPayload payload) returns error?;
    remote function onInstallationSuspend(InstallationPayload payload) returns error?;
    remote function onInstallationCreated(InstallationPayload payload) returns error?;
    remote function onInstallationDeleted(InstallationPayload payload) returns error?;
    remote function onInstallationUnsuspend(InstallationPayload payload) returns error?;
};

public type CommitCommentService service object {
    remote function onCommitCommentCreated(CommitCommentPayload payload) returns error?;
};

public type DiscussionCommentService service object {
    remote function onDiscussionCommentDeleted(DiscussionCommentPayload payload) returns error?;
    remote function onDiscussionCommentCreated(DiscussionCommentPayload payload) returns error?;
    remote function onDiscussionCommentEdited(DiscussionCommentPayload payload) returns error?;
};

public type BranchProtectionRuleService service object {
    remote function onBranchProtectionRuleDeleted(BranchProtectionRulePayload payload) returns error?;
    remote function onBranchProtectionRuleEdited(BranchProtectionRulePayload payload) returns error?;
    remote function onBranchProtectionRuleCreated(BranchProtectionRulePayload payload) returns error?;
};

public type IssueDependenciesService service object {
    remote function onIssueDependenciesBlockingRemoved(IssueDependenciesPayload payload) returns error?;
    remote function onIssueDependenciesBlockedByRemoved(IssueDependenciesPayload payload) returns error?;
    remote function onIssueDependenciesBlockingAdded(IssueDependenciesPayload payload) returns error?;
    remote function onIssueDependenciesBlockedByAdded(IssueDependenciesPayload payload) returns error?;
};

public type RepositoryService service object {
    remote function onRepositoryPrivatized(RepositoryPayload payload) returns error?;
    remote function onRepositoryCreated(RepositoryPayload payload) returns error?;
    remote function onRepositoryRenamed(RepositoryPayload payload) returns error?;
    remote function onRepositoryTransferred(RepositoryPayload payload) returns error?;
    remote function onRepositoryEdited(RepositoryPayload payload) returns error?;
    remote function onRepositoryDeleted(RepositoryPayload payload) returns error?;
    remote function onRepositoryArchived(RepositoryPayload payload) returns error?;
    remote function onRepositoryPublicized(RepositoryPayload payload) returns error?;
    remote function onRepositoryUnarchived(RepositoryPayload payload) returns error?;
};

public type PullRequestReviewCommentService service object {
    remote function onPullRequestReviewCommentCreated(PullRequestReviewCommentPayload payload) returns error?;
    remote function onPullRequestReviewCommentDeleted(PullRequestReviewCommentPayload payload) returns error?;
    remote function onPullRequestReviewCommentEdited(PullRequestReviewCommentPayload payload) returns error?;
};

public type DeploymentProtectionRuleService service object {
    remote function onDeploymentProtectionRule(DeploymentProtectionRulePayload payload) returns error?;
};

public type CustomPropertyValuesService service object {
    remote function onCustomPropertyValuesUpdated(CustomPropertyValuesPayload payload) returns error?;
};

public type InstallationRepositoriesService service object {
    remote function onInstallationRepositoriesRemoved(InstallationRepositoriesPayload payload) returns error?;
    remote function onInstallationRepositoriesAdded(InstallationRepositoriesPayload payload) returns error?;
};

public type SecretScanningScanService service object {
    remote function onSecretScanningScan(SecretScanningScanPayload payload) returns error?;
};

public type ProjectCardService service object {
    remote function onProjectCardEdited(ProjectCardPayload payload) returns error?;
    remote function onProjectCardDeleted(ProjectCardPayload payload) returns error?;
    remote function onProjectCardMoved(ProjectCardPayload payload) returns error?;
    remote function onProjectCardConverted(ProjectCardPayload payload) returns error?;
    remote function onProjectCardCreated(ProjectCardPayload payload) returns error?;
};

public type CheckRunService service object {
    remote function onCheckRunCreated(CheckRunPayload payload) returns error?;
    remote function onCheckRunCompleted(CheckRunPayload payload) returns error?;
    remote function onCheckRunRequestedAction(CheckRunPayload payload) returns error?;
    remote function onCheckRunRerequested(CheckRunPayload payload) returns error?;
};

public type PageBuildService service object {
    remote function onPageBuild(PageBuildPayload payload) returns error?;
};

public type CustomPropertyService service object {
    remote function onCustomPropertyUpdated(CustomPropertyPayload payload) returns error?;
    remote function onCustomPropertyDeleted(CustomPropertyPayload payload) returns error?;
    remote function onCustomPropertyPromoteToEnterprise(CustomPropertyPayload payload) returns error?;
    remote function onCustomPropertyCreated(CustomPropertyPayload payload) returns error?;
};

public type DependabotAlertService service object {
    remote function onDependabotAlertAutoDismissed(DependabotAlertPayload payload) returns error?;
    remote function onDependabotAlertAutoReopened(DependabotAlertPayload payload) returns error?;
    remote function onDependabotAlertCreated(DependabotAlertPayload payload) returns error?;
    remote function onDependabotAlertDismissed(DependabotAlertPayload payload) returns error?;
    remote function onDependabotAlertReopened(DependabotAlertPayload payload) returns error?;
    remote function onDependabotAlertReintroduced(DependabotAlertPayload payload) returns error?;
    remote function onDependabotAlertAssigneesChanged(DependabotAlertPayload payload) returns error?;
    remote function onDependabotAlertFixed(DependabotAlertPayload payload) returns error?;
};

public type DeploymentStatusService service object {
    remote function onDeploymentStatusCreated(DeploymentStatusPayload payload) returns error?;
};

public type RepositoryAdvisoryService service object {
    remote function onRepositoryAdvisoryReported(RepositoryAdvisoryPayload payload) returns error?;
    remote function onRepositoryAdvisoryPublished(RepositoryAdvisoryPayload payload) returns error?;
};

public type PullRequestReviewThreadService service object {
    remote function onPullRequestReviewThreadUnresolved(PullRequestReviewThreadPayload payload) returns error?;
    remote function onPullRequestReviewThreadResolved(PullRequestReviewThreadPayload payload) returns error?;
};

public type GenericServiceType DeleteService|MetaService|WorkflowDispatchService|SecurityAndAnalysisService|DeployKeyService|ProjectColumnService|MarketplacePurchaseService|BranchProtectionConfigurationService|PullRequestService|LabelService|DeploymentService|TeamAddService|CodeScanningAlertService|MembershipService|SecretScanningAlertService|PushService|MemberService|RepositoryDispatchService|StatusService|RepositoryImportService|PersonalAccessTokenRequestService|SubIssuesService|RepositoryRulesetService|MilestoneService|PublicService|WorkflowRunService|ProjectsV2statusUpdateService|ProjectsV2itemService|SponsorshipService|MergeGroupService|ProjectService|OrgBlockService|SecretScanningAlertLocationService|InstallationTargetService|CheckSuiteService|PingService|IssueCommentService|SecurityAdvisoryService|PackageService|DiscussionService|ForkService|PullRequestReviewService|OrganizationService|IssuesService|RegistryPackageService|ProjectsV2Service|RepositoryVulnerabilityAlertService|StarService|CreateService|DeploymentReviewService|GollumService|GithubAppAuthorizationService|WatchService|TeamService|WorkflowJobService|ReleaseService|InstallationService|CommitCommentService|DiscussionCommentService|BranchProtectionRuleService|IssueDependenciesService|RepositoryService|PullRequestReviewCommentService|DeploymentProtectionRuleService|CustomPropertyValuesService|InstallationRepositoriesService|SecretScanningScanService|ProjectCardService|CheckRunService|PageBuildService|CustomPropertyService|DependabotAlertService|DeploymentStatusService|RepositoryAdvisoryService|PullRequestReviewThreadService;

