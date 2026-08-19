# Migration notes: full regeneration from spec (breaking)

This release replaces the hand-maintained `ballerina/` source (`data_types.bal`,
`dispatcher_service.bal`, `listener.bal`, `service_types.bal`, `tests/`) with output freshly
generated from `docs/spec/asyncapi.yml` using the `asyncapi-tools` generator, after fixing two real
bugs in that generator (see "Behavioral fixes" below). Previously, the shipped `.bal` files had
drifted from what the spec + generator actually produce, because past changes were hand-patched
into the generated files directly instead of into the spec, and never reconciled back. This release
removes that drift entirely - future changes should go through the spec and a regeneration, not
hand edits to `ballerina/*.bal`.

## Breaking change: remote function names

Nearly every remote function name changes from a short, action-only form to a full
`on<EventType><Action>` form, e.g. `onCompleted` (on `CheckSuiteService`) becomes
`onCheckSuiteCompleted`. This is not a bug fix or a stylistic choice made this release - it's what
the spec's `x-ballerina-event-type` values have said since an AsyncAPI 3.0 migration a while back;
the old short names were only still shipping because the generated code was never refreshed against
that change.

**Full old -> new mapping, per service type** (239 renamed functions across 57 service types -
56 with straightforward renames, plus `IssueDependenciesService` below, whose 2 old functions were
replaced by 4 new ones rather than renamed 1:1. The connector has 75 service types in total; most
had no naming change at all):

- `BranchProtectionConfigurationService`:
  - `onEnabled` -> `onBranchProtectionConfigurationEnabled`
  - `onDisabled` -> `onBranchProtectionConfigurationDisabled`
- `BranchProtectionRuleService`:
  - `onDeleted` -> `onBranchProtectionRuleDeleted`
  - `onEdited` -> `onBranchProtectionRuleEdited`
  - `onCreated` -> `onBranchProtectionRuleCreated`
- `CheckRunService`:
  - `onCreated` -> `onCheckRunCreated`
  - `onCompleted` -> `onCheckRunCompleted`
  - `onRequestedAction` -> `onCheckRunRequestedAction`
  - `onRerequested` -> `onCheckRunRerequested`
- `CheckSuiteService`:
  - `onCompleted` -> `onCheckSuiteCompleted`
  - `onRequested` -> `onCheckSuiteRequested`
  - `onRerequested` -> `onCheckSuiteRerequested`
- `CodeScanningAlertService`:
  - `onAppearedInBranch` -> `onCodeScanningAlertAppearedInBranch`
  - `onClosedByUser` -> `onCodeScanningAlertClosedByUser`
  - `onCreated` -> `onCodeScanningAlertCreated`
  - `onFixed` -> `onCodeScanningAlertFixed`
  - `onReopened` -> `onCodeScanningAlertReopened`
  - `onReopenedByUser` -> `onCodeScanningAlertReopenedByUser`
  - `onUpdatedAssignment` -> `onCodeScanningAlertUpdatedAssignment`
- `CommitCommentService`:
  - `onCommitComment` -> `onCommitCommentCreated`
- `CustomPropertyService`:
  - `onUpdated` -> `onCustomPropertyUpdated`
  - `onDeleted` -> `onCustomPropertyDeleted`
  - `onPromoteToEnterprise` -> `onCustomPropertyPromoteToEnterprise`
  - `onCreated` -> `onCustomPropertyCreated`
- `CustomPropertyValuesService`:
  - `onCustomPropertyValues` -> `onCustomPropertyValuesUpdated`
- `DependabotAlertService`:
  - `onAutoDismissed` -> `onDependabotAlertAutoDismissed`
  - `onAutoReopened` -> `onDependabotAlertAutoReopened`
  - `onCreated` -> `onDependabotAlertCreated`
  - `onDismissed` -> `onDependabotAlertDismissed`
  - `onReopened` -> `onDependabotAlertReopened`
  - `onReintroduced` -> `onDependabotAlertReintroduced`
  - `onAssigneesChanged` -> `onDependabotAlertAssigneesChanged`
  - `onFixed` -> `onDependabotAlertFixed`
- `DeployKeyService`:
  - `onCreated` -> `onDeployKeyCreated`
  - `onDeleted` -> `onDeployKeyDeleted`
- `DeploymentReviewService`:
  - `onRequested` -> `onDeploymentReviewRequested`
  - `onRejected` -> `onDeploymentReviewRejected`
  - `onApproved` -> `onDeploymentReviewApproved`
- `DeploymentService`:
  - `onDeployment` -> `onDeploymentCreated`
- `DeploymentStatusService`:
  - `onDeploymentStatus` -> `onDeploymentStatusCreated`
- `DiscussionCommentService`:
  - `onDeleted` -> `onDiscussionCommentDeleted`
  - `onCreated` -> `onDiscussionCommentCreated`
  - `onEdited` -> `onDiscussionCommentEdited`
- `DiscussionService`:
  - `onUnanswered` -> `onDiscussionUnanswered`
  - `onCreated` -> `onDiscussionCreated`
  - `onTransferred` -> `onDiscussionTransferred`
  - `onCategoryChanged` -> `onDiscussionCategoryChanged`
  - `onDeleted` -> `onDiscussionDeleted`
  - `onUnlocked` -> `onDiscussionUnlocked`
  - `onPinned` -> `onDiscussionPinned`
  - `onEdited` -> `onDiscussionEdited`
  - `onReopened` -> `onDiscussionReopened`
  - `onAnswered` -> `onDiscussionAnswered`
  - `onClosed` -> `onDiscussionClosed`
  - `onUnlabeled` -> `onDiscussionUnlabeled`
  - `onLabeled` -> `onDiscussionLabeled`
  - `onUnpinned` -> `onDiscussionUnpinned`
  - `onLocked` -> `onDiscussionLocked`
- `GithubAppAuthorizationService`:
  - `onGithubAppAuthorization` -> `onGithubAppAuthorizationRevoked`
- `InstallationRepositoriesService`:
  - `onRemoved` -> `onInstallationRepositoriesRemoved`
  - `onAdded` -> `onInstallationRepositoriesAdded`
- `InstallationService`:
  - `onNewPermissionsAccepted` -> `onInstallationNewPermissionsAccepted`
  - `onSuspend` -> `onInstallationSuspend`
  - `onCreated` -> `onInstallationCreated`
  - `onDeleted` -> `onInstallationDeleted`
  - `onUnsuspend` -> `onInstallationUnsuspend`
- `InstallationTargetService`:
  - `onInstallationTarget` -> `onInstallationTargetRenamed`
- `IssueCommentService`:
  - `onEdited` -> `onIssueCommentEdited`
  - `onPinned` -> `onIssueCommentPinned`
  - `onDeleted` -> `onIssueCommentDeleted`
  - `onCreated` -> `onIssueCommentCreated`
  - `onUnpinned` -> `onIssueCommentUnpinned`
- `IssueDependenciesService` (function count changed: 2 -> 4):
  - old: [onIssueDependencyAdded, onIssueDependencyRemoved]
  - new: [onIssueDependenciesBlockingRemoved, onIssueDependenciesBlockedByRemoved, onIssueDependenciesBlockingAdded, onIssueDependenciesBlockedByAdded]
- `IssuesService`:
  - `onReopened` -> `onIssuesReopened`
  - `onTransferred` -> `onIssuesTransferred`
  - `onUnpinned` -> `onIssuesUnpinned`
  - `onAssigned` -> `onIssuesAssigned`
  - `onMilestoned` -> `onIssuesMilestoned`
  - `onLabeled` -> `onIssuesLabeled`
  - `onOpened` -> `onIssuesOpened`
  - `onPinned` -> `onIssuesPinned`
  - `onTyped` -> `onIssuesTyped`
  - `onEdited` -> `onIssuesEdited`
  - `onUntyped` -> `onIssuesUntyped`
  - `onDemilestoned` -> `onIssuesDemilestoned`
  - `onLocked` -> `onIssuesLocked`
  - `onUnassigned` -> `onIssuesUnassigned`
  - `onUnlocked` -> `onIssuesUnlocked`
  - `onUnlabeled` -> `onIssuesUnlabeled`
  - `onClosed` -> `onIssuesClosed`
  - `onDeleted` -> `onIssuesDeleted`
- `LabelService`:
  - `onEdited` -> `onLabelEdited`
  - `onCreated` -> `onLabelCreated`
  - `onDeleted` -> `onLabelDeleted`
- `MarketplacePurchaseService`:
  - `onPurchased` -> `onMarketplacePurchasePurchased`
  - `onCancelled` -> `onMarketplacePurchaseCancelled`
  - `onPendingChangeCancelled` -> `onMarketplacePurchasePendingChangeCancelled`
  - `onPendingChange` -> `onMarketplacePurchasePendingChange`
  - `onChanged` -> `onMarketplacePurchaseChanged`
- `MemberService`:
  - `onEdited` -> `onMemberEdited`
  - `onAdded` -> `onMemberAdded`
  - `onRemoved` -> `onMemberRemoved`
- `MembershipService`:
  - `onAdded` -> `onMembershipAdded`
  - `onRemoved` -> `onMembershipRemoved`
- `MergeGroupService`:
  - `onDestroyed` -> `onMergeGroupDestroyed`
  - `onChecksRequested` -> `onMergeGroupChecksRequested`
- `MetaService`:
  - `onMeta` -> `onMetaDeleted`
- `MilestoneService`:
  - `onCreated` -> `onMilestoneCreated`
  - `onEdited` -> `onMilestoneEdited`
  - `onOpened` -> `onMilestoneOpened`
  - `onDeleted` -> `onMilestoneDeleted`
  - `onClosed` -> `onMilestoneClosed`
- `OrgBlockService`:
  - `onBlocked` -> `onOrgBlockBlocked`
  - `onUnblocked` -> `onOrgBlockUnblocked`
- `OrganizationService`:
  - `onAdded` -> `onOrganizationMemberAdded`
  - `onRemoved` -> `onOrganizationMemberRemoved`
  - `onDeleted` -> `onOrganizationDeleted`
  - `onRenamed` -> `onOrganizationRenamed`
  - `onMemberInvited` -> `onOrganizationMemberInvited`
- `PackageService`:
  - `onPublished` -> `onPackagePublished`
  - `onUpdated` -> `onPackageUpdated`
- `PersonalAccessTokenRequestService`:
  - `onCreated` -> `onPersonalAccessTokenRequestCreated`
  - `onApproved` -> `onPersonalAccessTokenRequestApproved`
  - `onDenied` -> `onPersonalAccessTokenRequestDenied`
  - `onCancelled` -> `onPersonalAccessTokenRequestCancelled`
- `ProjectColumnService`:
  - `onMoved` -> `onProjectColumnMoved`
  - `onEdited` -> `onProjectColumnEdited`
  - `onDeleted` -> `onProjectColumnDeleted`
  - `onCreated` -> `onProjectColumnCreated`
- `ProjectService`:
  - `onDeleted` -> `onProjectDeleted`
  - `onCreated` -> `onProjectCreated`
  - `onClosed` -> `onProjectClosed`
  - `onReopened` -> `onProjectReopened`
  - `onEdited` -> `onProjectEdited`
- `ProjectsV2Service`:
  - `onCreated` -> `onProjectsV2Created`
  - `onEdited` -> `onProjectsV2Edited`
  - `onClosed` -> `onProjectsV2Closed`
  - `onReopened` -> `onProjectsV2Reopened`
  - `onDeleted` -> `onProjectsV2Deleted`
- `ProjectsV2itemService`:
  - `onEdited` -> `onProjectsV2ItemEdited`
  - `onCreated` -> `onProjectsV2ItemCreated`
  - `onArchived` -> `onProjectsV2ItemArchived`
  - `onDeleted` -> `onProjectsV2ItemDeleted`
  - `onRestored` -> `onProjectsV2ItemRestored`
  - `onReordered` -> `onProjectsV2ItemReordered`
  - `onConverted` -> `onProjectsV2ItemConverted`
- `ProjectsV2statusUpdateService`:
  - `onEdited` -> `onProjectsV2StatusUpdateEdited`
  - `onDeleted` -> `onProjectsV2StatusUpdateDeleted`
  - `onCreated` -> `onProjectsV2StatusUpdateCreated`
- `PullRequestReviewCommentService`:
  - `onCreated` -> `onPullRequestReviewCommentCreated`
  - `onDeleted` -> `onPullRequestReviewCommentDeleted`
  - `onEdited` -> `onPullRequestReviewCommentEdited`
- `PullRequestReviewService`:
  - `onSubmitted` -> `onPullRequestReviewSubmitted`
  - `onEdited` -> `onPullRequestReviewEdited`
  - `onDismissed` -> `onPullRequestReviewDismissed`
- `PullRequestReviewThreadService`:
  - `onUnresolved` -> `onPullRequestReviewThreadUnresolved`
  - `onResolved` -> `onPullRequestReviewThreadResolved`
- `PullRequestService`:
  - `onEnqueued` -> `onPullRequestEnqueued`
  - `onReviewRequestRemoved` -> `onPullRequestReviewRequestRemoved`
  - `onOpened` -> `onPullRequestOpened`
  - `onReadyForReview` -> `onPullRequestReadyForReview`
  - `onLabeled` -> `onPullRequestLabeled`
  - `onUnassigned` -> `onPullRequestUnassigned`
  - `onEdited` -> `onPullRequestEdited`
  - `onSynchronize` -> `onPullRequestSynchronize`
  - `onReviewRequested` -> `onPullRequestReviewRequested`
  - `onReopened` -> `onPullRequestReopened`
  - `onAutoMergeDisabled` -> `onPullRequestAutoMergeDisabled`
  - `onLocked` -> `onPullRequestLocked`
  - `onAutoMergeEnabled` -> `onPullRequestAutoMergeEnabled`
  - `onMilestoned` -> `onPullRequestMilestoned`
  - `onDequeued` -> `onPullRequestDequeued`
  - `onUnlabeled` -> `onPullRequestUnlabeled`
  - `onClosed` -> `onPullRequestClosed`
  - `onUnlocked` -> `onPullRequestUnlocked`
  - `onAssigned` -> `onPullRequestAssigned`
  - `onConvertedToDraft` -> `onPullRequestConvertedToDraft`
  - `onDemilestoned` -> `onPullRequestDemilestoned`
- `RegistryPackageService`:
  - `onUpdated` -> `onRegistryPackageUpdated`
  - `onPublished` -> `onRegistryPackagePublished`
- `ReleaseService`:
  - `onCreated` -> `onReleaseCreated`
  - `onPublished` -> `onReleasePublished`
  - `onReleased` -> `onReleaseReleased`
  - `onPrereleased` -> `onReleasePrereleased`
  - `onUnpublished` -> `onReleaseUnpublished`
  - `onDeleted` -> `onReleaseDeleted`
  - `onEdited` -> `onReleaseEdited`
- `RepositoryAdvisoryService`:
  - `onReported` -> `onRepositoryAdvisoryReported`
  - `onPublished` -> `onRepositoryAdvisoryPublished`
- `RepositoryRulesetService`:
  - `onCreated` -> `onRepositoryRulesetCreated`
  - `onEdited` -> `onRepositoryRulesetEdited`
  - `onDeleted` -> `onRepositoryRulesetDeleted`
- `RepositoryService`:
  - `onPrivatized` -> `onRepositoryPrivatized`
  - `onCreated` -> `onRepositoryCreated`
  - `onRenamed` -> `onRepositoryRenamed`
  - `onTransferred` -> `onRepositoryTransferred`
  - `onEdited` -> `onRepositoryEdited`
  - `onDeleted` -> `onRepositoryDeleted`
  - `onArchived` -> `onRepositoryArchived`
  - `onPublicized` -> `onRepositoryPublicized`
  - `onUnarchived` -> `onRepositoryUnarchived`
- `RepositoryVulnerabilityAlertService`:
  - `onResolve` -> `onRepositoryVulnerabilityAlertResolve`
  - `onReopen` -> `onRepositoryVulnerabilityAlertReopen`
  - `onDismiss` -> `onRepositoryVulnerabilityAlertDismiss`
  - `onCreate` -> `onRepositoryVulnerabilityAlertCreate`
- `SecretScanningAlertService`:
  - `onAssigned` -> `onSecretScanningAlertAssigned`
  - `onReopened` -> `onSecretScanningAlertReopened`
  - `onUnassigned` -> `onSecretScanningAlertUnassigned`
  - `onCreated` -> `onSecretScanningAlertCreated`
  - `onPubliclyLeaked` -> `onSecretScanningAlertPubliclyLeaked`
  - `onValidated` -> `onSecretScanningAlertValidated`
  - `onResolved` -> `onSecretScanningAlertResolved`
- `SecurityAdvisoryService`:
  - `onWithdrawn` -> `onSecurityAdvisoryWithdrawn`
  - `onPublished` -> `onSecurityAdvisoryPublished`
  - `onUpdated` -> `onSecurityAdvisoryUpdated`
- `SponsorshipService`:
  - `onCancelled` -> `onSponsorshipCancelled`
  - `onEdited` -> `onSponsorshipEdited`
  - `onTierChanged` -> `onSponsorshipTierChanged`
  - `onPendingCancellation` -> `onSponsorshipPendingCancellation`
  - `onCreated` -> `onSponsorshipCreated`
  - `onPendingTierChange` -> `onSponsorshipPendingTierChange`
- `StarService`:
  - `onCreated` -> `onStarCreated`
  - `onDeleted` -> `onStarDeleted`
- `SubIssuesService`:
  - `onChildIssueAdded` -> `onSubIssuesSubIssueAdded`
  - `onParentIssueAdded` -> `onSubIssuesParentIssueAdded`
  - `onChildIssueRemoved` -> `onSubIssuesSubIssueRemoved`
  - `onParentIssueRemoved` -> `onSubIssuesParentIssueRemoved`
- `TeamService`:
  - `onCreated` -> `onTeamCreated`
  - `onDeleted` -> `onTeamDeleted`
  - `onEdited` -> `onTeamEdited`
  - `onAddedToRepository` -> `onTeamAddedToRepository`
  - `onRemovedFromRepository` -> `onTeamRemovedFromRepository`
- `WatchService`:
  - `onWatch` -> `onWatchStarted`
- `WorkflowJobService`:
  - `onQueued` -> `onWorkflowJobQueued`
  - `onWaiting` -> `onWorkflowJobWaiting`
  - `onCompleted` -> `onWorkflowJobCompleted`
  - `onInProgress` -> `onWorkflowJobInProgress`
- `WorkflowRunService`:
  - `onInProgress` -> `onWorkflowRunInProgress`
  - `onCompleted` -> `onWorkflowRunCompleted`
  - `onRequested` -> `onWorkflowRunRequested`

## New: `IssueDependenciesService` now has 4 functions, not 2

Previously: `onIssueDependencyAdded`, `onIssueDependencyRemoved` (generic, covering both
"blocking" and "blocked by" relationships in one function each).

Now: `onIssueDependenciesBlockingAdded`, `onIssueDependenciesBlockingRemoved`,
`onIssueDependenciesBlockedByAdded`, `onIssueDependenciesBlockedByRemoved` - matching GitHub's real
4 distinct actions. This was already possible from the spec and the payload data; the shipped code
just never routed to it. If you were implementing the old generic functions and switching on the
payload's `action` field yourself, you can now implement the specific function you actually need
directly.

## Fixed: 8 events with incomplete identifiers

`watch`, `deployment`, `deployment_status`, `installation_target`, `custom_property_values`,
`github_app_authorization`, `meta`, and `commit_comment` were declared in the spec with a bare
event-type identifier (e.g. `"watch"`) instead of the full action-specific one (e.g.
`"watch_started"`). Since these services each have only one action today, this had no visible
effect other than the function names below now including that action. Same root cause and same fix
as `ballerina-platform/asyncapi-triggers#188`, which fixed this same gap in the old monorepo but
was never carried into this repo's copy of the spec.

## Behavioral fixes (from the generator itself, not spec-driven)

Two real bugs were fixed in `asyncapi-tools`'s generator (`ballerina-platform/asyncapi-tools`, PR
pending) and are reflected in this regeneration:

1. **Ack no longer blocks on the user's handler.** Previously, the dispatcher acknowledged the
   webhook *after* invoking the matched remote function, using `check` - so an error in a user's
   handler prevented the acknowledgement entirely, and the delivering service (GitHub) would treat
   it as a failed delivery and retry. The ack is now sent immediately after the payload is parsed,
   before the handler runs; handler errors are now logged, not propagated.
2. **Signature verification now supports a configured `headerFormat`.** The spec's
   `x-ballerina-auth` block was missing `signature.headerFormat`, so signature verification
   defaulted to comparing a bare, unprefixed digest - which would have rejected every real GitHub
   webhook (GitHub always sends `sha256=<hex>`). `docs/spec/asyncapi.yml` now declares
   `headerFormat: "sha256=$signature"` explicitly.

## Test suite

The 13 hand-written test files under `ballerina/tests/` are replaced by a single generated
`tests/dispatch_test.bal`, covering all 265 events against real Octokit sample webhook payloads
(`ballerina/tests/resources/trigger_payloads/`), each sent as a real signed HTTP request to a test
listener and asserting the correct remote function fired. `bal test`: 265/265 passing.
