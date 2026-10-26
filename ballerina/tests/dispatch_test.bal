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
import ballerina/io;
import ballerina/lang.runtime;
import ballerina/test;

const TRIGGER_TEST_SECRET = "trigger-test-secret";
const TRIGGER_TEST_PORT = 9091;
const TRIGGER_PAYLOAD_DIR = "tests/resources/trigger_payloads";

isolated map<boolean> triggerFired = {};
isolated map<json> boundPayloads = {};

listener Listener triggerTestListener = check new ({webhookSecret: TRIGGER_TEST_SECRET}, TRIGGER_TEST_PORT);

final http:Client triggerClient = check new (string `http://localhost:${TRIGGER_TEST_PORT}`);

service PingService on triggerTestListener {
    isolated remote function onPing(PingPayload payload) returns error? {
        lock {
            triggerFired["PingService.onPing"] = true;
        }
        lock {
            boundPayloads["PingService.onPing"] = payload.toJson().clone();
        }
    }
}

service PushService on triggerTestListener {
    isolated remote function onPush(PushPayload payload) returns error? {
        lock {
            triggerFired["PushService.onPush"] = true;
        }
        lock {
            boundPayloads["PushService.onPush"] = payload.toJson().clone();
        }
    }
}

service PullRequestService on triggerTestListener {
    isolated remote function onPullRequestAssigned(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestAssigned"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestAssigned"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestAutoMergeDisabled(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestAutoMergeDisabled"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestAutoMergeDisabled"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestAutoMergeEnabled(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestAutoMergeEnabled"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestAutoMergeEnabled"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestClosed(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestClosed"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestClosed"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestConvertedToDraft(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestConvertedToDraft"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestConvertedToDraft"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestDemilestoned(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestDemilestoned"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestDemilestoned"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestDequeued(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestDequeued"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestDequeued"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestEdited(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestEdited"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestEdited"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestEnqueued(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestEnqueued"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestEnqueued"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestLabeled(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestLabeled"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestLabeled"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestLocked(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestLocked"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestLocked"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestMilestoned(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestMilestoned"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestMilestoned"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestOpened(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestOpened"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestOpened"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestReadyForReview(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestReadyForReview"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestReadyForReview"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestReopened(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestReopened"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestReopened"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestReviewRequestRemoved(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestReviewRequestRemoved"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestReviewRequestRemoved"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestReviewRequested(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestReviewRequested"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestReviewRequested"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestSynchronize(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestSynchronize"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestSynchronize"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestUnassigned(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestUnassigned"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestUnassigned"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestUnlabeled(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestUnlabeled"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestUnlabeled"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestUnlocked(PullRequestPayload payload) returns error? {
        lock {
            triggerFired["PullRequestService.onPullRequestUnlocked"] = true;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestUnlocked"] = payload.toJson().clone();
        }
    }
}

service IssuesService on triggerTestListener {
    isolated remote function onIssuesAssigned(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesAssigned"] = true;
        }
    }

    isolated remote function onIssuesClosed(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesClosed"] = true;
        }
    }

    isolated remote function onIssuesDeleted(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesDeleted"] = true;
        }
    }

    isolated remote function onIssuesDemilestoned(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesDemilestoned"] = true;
        }
    }

    isolated remote function onIssuesEdited(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesEdited"] = true;
        }
    }

    isolated remote function onIssuesLabeled(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesLabeled"] = true;
        }
    }

    isolated remote function onIssuesLocked(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesLocked"] = true;
        }
    }

    isolated remote function onIssuesMilestoned(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesMilestoned"] = true;
        }
    }

    isolated remote function onIssuesOpened(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesOpened"] = true;
        }
    }

    isolated remote function onIssuesPinned(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesPinned"] = true;
        }
    }

    isolated remote function onIssuesReopened(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesReopened"] = true;
        }
    }

    isolated remote function onIssuesTransferred(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesTransferred"] = true;
        }
    }

    isolated remote function onIssuesTyped(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesTyped"] = true;
        }
    }

    isolated remote function onIssuesUnassigned(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesUnassigned"] = true;
        }
    }

    isolated remote function onIssuesUnlabeled(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesUnlabeled"] = true;
        }
    }

    isolated remote function onIssuesUnlocked(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesUnlocked"] = true;
        }
    }

    isolated remote function onIssuesUnpinned(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesUnpinned"] = true;
        }
    }

    isolated remote function onIssuesUntyped(IssuesPayload payload) returns error? {
        lock {
            triggerFired["IssuesService.onIssuesUntyped"] = true;
        }
    }
}

service ReleaseService on triggerTestListener {
    isolated remote function onReleaseCreated(ReleasePayload payload) returns error? {
        lock {
            triggerFired["ReleaseService.onReleaseCreated"] = true;
        }
    }

    isolated remote function onReleaseDeleted(ReleasePayload payload) returns error? {
        lock {
            triggerFired["ReleaseService.onReleaseDeleted"] = true;
        }
    }

    isolated remote function onReleaseEdited(ReleasePayload payload) returns error? {
        lock {
            triggerFired["ReleaseService.onReleaseEdited"] = true;
        }
    }

    isolated remote function onReleasePrereleased(ReleasePayload payload) returns error? {
        lock {
            triggerFired["ReleaseService.onReleasePrereleased"] = true;
        }
    }

    isolated remote function onReleasePublished(ReleasePayload payload) returns error? {
        lock {
            triggerFired["ReleaseService.onReleasePublished"] = true;
        }
    }

    isolated remote function onReleaseReleased(ReleasePayload payload) returns error? {
        lock {
            triggerFired["ReleaseService.onReleaseReleased"] = true;
        }
    }

    isolated remote function onReleaseUnpublished(ReleasePayload payload) returns error? {
        lock {
            triggerFired["ReleaseService.onReleaseUnpublished"] = true;
        }
    }
}

service IssueCommentService on triggerTestListener {
    isolated remote function onIssueCommentCreated(IssueCommentPayload payload) returns error? {
        lock {
            triggerFired["IssueCommentService.onIssueCommentCreated"] = true;
        }
    }

    isolated remote function onIssueCommentDeleted(IssueCommentPayload payload) returns error? {
        lock {
            triggerFired["IssueCommentService.onIssueCommentDeleted"] = true;
        }
    }

    isolated remote function onIssueCommentEdited(IssueCommentPayload payload) returns error? {
        lock {
            triggerFired["IssueCommentService.onIssueCommentEdited"] = true;
        }
    }

    isolated remote function onIssueCommentPinned(IssueCommentPayload payload) returns error? {
        lock {
            triggerFired["IssueCommentService.onIssueCommentPinned"] = true;
        }
    }

    isolated remote function onIssueCommentUnpinned(IssueCommentPayload payload) returns error? {
        lock {
            triggerFired["IssueCommentService.onIssueCommentUnpinned"] = true;
        }
    }
}

service PullRequestReviewService on triggerTestListener {
    isolated remote function onPullRequestReviewDismissed(PullRequestReviewPayload payload) returns error? {
        lock {
            triggerFired["PullRequestReviewService.onPullRequestReviewDismissed"] = true;
        }
        lock {
            boundPayloads["PullRequestReviewService.onPullRequestReviewDismissed"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestReviewEdited(PullRequestReviewPayload payload) returns error? {
        lock {
            triggerFired["PullRequestReviewService.onPullRequestReviewEdited"] = true;
        }
        lock {
            boundPayloads["PullRequestReviewService.onPullRequestReviewEdited"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestReviewSubmitted(PullRequestReviewPayload payload) returns error? {
        lock {
            triggerFired["PullRequestReviewService.onPullRequestReviewSubmitted"] = true;
        }
        lock {
            boundPayloads["PullRequestReviewService.onPullRequestReviewSubmitted"] = payload.toJson().clone();
        }
    }
}

service PullRequestReviewCommentService on triggerTestListener {
    isolated remote function onPullRequestReviewCommentCreated(PullRequestReviewCommentPayload payload) returns error? {
        lock {
            triggerFired["PullRequestReviewCommentService.onPullRequestReviewCommentCreated"] = true;
        }
        lock {
            boundPayloads["PullRequestReviewCommentService.onPullRequestReviewCommentCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestReviewCommentDeleted(PullRequestReviewCommentPayload payload) returns error? {
        lock {
            triggerFired["PullRequestReviewCommentService.onPullRequestReviewCommentDeleted"] = true;
        }
        lock {
            boundPayloads["PullRequestReviewCommentService.onPullRequestReviewCommentDeleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestReviewCommentEdited(PullRequestReviewCommentPayload payload) returns error? {
        lock {
            triggerFired["PullRequestReviewCommentService.onPullRequestReviewCommentEdited"] = true;
        }
        lock {
            boundPayloads["PullRequestReviewCommentService.onPullRequestReviewCommentEdited"] = payload.toJson().clone();
        }
    }
}

service CreateService on triggerTestListener {
    isolated remote function onCreate(CreatePayload payload) returns error? {
        lock {
            triggerFired["CreateService.onCreate"] = true;
        }
        lock {
            boundPayloads["CreateService.onCreate"] = payload.toJson().clone();
        }
    }
}

service DeleteService on triggerTestListener {
    isolated remote function onDelete(DeletePayload payload) returns error? {
        lock {
            triggerFired["DeleteService.onDelete"] = true;
        }
        lock {
            boundPayloads["DeleteService.onDelete"] = payload.toJson().clone();
        }
    }
}

service ForkService on triggerTestListener {
    isolated remote function onFork(ForkPayload payload) returns error? {
        lock {
            triggerFired["ForkService.onFork"] = true;
        }
    }
}

service StarService on triggerTestListener {
    isolated remote function onStarCreated(StarPayload payload) returns error? {
        lock {
            triggerFired["StarService.onStarCreated"] = true;
        }
        lock {
            boundPayloads["StarService.onStarCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onStarDeleted(StarPayload payload) returns error? {
        lock {
            triggerFired["StarService.onStarDeleted"] = true;
        }
        lock {
            boundPayloads["StarService.onStarDeleted"] = payload.toJson().clone();
        }
    }
}

service WatchService on triggerTestListener {
    isolated remote function onWatchStarted(WatchPayload payload) returns error? {
        lock {
            triggerFired["WatchService.onWatchStarted"] = true;
        }
    }
}

service CheckRunService on triggerTestListener {
    isolated remote function onCheckRunCompleted(CheckRunPayload payload) returns error? {
        lock {
            triggerFired["CheckRunService.onCheckRunCompleted"] = true;
        }
        lock {
            boundPayloads["CheckRunService.onCheckRunCompleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onCheckRunCreated(CheckRunPayload payload) returns error? {
        lock {
            triggerFired["CheckRunService.onCheckRunCreated"] = true;
        }
        lock {
            boundPayloads["CheckRunService.onCheckRunCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onCheckRunRequestedAction(CheckRunPayload payload) returns error? {
        lock {
            triggerFired["CheckRunService.onCheckRunRequestedAction"] = true;
        }
        lock {
            boundPayloads["CheckRunService.onCheckRunRequestedAction"] = payload.toJson().clone();
        }
    }

    isolated remote function onCheckRunRerequested(CheckRunPayload payload) returns error? {
        lock {
            triggerFired["CheckRunService.onCheckRunRerequested"] = true;
        }
        lock {
            boundPayloads["CheckRunService.onCheckRunRerequested"] = payload.toJson().clone();
        }
    }
}

service CheckSuiteService on triggerTestListener {
    isolated remote function onCheckSuiteCompleted(CheckSuitePayload payload) returns error? {
        lock {
            triggerFired["CheckSuiteService.onCheckSuiteCompleted"] = true;
        }
        lock {
            boundPayloads["CheckSuiteService.onCheckSuiteCompleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onCheckSuiteRequested(CheckSuitePayload payload) returns error? {
        lock {
            triggerFired["CheckSuiteService.onCheckSuiteRequested"] = true;
        }
        lock {
            boundPayloads["CheckSuiteService.onCheckSuiteRequested"] = payload.toJson().clone();
        }
    }

    isolated remote function onCheckSuiteRerequested(CheckSuitePayload payload) returns error? {
        lock {
            triggerFired["CheckSuiteService.onCheckSuiteRerequested"] = true;
        }
        lock {
            boundPayloads["CheckSuiteService.onCheckSuiteRerequested"] = payload.toJson().clone();
        }
    }
}

service DeploymentService on triggerTestListener {
    isolated remote function onDeploymentCreated(DeploymentPayload payload) returns error? {
        lock {
            triggerFired["DeploymentService.onDeploymentCreated"] = true;
        }
        lock {
            boundPayloads["DeploymentService.onDeploymentCreated"] = payload.toJson().clone();
        }
    }
}

service DeploymentStatusService on triggerTestListener {
    isolated remote function onDeploymentStatusCreated(DeploymentStatusPayload payload) returns error? {
        lock {
            triggerFired["DeploymentStatusService.onDeploymentStatusCreated"] = true;
        }
        lock {
            boundPayloads["DeploymentStatusService.onDeploymentStatusCreated"] = payload.toJson().clone();
        }
    }
}

service WorkflowRunService on triggerTestListener {
    isolated remote function onWorkflowRunCompleted(WorkflowRunPayload payload) returns error? {
        lock {
            triggerFired["WorkflowRunService.onWorkflowRunCompleted"] = true;
        }
        lock {
            boundPayloads["WorkflowRunService.onWorkflowRunCompleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onWorkflowRunInProgress(WorkflowRunPayload payload) returns error? {
        lock {
            triggerFired["WorkflowRunService.onWorkflowRunInProgress"] = true;
        }
        lock {
            boundPayloads["WorkflowRunService.onWorkflowRunInProgress"] = payload.toJson().clone();
        }
    }

    isolated remote function onWorkflowRunRequested(WorkflowRunPayload payload) returns error? {
        lock {
            triggerFired["WorkflowRunService.onWorkflowRunRequested"] = true;
        }
        lock {
            boundPayloads["WorkflowRunService.onWorkflowRunRequested"] = payload.toJson().clone();
        }
    }
}

service WorkflowJobService on triggerTestListener {
    isolated remote function onWorkflowJobCompleted(WorkflowJobPayload payload) returns error? {
        lock {
            triggerFired["WorkflowJobService.onWorkflowJobCompleted"] = true;
        }
        lock {
            boundPayloads["WorkflowJobService.onWorkflowJobCompleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onWorkflowJobInProgress(WorkflowJobPayload payload) returns error? {
        lock {
            triggerFired["WorkflowJobService.onWorkflowJobInProgress"] = true;
        }
        lock {
            boundPayloads["WorkflowJobService.onWorkflowJobInProgress"] = payload.toJson().clone();
        }
    }

    isolated remote function onWorkflowJobQueued(WorkflowJobPayload payload) returns error? {
        lock {
            triggerFired["WorkflowJobService.onWorkflowJobQueued"] = true;
        }
        lock {
            boundPayloads["WorkflowJobService.onWorkflowJobQueued"] = payload.toJson().clone();
        }
    }

    isolated remote function onWorkflowJobWaiting(WorkflowJobPayload payload) returns error? {
        lock {
            triggerFired["WorkflowJobService.onWorkflowJobWaiting"] = true;
        }
        lock {
            boundPayloads["WorkflowJobService.onWorkflowJobWaiting"] = payload.toJson().clone();
        }
    }
}

service RepositoryService on triggerTestListener {
    isolated remote function onRepositoryArchived(RepositoryPayload payload) returns error? {
        lock {
            triggerFired["RepositoryService.onRepositoryArchived"] = true;
        }
    }

    isolated remote function onRepositoryCreated(RepositoryPayload payload) returns error? {
        lock {
            triggerFired["RepositoryService.onRepositoryCreated"] = true;
        }
    }

    isolated remote function onRepositoryDeleted(RepositoryPayload payload) returns error? {
        lock {
            triggerFired["RepositoryService.onRepositoryDeleted"] = true;
        }
    }

    isolated remote function onRepositoryEdited(RepositoryPayload payload) returns error? {
        lock {
            triggerFired["RepositoryService.onRepositoryEdited"] = true;
        }
    }

    isolated remote function onRepositoryPrivatized(RepositoryPayload payload) returns error? {
        lock {
            triggerFired["RepositoryService.onRepositoryPrivatized"] = true;
        }
    }

    isolated remote function onRepositoryPublicized(RepositoryPayload payload) returns error? {
        lock {
            triggerFired["RepositoryService.onRepositoryPublicized"] = true;
        }
    }

    isolated remote function onRepositoryRenamed(RepositoryPayload payload) returns error? {
        lock {
            triggerFired["RepositoryService.onRepositoryRenamed"] = true;
        }
    }

    isolated remote function onRepositoryTransferred(RepositoryPayload payload) returns error? {
        lock {
            triggerFired["RepositoryService.onRepositoryTransferred"] = true;
        }
    }

    isolated remote function onRepositoryUnarchived(RepositoryPayload payload) returns error? {
        lock {
            triggerFired["RepositoryService.onRepositoryUnarchived"] = true;
        }
    }
}

service MemberService on triggerTestListener {
    isolated remote function onMemberAdded(MemberPayload payload) returns error? {
        lock {
            triggerFired["MemberService.onMemberAdded"] = true;
        }
    }

    isolated remote function onMemberEdited(MemberPayload payload) returns error? {
        lock {
            triggerFired["MemberService.onMemberEdited"] = true;
        }
    }

    isolated remote function onMemberRemoved(MemberPayload payload) returns error? {
        lock {
            triggerFired["MemberService.onMemberRemoved"] = true;
        }
    }
}

service DiscussionService on triggerTestListener {
    isolated remote function onDiscussionAnswered(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionAnswered"] = true;
        }
    }

    isolated remote function onDiscussionCategoryChanged(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionCategoryChanged"] = true;
        }
    }

    isolated remote function onDiscussionClosed(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionClosed"] = true;
        }
    }

    isolated remote function onDiscussionCreated(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionCreated"] = true;
        }
    }

    isolated remote function onDiscussionDeleted(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionDeleted"] = true;
        }
    }

    isolated remote function onDiscussionEdited(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionEdited"] = true;
        }
    }

    isolated remote function onDiscussionLabeled(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionLabeled"] = true;
        }
    }

    isolated remote function onDiscussionLocked(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionLocked"] = true;
        }
    }

    isolated remote function onDiscussionPinned(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionPinned"] = true;
        }
    }

    isolated remote function onDiscussionReopened(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionReopened"] = true;
        }
    }

    isolated remote function onDiscussionTransferred(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionTransferred"] = true;
        }
    }

    isolated remote function onDiscussionUnanswered(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionUnanswered"] = true;
        }
    }

    isolated remote function onDiscussionUnlabeled(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionUnlabeled"] = true;
        }
    }

    isolated remote function onDiscussionUnlocked(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionUnlocked"] = true;
        }
    }

    isolated remote function onDiscussionUnpinned(DiscussionPayload payload) returns error? {
        lock {
            triggerFired["DiscussionService.onDiscussionUnpinned"] = true;
        }
    }
}

service DiscussionCommentService on triggerTestListener {
    isolated remote function onDiscussionCommentCreated(DiscussionCommentPayload payload) returns error? {
        lock {
            triggerFired["DiscussionCommentService.onDiscussionCommentCreated"] = true;
        }
    }

    isolated remote function onDiscussionCommentDeleted(DiscussionCommentPayload payload) returns error? {
        lock {
            triggerFired["DiscussionCommentService.onDiscussionCommentDeleted"] = true;
        }
    }

    isolated remote function onDiscussionCommentEdited(DiscussionCommentPayload payload) returns error? {
        lock {
            triggerFired["DiscussionCommentService.onDiscussionCommentEdited"] = true;
        }
    }
}

service LabelService on triggerTestListener {
    isolated remote function onLabelCreated(LabelPayload payload) returns error? {
        lock {
            triggerFired["LabelService.onLabelCreated"] = true;
        }
    }

    isolated remote function onLabelDeleted(LabelPayload payload) returns error? {
        lock {
            triggerFired["LabelService.onLabelDeleted"] = true;
        }
    }

    isolated remote function onLabelEdited(LabelPayload payload) returns error? {
        lock {
            triggerFired["LabelService.onLabelEdited"] = true;
        }
    }
}

service MilestoneService on triggerTestListener {
    isolated remote function onMilestoneClosed(MilestonePayload payload) returns error? {
        lock {
            triggerFired["MilestoneService.onMilestoneClosed"] = true;
        }
    }

    isolated remote function onMilestoneCreated(MilestonePayload payload) returns error? {
        lock {
            triggerFired["MilestoneService.onMilestoneCreated"] = true;
        }
    }

    isolated remote function onMilestoneDeleted(MilestonePayload payload) returns error? {
        lock {
            triggerFired["MilestoneService.onMilestoneDeleted"] = true;
        }
    }

    isolated remote function onMilestoneEdited(MilestonePayload payload) returns error? {
        lock {
            triggerFired["MilestoneService.onMilestoneEdited"] = true;
        }
    }

    isolated remote function onMilestoneOpened(MilestonePayload payload) returns error? {
        lock {
            triggerFired["MilestoneService.onMilestoneOpened"] = true;
        }
    }
}

service StatusService on triggerTestListener {
    isolated remote function onStatus(StatusPayload payload) returns error? {
        lock {
            triggerFired["StatusService.onStatus"] = true;
        }
        lock {
            boundPayloads["StatusService.onStatus"] = payload.toJson().clone();
        }
    }
}

service WorkflowDispatchService on triggerTestListener {
    isolated remote function onWorkflowDispatch(WorkflowDispatchPayload payload) returns error? {
        lock {
            triggerFired["WorkflowDispatchService.onWorkflowDispatch"] = true;
        }
    }
}

service PullRequestReviewThreadService on triggerTestListener {
    isolated remote function onPullRequestReviewThreadResolved(PullRequestReviewThreadPayload payload) returns error? {
        lock {
            triggerFired["PullRequestReviewThreadService.onPullRequestReviewThreadResolved"] = true;
        }
        lock {
            boundPayloads["PullRequestReviewThreadService.onPullRequestReviewThreadResolved"] = payload.toJson().clone();
        }
    }

    isolated remote function onPullRequestReviewThreadUnresolved(PullRequestReviewThreadPayload payload) returns error? {
        lock {
            triggerFired["PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved"] = true;
        }
        lock {
            boundPayloads["PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved"] = payload.toJson().clone();
        }
    }
}

service TeamService on triggerTestListener {
    isolated remote function onTeamAddedToRepository(TeamPayload payload) returns error? {
        lock {
            triggerFired["TeamService.onTeamAddedToRepository"] = true;
        }
    }

    isolated remote function onTeamCreated(TeamPayload payload) returns error? {
        lock {
            triggerFired["TeamService.onTeamCreated"] = true;
        }
    }

    isolated remote function onTeamDeleted(TeamPayload payload) returns error? {
        lock {
            triggerFired["TeamService.onTeamDeleted"] = true;
        }
    }

    isolated remote function onTeamEdited(TeamPayload payload) returns error? {
        lock {
            triggerFired["TeamService.onTeamEdited"] = true;
        }
    }

    isolated remote function onTeamRemovedFromRepository(TeamPayload payload) returns error? {
        lock {
            triggerFired["TeamService.onTeamRemovedFromRepository"] = true;
        }
    }
}

service OrganizationService on triggerTestListener {
    isolated remote function onOrganizationDeleted(OrganizationPayload payload) returns error? {
        lock {
            triggerFired["OrganizationService.onOrganizationDeleted"] = true;
        }
    }

    isolated remote function onOrganizationMemberAdded(OrganizationPayload payload) returns error? {
        lock {
            triggerFired["OrganizationService.onOrganizationMemberAdded"] = true;
        }
    }

    isolated remote function onOrganizationMemberInvited(OrganizationPayload payload) returns error? {
        lock {
            triggerFired["OrganizationService.onOrganizationMemberInvited"] = true;
        }
    }

    isolated remote function onOrganizationMemberRemoved(OrganizationPayload payload) returns error? {
        lock {
            triggerFired["OrganizationService.onOrganizationMemberRemoved"] = true;
        }
    }

    isolated remote function onOrganizationRenamed(OrganizationPayload payload) returns error? {
        lock {
            triggerFired["OrganizationService.onOrganizationRenamed"] = true;
        }
    }
}

service DeploymentProtectionRuleService on triggerTestListener {
    isolated remote function onDeploymentProtectionRule(DeploymentProtectionRulePayload payload) returns error? {
        lock {
            triggerFired["DeploymentProtectionRuleService.onDeploymentProtectionRule"] = true;
        }
        lock {
            boundPayloads["DeploymentProtectionRuleService.onDeploymentProtectionRule"] = payload.toJson().clone();
        }
    }
}

service DeploymentReviewService on triggerTestListener {
    isolated remote function onDeploymentReviewApproved(DeploymentReviewPayload payload) returns error? {
        lock {
            triggerFired["DeploymentReviewService.onDeploymentReviewApproved"] = true;
        }
        lock {
            boundPayloads["DeploymentReviewService.onDeploymentReviewApproved"] = payload.toJson().clone();
        }
    }

    isolated remote function onDeploymentReviewRejected(DeploymentReviewPayload payload) returns error? {
        lock {
            triggerFired["DeploymentReviewService.onDeploymentReviewRejected"] = true;
        }
        lock {
            boundPayloads["DeploymentReviewService.onDeploymentReviewRejected"] = payload.toJson().clone();
        }
    }

    isolated remote function onDeploymentReviewRequested(DeploymentReviewPayload payload) returns error? {
        lock {
            triggerFired["DeploymentReviewService.onDeploymentReviewRequested"] = true;
        }
        lock {
            boundPayloads["DeploymentReviewService.onDeploymentReviewRequested"] = payload.toJson().clone();
        }
    }
}

service InstallationTargetService on triggerTestListener {
    isolated remote function onInstallationTargetRenamed(InstallationTargetPayload payload) returns error? {
        lock {
            triggerFired["InstallationTargetService.onInstallationTargetRenamed"] = true;
        }
        lock {
            boundPayloads["InstallationTargetService.onInstallationTargetRenamed"] = payload.toJson().clone();
        }
    }
}

service IssueDependenciesService on triggerTestListener {
    isolated remote function onIssueDependenciesBlockedByAdded(IssueDependenciesPayload payload) returns error? {
        lock {
            triggerFired["IssueDependenciesService.onIssueDependenciesBlockedByAdded"] = true;
        }
        lock {
            boundPayloads["IssueDependenciesService.onIssueDependenciesBlockedByAdded"] = payload.toJson().clone();
        }
    }

    isolated remote function onIssueDependenciesBlockedByRemoved(IssueDependenciesPayload payload) returns error? {
        lock {
            triggerFired["IssueDependenciesService.onIssueDependenciesBlockedByRemoved"] = true;
        }
        lock {
            boundPayloads["IssueDependenciesService.onIssueDependenciesBlockedByRemoved"] = payload.toJson().clone();
        }
    }

    isolated remote function onIssueDependenciesBlockingAdded(IssueDependenciesPayload payload) returns error? {
        lock {
            triggerFired["IssueDependenciesService.onIssueDependenciesBlockingAdded"] = true;
        }
        lock {
            boundPayloads["IssueDependenciesService.onIssueDependenciesBlockingAdded"] = payload.toJson().clone();
        }
    }

    isolated remote function onIssueDependenciesBlockingRemoved(IssueDependenciesPayload payload) returns error? {
        lock {
            triggerFired["IssueDependenciesService.onIssueDependenciesBlockingRemoved"] = true;
        }
        lock {
            boundPayloads["IssueDependenciesService.onIssueDependenciesBlockingRemoved"] = payload.toJson().clone();
        }
    }
}

service MarketplacePurchaseService on triggerTestListener {
    isolated remote function onMarketplacePurchaseCancelled(MarketplacePurchasePayload payload) returns error? {
        lock {
            triggerFired["MarketplacePurchaseService.onMarketplacePurchaseCancelled"] = true;
        }
        lock {
            boundPayloads["MarketplacePurchaseService.onMarketplacePurchaseCancelled"] = payload.toJson().clone();
        }
    }

    isolated remote function onMarketplacePurchaseChanged(MarketplacePurchasePayload payload) returns error? {
        lock {
            triggerFired["MarketplacePurchaseService.onMarketplacePurchaseChanged"] = true;
        }
        lock {
            boundPayloads["MarketplacePurchaseService.onMarketplacePurchaseChanged"] = payload.toJson().clone();
        }
    }

    isolated remote function onMarketplacePurchasePendingChange(MarketplacePurchasePayload payload) returns error? {
        lock {
            triggerFired["MarketplacePurchaseService.onMarketplacePurchasePendingChange"] = true;
        }
        lock {
            boundPayloads["MarketplacePurchaseService.onMarketplacePurchasePendingChange"] = payload.toJson().clone();
        }
    }

    isolated remote function onMarketplacePurchasePendingChangeCancelled(MarketplacePurchasePayload payload) returns error? {
        lock {
            triggerFired["MarketplacePurchaseService.onMarketplacePurchasePendingChangeCancelled"] = true;
        }
        lock {
            boundPayloads["MarketplacePurchaseService.onMarketplacePurchasePendingChangeCancelled"] = payload.toJson().clone();
        }
    }

    isolated remote function onMarketplacePurchasePurchased(MarketplacePurchasePayload payload) returns error? {
        lock {
            triggerFired["MarketplacePurchaseService.onMarketplacePurchasePurchased"] = true;
        }
        lock {
            boundPayloads["MarketplacePurchaseService.onMarketplacePurchasePurchased"] = payload.toJson().clone();
        }
    }
}

service PersonalAccessTokenRequestService on triggerTestListener {
    isolated remote function onPersonalAccessTokenRequestApproved(PersonalAccessTokenRequestPayload payload) returns error? {
        lock {
            triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved"] = true;
        }
        lock {
            boundPayloads["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved"] = payload.toJson().clone();
        }
    }

    isolated remote function onPersonalAccessTokenRequestCancelled(PersonalAccessTokenRequestPayload payload) returns error? {
        lock {
            triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled"] = true;
        }
        lock {
            boundPayloads["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled"] = payload.toJson().clone();
        }
    }

    isolated remote function onPersonalAccessTokenRequestCreated(PersonalAccessTokenRequestPayload payload) returns error? {
        lock {
            triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated"] = true;
        }
        lock {
            boundPayloads["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onPersonalAccessTokenRequestDenied(PersonalAccessTokenRequestPayload payload) returns error? {
        lock {
            triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied"] = true;
        }
        lock {
            boundPayloads["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied"] = payload.toJson().clone();
        }
    }
}

service ProjectService on triggerTestListener {
    isolated remote function onProjectClosed(ProjectPayload payload) returns error? {
        lock {
            triggerFired["ProjectService.onProjectClosed"] = true;
        }
    }

    isolated remote function onProjectCreated(ProjectPayload payload) returns error? {
        lock {
            triggerFired["ProjectService.onProjectCreated"] = true;
        }
    }

    isolated remote function onProjectDeleted(ProjectPayload payload) returns error? {
        lock {
            triggerFired["ProjectService.onProjectDeleted"] = true;
        }
    }

    isolated remote function onProjectEdited(ProjectPayload payload) returns error? {
        lock {
            triggerFired["ProjectService.onProjectEdited"] = true;
        }
    }

    isolated remote function onProjectReopened(ProjectPayload payload) returns error? {
        lock {
            triggerFired["ProjectService.onProjectReopened"] = true;
        }
    }
}

service ProjectCardService on triggerTestListener {
    isolated remote function onProjectCardConverted(ProjectCardPayload payload) returns error? {
        lock {
            triggerFired["ProjectCardService.onProjectCardConverted"] = true;
        }
        lock {
            boundPayloads["ProjectCardService.onProjectCardConverted"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectCardCreated(ProjectCardPayload payload) returns error? {
        lock {
            triggerFired["ProjectCardService.onProjectCardCreated"] = true;
        }
        lock {
            boundPayloads["ProjectCardService.onProjectCardCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectCardDeleted(ProjectCardPayload payload) returns error? {
        lock {
            triggerFired["ProjectCardService.onProjectCardDeleted"] = true;
        }
        lock {
            boundPayloads["ProjectCardService.onProjectCardDeleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectCardEdited(ProjectCardPayload payload) returns error? {
        lock {
            triggerFired["ProjectCardService.onProjectCardEdited"] = true;
        }
        lock {
            boundPayloads["ProjectCardService.onProjectCardEdited"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectCardMoved(ProjectCardPayload payload) returns error? {
        lock {
            triggerFired["ProjectCardService.onProjectCardMoved"] = true;
        }
        lock {
            boundPayloads["ProjectCardService.onProjectCardMoved"] = payload.toJson().clone();
        }
    }
}

service ProjectColumnService on triggerTestListener {
    isolated remote function onProjectColumnCreated(ProjectColumnPayload payload) returns error? {
        lock {
            triggerFired["ProjectColumnService.onProjectColumnCreated"] = true;
        }
        lock {
            boundPayloads["ProjectColumnService.onProjectColumnCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectColumnDeleted(ProjectColumnPayload payload) returns error? {
        lock {
            triggerFired["ProjectColumnService.onProjectColumnDeleted"] = true;
        }
        lock {
            boundPayloads["ProjectColumnService.onProjectColumnDeleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectColumnEdited(ProjectColumnPayload payload) returns error? {
        lock {
            triggerFired["ProjectColumnService.onProjectColumnEdited"] = true;
        }
        lock {
            boundPayloads["ProjectColumnService.onProjectColumnEdited"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectColumnMoved(ProjectColumnPayload payload) returns error? {
        lock {
            triggerFired["ProjectColumnService.onProjectColumnMoved"] = true;
        }
        lock {
            boundPayloads["ProjectColumnService.onProjectColumnMoved"] = payload.toJson().clone();
        }
    }
}

service RepositoryImportService on triggerTestListener {
    isolated remote function onRepositoryImport(RepositoryImportPayload payload) returns error? {
        lock {
            triggerFired["RepositoryImportService.onRepositoryImport"] = true;
        }
    }
}

service SubIssuesService on triggerTestListener {
    isolated remote function onSubIssuesParentIssueAdded(SubIssuesPayload payload) returns error? {
        lock {
            triggerFired["SubIssuesService.onSubIssuesParentIssueAdded"] = true;
        }
        lock {
            boundPayloads["SubIssuesService.onSubIssuesParentIssueAdded"] = payload.toJson().clone();
        }
    }

    isolated remote function onSubIssuesParentIssueRemoved(SubIssuesPayload payload) returns error? {
        lock {
            triggerFired["SubIssuesService.onSubIssuesParentIssueRemoved"] = true;
        }
        lock {
            boundPayloads["SubIssuesService.onSubIssuesParentIssueRemoved"] = payload.toJson().clone();
        }
    }

    isolated remote function onSubIssuesSubIssueAdded(SubIssuesPayload payload) returns error? {
        lock {
            triggerFired["SubIssuesService.onSubIssuesSubIssueAdded"] = true;
        }
        lock {
            boundPayloads["SubIssuesService.onSubIssuesSubIssueAdded"] = payload.toJson().clone();
        }
    }

    isolated remote function onSubIssuesSubIssueRemoved(SubIssuesPayload payload) returns error? {
        lock {
            triggerFired["SubIssuesService.onSubIssuesSubIssueRemoved"] = true;
        }
        lock {
            boundPayloads["SubIssuesService.onSubIssuesSubIssueRemoved"] = payload.toJson().clone();
        }
    }
}

service PageBuildService on triggerTestListener {
    isolated remote function onPageBuild(PageBuildPayload payload) returns error? {
        lock {
            triggerFired["PageBuildService.onPageBuild"] = true;
        }
    }
}

service TeamAddService on triggerTestListener {
    isolated remote function onTeamAdd(TeamAddPayload payload) returns error? {
        lock {
            triggerFired["TeamAddService.onTeamAdd"] = true;
        }
    }
}

service SponsorshipService on triggerTestListener {
    isolated remote function onSponsorshipCancelled(SponsorshipPayload payload) returns error? {
        lock {
            triggerFired["SponsorshipService.onSponsorshipCancelled"] = true;
        }
        lock {
            boundPayloads["SponsorshipService.onSponsorshipCancelled"] = payload.toJson().clone();
        }
    }

    isolated remote function onSponsorshipCreated(SponsorshipPayload payload) returns error? {
        lock {
            triggerFired["SponsorshipService.onSponsorshipCreated"] = true;
        }
        lock {
            boundPayloads["SponsorshipService.onSponsorshipCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onSponsorshipEdited(SponsorshipPayload payload) returns error? {
        lock {
            triggerFired["SponsorshipService.onSponsorshipEdited"] = true;
        }
        lock {
            boundPayloads["SponsorshipService.onSponsorshipEdited"] = payload.toJson().clone();
        }
    }

    isolated remote function onSponsorshipPendingCancellation(SponsorshipPayload payload) returns error? {
        lock {
            triggerFired["SponsorshipService.onSponsorshipPendingCancellation"] = true;
        }
        lock {
            boundPayloads["SponsorshipService.onSponsorshipPendingCancellation"] = payload.toJson().clone();
        }
    }

    isolated remote function onSponsorshipPendingTierChange(SponsorshipPayload payload) returns error? {
        lock {
            triggerFired["SponsorshipService.onSponsorshipPendingTierChange"] = true;
        }
        lock {
            boundPayloads["SponsorshipService.onSponsorshipPendingTierChange"] = payload.toJson().clone();
        }
    }

    isolated remote function onSponsorshipTierChanged(SponsorshipPayload payload) returns error? {
        lock {
            triggerFired["SponsorshipService.onSponsorshipTierChanged"] = true;
        }
        lock {
            boundPayloads["SponsorshipService.onSponsorshipTierChanged"] = payload.toJson().clone();
        }
    }
}

service SecurityAndAnalysisService on triggerTestListener {
    isolated remote function onSecurityAndAnalysis(SecurityAndAnalysisPayload payload) returns error? {
        lock {
            triggerFired["SecurityAndAnalysisService.onSecurityAndAnalysis"] = true;
        }
    }
}

service BranchProtectionConfigurationService on triggerTestListener {
    isolated remote function onBranchProtectionConfigurationDisabled(BranchProtectionConfigurationPayload payload) returns error? {
        lock {
            triggerFired["BranchProtectionConfigurationService.onBranchProtectionConfigurationDisabled"] = true;
        }
    }

    isolated remote function onBranchProtectionConfigurationEnabled(BranchProtectionConfigurationPayload payload) returns error? {
        lock {
            triggerFired["BranchProtectionConfigurationService.onBranchProtectionConfigurationEnabled"] = true;
        }
    }
}

service CustomPropertyService on triggerTestListener {
    isolated remote function onCustomPropertyCreated(CustomPropertyPayload payload) returns error? {
        lock {
            triggerFired["CustomPropertyService.onCustomPropertyCreated"] = true;
        }
    }

    isolated remote function onCustomPropertyDeleted(CustomPropertyPayload payload) returns error? {
        lock {
            triggerFired["CustomPropertyService.onCustomPropertyDeleted"] = true;
        }
    }

    isolated remote function onCustomPropertyPromoteToEnterprise(CustomPropertyPayload payload) returns error? {
        lock {
            triggerFired["CustomPropertyService.onCustomPropertyPromoteToEnterprise"] = true;
        }
    }

    isolated remote function onCustomPropertyUpdated(CustomPropertyPayload payload) returns error? {
        lock {
            triggerFired["CustomPropertyService.onCustomPropertyUpdated"] = true;
        }
    }
}

service CustomPropertyValuesService on triggerTestListener {
    isolated remote function onCustomPropertyValuesUpdated(CustomPropertyValuesPayload payload) returns error? {
        lock {
            triggerFired["CustomPropertyValuesService.onCustomPropertyValuesUpdated"] = true;
        }
        lock {
            boundPayloads["CustomPropertyValuesService.onCustomPropertyValuesUpdated"] = payload.toJson().clone();
        }
    }
}

service ProjectsV2itemService on triggerTestListener {
    isolated remote function onProjectsV2ItemArchived('ProjectsV2ItemPayload payload) returns error? {
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemArchived"] = true;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemArchived"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectsV2ItemConverted('ProjectsV2ItemPayload payload) returns error? {
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemConverted"] = true;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemConverted"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectsV2ItemCreated('ProjectsV2ItemPayload payload) returns error? {
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemCreated"] = true;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectsV2ItemDeleted('ProjectsV2ItemPayload payload) returns error? {
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemDeleted"] = true;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemDeleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectsV2ItemEdited('ProjectsV2ItemPayload payload) returns error? {
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemEdited"] = true;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemEdited"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectsV2ItemReordered('ProjectsV2ItemPayload payload) returns error? {
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemReordered"] = true;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemReordered"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectsV2ItemRestored('ProjectsV2ItemPayload payload) returns error? {
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemRestored"] = true;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemRestored"] = payload.toJson().clone();
        }
    }
}

service ProjectsV2statusUpdateService on triggerTestListener {
    isolated remote function onProjectsV2StatusUpdateCreated('ProjectsV2StatusUpdatePayload payload) returns error? {
        lock {
            triggerFired["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated"] = true;
        }
        lock {
            boundPayloads["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectsV2StatusUpdateDeleted('ProjectsV2StatusUpdatePayload payload) returns error? {
        lock {
            triggerFired["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted"] = true;
        }
        lock {
            boundPayloads["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectsV2StatusUpdateEdited('ProjectsV2StatusUpdatePayload payload) returns error? {
        lock {
            triggerFired["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited"] = true;
        }
        lock {
            boundPayloads["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited"] = payload.toJson().clone();
        }
    }
}

service RegistryPackageService on triggerTestListener {
    isolated remote function onRegistryPackagePublished(RegistryPackagePayload payload) returns error? {
        lock {
            triggerFired["RegistryPackageService.onRegistryPackagePublished"] = true;
        }
        lock {
            boundPayloads["RegistryPackageService.onRegistryPackagePublished"] = payload.toJson().clone();
        }
    }

    isolated remote function onRegistryPackageUpdated(RegistryPackagePayload payload) returns error? {
        lock {
            triggerFired["RegistryPackageService.onRegistryPackageUpdated"] = true;
        }
        lock {
            boundPayloads["RegistryPackageService.onRegistryPackageUpdated"] = payload.toJson().clone();
        }
    }
}

service RepositoryRulesetService on triggerTestListener {
    isolated remote function onRepositoryRulesetCreated(RepositoryRulesetPayload payload) returns error? {
        lock {
            triggerFired["RepositoryRulesetService.onRepositoryRulesetCreated"] = true;
        }
        lock {
            boundPayloads["RepositoryRulesetService.onRepositoryRulesetCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onRepositoryRulesetDeleted(RepositoryRulesetPayload payload) returns error? {
        lock {
            triggerFired["RepositoryRulesetService.onRepositoryRulesetDeleted"] = true;
        }
        lock {
            boundPayloads["RepositoryRulesetService.onRepositoryRulesetDeleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onRepositoryRulesetEdited(RepositoryRulesetPayload payload) returns error? {
        lock {
            triggerFired["RepositoryRulesetService.onRepositoryRulesetEdited"] = true;
        }
        lock {
            boundPayloads["RepositoryRulesetService.onRepositoryRulesetEdited"] = payload.toJson().clone();
        }
    }
}

service RepositoryVulnerabilityAlertService on triggerTestListener {
    isolated remote function onRepositoryVulnerabilityAlertCreate(RepositoryVulnerabilityAlertPayload payload) returns error? {
        lock {
            triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertCreate"] = true;
        }
    }

    isolated remote function onRepositoryVulnerabilityAlertDismiss(RepositoryVulnerabilityAlertPayload payload) returns error? {
        lock {
            triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertDismiss"] = true;
        }
    }

    isolated remote function onRepositoryVulnerabilityAlertReopen(RepositoryVulnerabilityAlertPayload payload) returns error? {
        lock {
            triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertReopen"] = true;
        }
    }

    isolated remote function onRepositoryVulnerabilityAlertResolve(RepositoryVulnerabilityAlertPayload payload) returns error? {
        lock {
            triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertResolve"] = true;
        }
    }
}

service SecretScanningAlertLocationService on triggerTestListener {
    isolated remote function onSecretScanningAlertLocation(SecretScanningAlertLocationPayload payload) returns error? {
        lock {
            triggerFired["SecretScanningAlertLocationService.onSecretScanningAlertLocation"] = true;
        }
    }
}

service SecretScanningScanService on triggerTestListener {
    isolated remote function onSecretScanningScan(SecretScanningScanPayload payload) returns error? {
        lock {
            triggerFired["SecretScanningScanService.onSecretScanningScan"] = true;
        }
        lock {
            boundPayloads["SecretScanningScanService.onSecretScanningScan"] = payload.toJson().clone();
        }
    }
}

service BranchProtectionRuleService on triggerTestListener {
    isolated remote function onBranchProtectionRuleCreated(BranchProtectionRulePayload payload) returns error? {
        lock {
            triggerFired["BranchProtectionRuleService.onBranchProtectionRuleCreated"] = true;
        }
    }

    isolated remote function onBranchProtectionRuleDeleted(BranchProtectionRulePayload payload) returns error? {
        lock {
            triggerFired["BranchProtectionRuleService.onBranchProtectionRuleDeleted"] = true;
        }
    }

    isolated remote function onBranchProtectionRuleEdited(BranchProtectionRulePayload payload) returns error? {
        lock {
            triggerFired["BranchProtectionRuleService.onBranchProtectionRuleEdited"] = true;
        }
    }
}

service CodeScanningAlertService on triggerTestListener {
    isolated remote function onCodeScanningAlertAppearedInBranch(CodeScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertAppearedInBranch"] = true;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertAppearedInBranch"] = payload.toJson().clone();
        }
    }

    isolated remote function onCodeScanningAlertClosedByUser(CodeScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertClosedByUser"] = true;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertClosedByUser"] = payload.toJson().clone();
        }
    }

    isolated remote function onCodeScanningAlertCreated(CodeScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertCreated"] = true;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertCreated"] = payload.toJson().clone();
        }
    }

    isolated remote function onCodeScanningAlertFixed(CodeScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertFixed"] = true;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertFixed"] = payload.toJson().clone();
        }
    }

    isolated remote function onCodeScanningAlertReopened(CodeScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertReopened"] = true;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertReopened"] = payload.toJson().clone();
        }
    }

    isolated remote function onCodeScanningAlertReopenedByUser(CodeScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertReopenedByUser"] = true;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertReopenedByUser"] = payload.toJson().clone();
        }
    }

    isolated remote function onCodeScanningAlertUpdatedAssignment(CodeScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment"] = true;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment"] = payload.toJson().clone();
        }
    }
}

service DeployKeyService on triggerTestListener {
    isolated remote function onDeployKeyCreated(DeployKeyPayload payload) returns error? {
        lock {
            triggerFired["DeployKeyService.onDeployKeyCreated"] = true;
        }
    }

    isolated remote function onDeployKeyDeleted(DeployKeyPayload payload) returns error? {
        lock {
            triggerFired["DeployKeyService.onDeployKeyDeleted"] = true;
        }
    }
}

service GithubAppAuthorizationService on triggerTestListener {
    isolated remote function onGithubAppAuthorizationRevoked(GithubAppAuthorizationPayload payload) returns error? {
        lock {
            triggerFired["GithubAppAuthorizationService.onGithubAppAuthorizationRevoked"] = true;
        }
    }
}

service MetaService on triggerTestListener {
    isolated remote function onMetaDeleted(MetaPayload payload) returns error? {
        lock {
            triggerFired["MetaService.onMetaDeleted"] = true;
        }
        lock {
            boundPayloads["MetaService.onMetaDeleted"] = payload.toJson().clone();
        }
    }
}

service OrgBlockService on triggerTestListener {
    isolated remote function onOrgBlockBlocked(OrgBlockPayload payload) returns error? {
        lock {
            triggerFired["OrgBlockService.onOrgBlockBlocked"] = true;
        }
        lock {
            boundPayloads["OrgBlockService.onOrgBlockBlocked"] = payload.toJson().clone();
        }
    }

    isolated remote function onOrgBlockUnblocked(OrgBlockPayload payload) returns error? {
        lock {
            triggerFired["OrgBlockService.onOrgBlockUnblocked"] = true;
        }
        lock {
            boundPayloads["OrgBlockService.onOrgBlockUnblocked"] = payload.toJson().clone();
        }
    }
}

service PackageService on triggerTestListener {
    isolated remote function onPackagePublished(PackagePayload payload) returns error? {
        lock {
            triggerFired["PackageService.onPackagePublished"] = true;
        }
    }

    isolated remote function onPackageUpdated(PackagePayload payload) returns error? {
        lock {
            triggerFired["PackageService.onPackageUpdated"] = true;
        }
    }
}

service ProjectsV2Service on triggerTestListener {
    isolated remote function onProjectsV2Closed('ProjectsV2Payload payload) returns error? {
        lock {
            triggerFired["ProjectsV2Service.onProjectsV2Closed"] = true;
        }
        lock {
            boundPayloads["ProjectsV2Service.onProjectsV2Closed"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectsV2Created('ProjectsV2Payload payload) returns error? {
        lock {
            triggerFired["ProjectsV2Service.onProjectsV2Created"] = true;
        }
        lock {
            boundPayloads["ProjectsV2Service.onProjectsV2Created"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectsV2Deleted('ProjectsV2Payload payload) returns error? {
        lock {
            triggerFired["ProjectsV2Service.onProjectsV2Deleted"] = true;
        }
        lock {
            boundPayloads["ProjectsV2Service.onProjectsV2Deleted"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectsV2Edited('ProjectsV2Payload payload) returns error? {
        lock {
            triggerFired["ProjectsV2Service.onProjectsV2Edited"] = true;
        }
        lock {
            boundPayloads["ProjectsV2Service.onProjectsV2Edited"] = payload.toJson().clone();
        }
    }

    isolated remote function onProjectsV2Reopened('ProjectsV2Payload payload) returns error? {
        lock {
            triggerFired["ProjectsV2Service.onProjectsV2Reopened"] = true;
        }
        lock {
            boundPayloads["ProjectsV2Service.onProjectsV2Reopened"] = payload.toJson().clone();
        }
    }
}

service RepositoryAdvisoryService on triggerTestListener {
    isolated remote function onRepositoryAdvisoryPublished(RepositoryAdvisoryPayload payload) returns error? {
        lock {
            triggerFired["RepositoryAdvisoryService.onRepositoryAdvisoryPublished"] = true;
        }
        lock {
            boundPayloads["RepositoryAdvisoryService.onRepositoryAdvisoryPublished"] = payload.toJson().clone();
        }
    }

    isolated remote function onRepositoryAdvisoryReported(RepositoryAdvisoryPayload payload) returns error? {
        lock {
            triggerFired["RepositoryAdvisoryService.onRepositoryAdvisoryReported"] = true;
        }
        lock {
            boundPayloads["RepositoryAdvisoryService.onRepositoryAdvisoryReported"] = payload.toJson().clone();
        }
    }
}

service SecurityAdvisoryService on triggerTestListener {
    isolated remote function onSecurityAdvisoryPublished(SecurityAdvisoryPayload payload) returns error? {
        lock {
            triggerFired["SecurityAdvisoryService.onSecurityAdvisoryPublished"] = true;
        }
        lock {
            boundPayloads["SecurityAdvisoryService.onSecurityAdvisoryPublished"] = payload.toJson().clone();
        }
    }

    isolated remote function onSecurityAdvisoryUpdated(SecurityAdvisoryPayload payload) returns error? {
        lock {
            triggerFired["SecurityAdvisoryService.onSecurityAdvisoryUpdated"] = true;
        }
        lock {
            boundPayloads["SecurityAdvisoryService.onSecurityAdvisoryUpdated"] = payload.toJson().clone();
        }
    }

    isolated remote function onSecurityAdvisoryWithdrawn(SecurityAdvisoryPayload payload) returns error? {
        lock {
            triggerFired["SecurityAdvisoryService.onSecurityAdvisoryWithdrawn"] = true;
        }
        lock {
            boundPayloads["SecurityAdvisoryService.onSecurityAdvisoryWithdrawn"] = payload.toJson().clone();
        }
    }
}

service CommitCommentService on triggerTestListener {
    isolated remote function onCommitCommentCreated(CommitCommentPayload payload) returns error? {
        lock {
            triggerFired["CommitCommentService.onCommitCommentCreated"] = true;
        }
    }
}

service DependabotAlertService on triggerTestListener {
    isolated remote function onDependabotAlertAssigneesChanged(DependabotAlertPayload payload) returns error? {
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertAssigneesChanged"] = true;
        }
    }

    isolated remote function onDependabotAlertAutoDismissed(DependabotAlertPayload payload) returns error? {
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertAutoDismissed"] = true;
        }
    }

    isolated remote function onDependabotAlertAutoReopened(DependabotAlertPayload payload) returns error? {
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertAutoReopened"] = true;
        }
    }

    isolated remote function onDependabotAlertCreated(DependabotAlertPayload payload) returns error? {
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertCreated"] = true;
        }
    }

    isolated remote function onDependabotAlertDismissed(DependabotAlertPayload payload) returns error? {
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertDismissed"] = true;
        }
    }

    isolated remote function onDependabotAlertFixed(DependabotAlertPayload payload) returns error? {
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertFixed"] = true;
        }
    }

    isolated remote function onDependabotAlertReintroduced(DependabotAlertPayload payload) returns error? {
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertReintroduced"] = true;
        }
    }

    isolated remote function onDependabotAlertReopened(DependabotAlertPayload payload) returns error? {
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertReopened"] = true;
        }
    }
}

service GollumService on triggerTestListener {
    isolated remote function onGollum(GollumPayload payload) returns error? {
        lock {
            triggerFired["GollumService.onGollum"] = true;
        }
    }
}

service InstallationService on triggerTestListener {
    isolated remote function onInstallationCreated(InstallationPayload payload) returns error? {
        lock {
            triggerFired["InstallationService.onInstallationCreated"] = true;
        }
    }

    isolated remote function onInstallationDeleted(InstallationPayload payload) returns error? {
        lock {
            triggerFired["InstallationService.onInstallationDeleted"] = true;
        }
    }

    isolated remote function onInstallationNewPermissionsAccepted(InstallationPayload payload) returns error? {
        lock {
            triggerFired["InstallationService.onInstallationNewPermissionsAccepted"] = true;
        }
    }

    isolated remote function onInstallationSuspend(InstallationPayload payload) returns error? {
        lock {
            triggerFired["InstallationService.onInstallationSuspend"] = true;
        }
    }

    isolated remote function onInstallationUnsuspend(InstallationPayload payload) returns error? {
        lock {
            triggerFired["InstallationService.onInstallationUnsuspend"] = true;
        }
    }
}

service InstallationRepositoriesService on triggerTestListener {
    isolated remote function onInstallationRepositoriesAdded(InstallationRepositoriesPayload payload) returns error? {
        lock {
            triggerFired["InstallationRepositoriesService.onInstallationRepositoriesAdded"] = true;
        }
        lock {
            boundPayloads["InstallationRepositoriesService.onInstallationRepositoriesAdded"] = payload.toJson().clone();
        }
    }

    isolated remote function onInstallationRepositoriesRemoved(InstallationRepositoriesPayload payload) returns error? {
        lock {
            triggerFired["InstallationRepositoriesService.onInstallationRepositoriesRemoved"] = true;
        }
        lock {
            boundPayloads["InstallationRepositoriesService.onInstallationRepositoriesRemoved"] = payload.toJson().clone();
        }
    }
}

service MembershipService on triggerTestListener {
    isolated remote function onMembershipAdded(MembershipPayload payload) returns error? {
        lock {
            triggerFired["MembershipService.onMembershipAdded"] = true;
        }
    }

    isolated remote function onMembershipRemoved(MembershipPayload payload) returns error? {
        lock {
            triggerFired["MembershipService.onMembershipRemoved"] = true;
        }
    }
}

service MergeGroupService on triggerTestListener {
    isolated remote function onMergeGroupChecksRequested(MergeGroupPayload payload) returns error? {
        lock {
            triggerFired["MergeGroupService.onMergeGroupChecksRequested"] = true;
        }
        lock {
            boundPayloads["MergeGroupService.onMergeGroupChecksRequested"] = payload.toJson().clone();
        }
    }

    isolated remote function onMergeGroupDestroyed(MergeGroupPayload payload) returns error? {
        lock {
            triggerFired["MergeGroupService.onMergeGroupDestroyed"] = true;
        }
        lock {
            boundPayloads["MergeGroupService.onMergeGroupDestroyed"] = payload.toJson().clone();
        }
    }
}

service PublicService on triggerTestListener {
    isolated remote function onPublic(PublicPayload payload) returns error? {
        lock {
            triggerFired["PublicService.onPublic"] = true;
        }
    }
}

service RepositoryDispatchService on triggerTestListener {
    isolated remote function onRepositoryDispatch(RepositoryDispatchPayload payload) returns error? {
        lock {
            triggerFired["RepositoryDispatchService.onRepositoryDispatch"] = true;
        }
        lock {
            boundPayloads["RepositoryDispatchService.onRepositoryDispatch"] = payload.toJson().clone();
        }
    }
}

service SecretScanningAlertService on triggerTestListener {
    isolated remote function onSecretScanningAlertAssigned(SecretScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertAssigned"] = true;
        }
    }

    isolated remote function onSecretScanningAlertCreated(SecretScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertCreated"] = true;
        }
    }

    isolated remote function onSecretScanningAlertPubliclyLeaked(SecretScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertPubliclyLeaked"] = true;
        }
    }

    isolated remote function onSecretScanningAlertReopened(SecretScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertReopened"] = true;
        }
    }

    isolated remote function onSecretScanningAlertResolved(SecretScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertResolved"] = true;
        }
    }

    isolated remote function onSecretScanningAlertUnassigned(SecretScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertUnassigned"] = true;
        }
    }

    isolated remote function onSecretScanningAlertValidated(SecretScanningAlertPayload payload) returns error? {
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertValidated"] = true;
        }
    }
}

isolated function sendSignedTriggerWebhook(string headerValue, string eventIdentifier) returns http:Response|error {
    byte[] body = check io:fileReadBytes(string `${TRIGGER_PAYLOAD_DIR}/${eventIdentifier}.json`);
    string bodyText = check string:fromBytes(body);
    string payloadToHash = string `${bodyText}`;
    byte[] computedDigest = check crypto:hmacSha256(payloadToHash.toBytes(), TRIGGER_TEST_SECRET.toBytes());
    string computedSignature = computedDigest.toBase16();
    map<string> headers = {
        "X-GitHub-Event": headerValue,
        "X-Hub-Signature-256": string `sha256=${computedSignature}`
    };
    return triggerClient->post("/", body, headers, "application/json");
}

function waitForDispatch(string trackerKey) returns boolean {
    foreach int i in 0 ..< 20 {
        lock {
            if triggerFired[trackerKey] ?: false {
                return true;
            }
        }
        runtime:sleep(0.05);
    }
    return false;
}

function boundPayloadOf(string trackerKey) returns map<json> {
    lock {
        json payload = boundPayloads[trackerKey] ?: {};
        return payload is map<json> ? payload.clone() : {};
    }
}

@test:Config {}
function testPingDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("ping", "ping");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PingService.onPing"), "PingService.onPing should have fired");
    map<json> bound = boundPayloadOf("PingService.onPing");
    test:assertFalse(bound.hasKey("hook_id"), "'hook_id' should have bound to its camelCase field on PingPayload, not stayed a raw key");
}

@test:Config {}
function testPushDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("push", "push");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PushService.onPush"), "PushService.onPush should have fired");
    map<json> bound = boundPayloadOf("PushService.onPush");
    test:assertFalse(bound.hasKey("base_ref"), "'base_ref' should have bound to its camelCase field on PushPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("head_commit"), "'head_commit' should have bound to its camelCase field on PushPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestAssignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_assigned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestAssigned"), "PullRequestService.onPullRequestAssigned should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestAssigned");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestAutoMergeDisabledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_auto_merge_disabled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestAutoMergeDisabled"), "PullRequestService.onPullRequestAutoMergeDisabled should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestAutoMergeDisabled");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestAutoMergeEnabledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_auto_merge_enabled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestAutoMergeEnabled"), "PullRequestService.onPullRequestAutoMergeEnabled should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestAutoMergeEnabled");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_closed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestClosed"), "PullRequestService.onPullRequestClosed should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestClosed");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestConvertedToDraftDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_converted_to_draft");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestConvertedToDraft"), "PullRequestService.onPullRequestConvertedToDraft should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestConvertedToDraft");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestDemilestonedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_demilestoned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestDemilestoned"), "PullRequestService.onPullRequestDemilestoned should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestDemilestoned");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestDequeuedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_dequeued");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestDequeued"), "PullRequestService.onPullRequestDequeued should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestDequeued");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestEdited"), "PullRequestService.onPullRequestEdited should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestEdited");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestEnqueuedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_enqueued");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestEnqueued"), "PullRequestService.onPullRequestEnqueued should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestEnqueued");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestLabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_labeled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestLabeled"), "PullRequestService.onPullRequestLabeled should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestLabeled");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestLockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_locked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestLocked"), "PullRequestService.onPullRequestLocked should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestLocked");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestMilestonedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_milestoned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestMilestoned"), "PullRequestService.onPullRequestMilestoned should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestMilestoned");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestOpenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_opened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestOpened"), "PullRequestService.onPullRequestOpened should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestOpened");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReadyForReviewDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_ready_for_review");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestReadyForReview"), "PullRequestService.onPullRequestReadyForReview should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestReadyForReview");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestReopened"), "PullRequestService.onPullRequestReopened should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestReopened");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewRequestRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_review_request_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestReviewRequestRemoved"), "PullRequestService.onPullRequestReviewRequestRemoved should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestReviewRequestRemoved");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_review_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestReviewRequested"), "PullRequestService.onPullRequestReviewRequested should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestReviewRequested");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestSynchronizeDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_synchronize");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestSynchronize"), "PullRequestService.onPullRequestSynchronize should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestSynchronize");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestUnassignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_unassigned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestUnassigned"), "PullRequestService.onPullRequestUnassigned should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestUnassigned");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestUnlabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_unlabeled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestUnlabeled"), "PullRequestService.onPullRequestUnlabeled should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestUnlabeled");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestUnlockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_unlocked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestUnlocked"), "PullRequestService.onPullRequestUnlocked should have fired");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestUnlocked");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testIssuesAssignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_assigned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesAssigned"), "IssuesService.onIssuesAssigned should have fired");
}

@test:Config {}
function testIssuesClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_closed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesClosed"), "IssuesService.onIssuesClosed should have fired");
}

@test:Config {}
function testIssuesDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesDeleted"), "IssuesService.onIssuesDeleted should have fired");
}

@test:Config {}
function testIssuesDemilestonedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_demilestoned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesDemilestoned"), "IssuesService.onIssuesDemilestoned should have fired");
}

@test:Config {}
function testIssuesEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesEdited"), "IssuesService.onIssuesEdited should have fired");
}

@test:Config {}
function testIssuesLabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_labeled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesLabeled"), "IssuesService.onIssuesLabeled should have fired");
}

@test:Config {}
function testIssuesLockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_locked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesLocked"), "IssuesService.onIssuesLocked should have fired");
}

@test:Config {}
function testIssuesMilestonedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_milestoned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesMilestoned"), "IssuesService.onIssuesMilestoned should have fired");
}

@test:Config {}
function testIssuesOpenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_opened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesOpened"), "IssuesService.onIssuesOpened should have fired");
}

@test:Config {}
function testIssuesPinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_pinned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesPinned"), "IssuesService.onIssuesPinned should have fired");
}

@test:Config {}
function testIssuesReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesReopened"), "IssuesService.onIssuesReopened should have fired");
}

@test:Config {}
function testIssuesTransferredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_transferred");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesTransferred"), "IssuesService.onIssuesTransferred should have fired");
}

@test:Config {}
function testIssuesTypedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_typed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesTyped"), "IssuesService.onIssuesTyped should have fired");
}

@test:Config {}
function testIssuesUnassignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_unassigned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesUnassigned"), "IssuesService.onIssuesUnassigned should have fired");
}

@test:Config {}
function testIssuesUnlabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_unlabeled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesUnlabeled"), "IssuesService.onIssuesUnlabeled should have fired");
}

@test:Config {}
function testIssuesUnlockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_unlocked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesUnlocked"), "IssuesService.onIssuesUnlocked should have fired");
}

@test:Config {}
function testIssuesUnpinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_unpinned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesUnpinned"), "IssuesService.onIssuesUnpinned should have fired");
}

@test:Config {}
function testIssuesUntypedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_untyped");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesUntyped"), "IssuesService.onIssuesUntyped should have fired");
}

@test:Config {}
function testReleaseCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleaseCreated"), "ReleaseService.onReleaseCreated should have fired");
}

@test:Config {}
function testReleaseDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleaseDeleted"), "ReleaseService.onReleaseDeleted should have fired");
}

@test:Config {}
function testReleaseEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleaseEdited"), "ReleaseService.onReleaseEdited should have fired");
}

@test:Config {}
function testReleasePrereleasedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_prereleased");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleasePrereleased"), "ReleaseService.onReleasePrereleased should have fired");
}

@test:Config {}
function testReleasePublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_published");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleasePublished"), "ReleaseService.onReleasePublished should have fired");
}

@test:Config {}
function testReleaseReleasedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_released");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleaseReleased"), "ReleaseService.onReleaseReleased should have fired");
}

@test:Config {}
function testReleaseUnpublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_unpublished");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleaseUnpublished"), "ReleaseService.onReleaseUnpublished should have fired");
}

@test:Config {}
function testIssueCommentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueCommentService.onIssueCommentCreated"), "IssueCommentService.onIssueCommentCreated should have fired");
}

@test:Config {}
function testIssueCommentDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueCommentService.onIssueCommentDeleted"), "IssueCommentService.onIssueCommentDeleted should have fired");
}

@test:Config {}
function testIssueCommentEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueCommentService.onIssueCommentEdited"), "IssueCommentService.onIssueCommentEdited should have fired");
}

@test:Config {}
function testIssueCommentPinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_pinned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueCommentService.onIssueCommentPinned"), "IssueCommentService.onIssueCommentPinned should have fired");
}

@test:Config {}
function testIssueCommentUnpinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_unpinned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueCommentService.onIssueCommentUnpinned"), "IssueCommentService.onIssueCommentUnpinned should have fired");
}

@test:Config {}
function testPullRequestReviewDismissedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review", "pull_request_review_dismissed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewService.onPullRequestReviewDismissed"), "PullRequestReviewService.onPullRequestReviewDismissed should have fired");
    map<json> bound = boundPayloadOf("PullRequestReviewService.onPullRequestReviewDismissed");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review", "pull_request_review_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewService.onPullRequestReviewEdited"), "PullRequestReviewService.onPullRequestReviewEdited should have fired");
    map<json> bound = boundPayloadOf("PullRequestReviewService.onPullRequestReviewEdited");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewSubmittedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review", "pull_request_review_submitted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewService.onPullRequestReviewSubmitted"), "PullRequestReviewService.onPullRequestReviewSubmitted should have fired");
    map<json> bound = boundPayloadOf("PullRequestReviewService.onPullRequestReviewSubmitted");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewCommentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_comment", "pull_request_review_comment_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewCommentService.onPullRequestReviewCommentCreated"), "PullRequestReviewCommentService.onPullRequestReviewCommentCreated should have fired");
    map<json> bound = boundPayloadOf("PullRequestReviewCommentService.onPullRequestReviewCommentCreated");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewCommentPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewCommentDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_comment", "pull_request_review_comment_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewCommentService.onPullRequestReviewCommentDeleted"), "PullRequestReviewCommentService.onPullRequestReviewCommentDeleted should have fired");
    map<json> bound = boundPayloadOf("PullRequestReviewCommentService.onPullRequestReviewCommentDeleted");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewCommentPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewCommentEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_comment", "pull_request_review_comment_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewCommentService.onPullRequestReviewCommentEdited"), "PullRequestReviewCommentService.onPullRequestReviewCommentEdited should have fired");
    map<json> bound = boundPayloadOf("PullRequestReviewCommentService.onPullRequestReviewCommentEdited");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewCommentPayload, not stayed a raw key");
}

@test:Config {}
function testCreateDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("create", "create");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CreateService.onCreate"), "CreateService.onCreate should have fired");
    map<json> bound = boundPayloadOf("CreateService.onCreate");
    test:assertFalse(bound.hasKey("ref_type"), "'ref_type' should have bound to its camelCase field on CreatePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("master_branch"), "'master_branch' should have bound to its camelCase field on CreatePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("pusher_type"), "'pusher_type' should have bound to its camelCase field on CreatePayload, not stayed a raw key");
}

@test:Config {}
function testDeleteDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("delete", "delete");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeleteService.onDelete"), "DeleteService.onDelete should have fired");
    map<json> bound = boundPayloadOf("DeleteService.onDelete");
    test:assertFalse(bound.hasKey("ref_type"), "'ref_type' should have bound to its camelCase field on DeletePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("pusher_type"), "'pusher_type' should have bound to its camelCase field on DeletePayload, not stayed a raw key");
}

@test:Config {}
function testForkDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("fork", "fork");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ForkService.onFork"), "ForkService.onFork should have fired");
}

@test:Config {}
function testStarCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("star", "star_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("StarService.onStarCreated"), "StarService.onStarCreated should have fired");
    map<json> bound = boundPayloadOf("StarService.onStarCreated");
    test:assertFalse(bound.hasKey("starred_at"), "'starred_at' should have bound to its camelCase field on StarPayload, not stayed a raw key");
}

@test:Config {}
function testStarDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("star", "star_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("StarService.onStarDeleted"), "StarService.onStarDeleted should have fired");
    map<json> bound = boundPayloadOf("StarService.onStarDeleted");
    test:assertFalse(bound.hasKey("starred_at"), "'starred_at' should have bound to its camelCase field on StarPayload, not stayed a raw key");
}

@test:Config {}
function testWatchStartedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("watch", "watch_started");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WatchService.onWatchStarted"), "WatchService.onWatchStarted should have fired");
}

@test:Config {}
function testCheckRunCompletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_run", "check_run_completed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckRunService.onCheckRunCompleted"), "CheckRunService.onCheckRunCompleted should have fired");
    map<json> bound = boundPayloadOf("CheckRunService.onCheckRunCompleted");
    test:assertFalse(bound.hasKey("check_run"), "'check_run' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_action"), "'requested_action' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
}

@test:Config {}
function testCheckRunCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_run", "check_run_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckRunService.onCheckRunCreated"), "CheckRunService.onCheckRunCreated should have fired");
    map<json> bound = boundPayloadOf("CheckRunService.onCheckRunCreated");
    test:assertFalse(bound.hasKey("check_run"), "'check_run' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_action"), "'requested_action' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
}

@test:Config {}
function testCheckRunRequestedActionDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_run", "check_run_requested_action");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckRunService.onCheckRunRequestedAction"), "CheckRunService.onCheckRunRequestedAction should have fired");
    map<json> bound = boundPayloadOf("CheckRunService.onCheckRunRequestedAction");
    test:assertFalse(bound.hasKey("check_run"), "'check_run' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_action"), "'requested_action' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
}

@test:Config {}
function testCheckRunRerequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_run", "check_run_rerequested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckRunService.onCheckRunRerequested"), "CheckRunService.onCheckRunRerequested should have fired");
    map<json> bound = boundPayloadOf("CheckRunService.onCheckRunRerequested");
    test:assertFalse(bound.hasKey("check_run"), "'check_run' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_action"), "'requested_action' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
}

@test:Config {}
function testCheckSuiteCompletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_suite", "check_suite_completed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckSuiteService.onCheckSuiteCompleted"), "CheckSuiteService.onCheckSuiteCompleted should have fired");
    map<json> bound = boundPayloadOf("CheckSuiteService.onCheckSuiteCompleted");
    test:assertFalse(bound.hasKey("check_suite"), "'check_suite' should have bound to its camelCase field on CheckSuitePayload, not stayed a raw key");
}

@test:Config {}
function testCheckSuiteRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_suite", "check_suite_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckSuiteService.onCheckSuiteRequested"), "CheckSuiteService.onCheckSuiteRequested should have fired");
    map<json> bound = boundPayloadOf("CheckSuiteService.onCheckSuiteRequested");
    test:assertFalse(bound.hasKey("check_suite"), "'check_suite' should have bound to its camelCase field on CheckSuitePayload, not stayed a raw key");
}

@test:Config {}
function testCheckSuiteRerequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_suite", "check_suite_rerequested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckSuiteService.onCheckSuiteRerequested"), "CheckSuiteService.onCheckSuiteRerequested should have fired");
    map<json> bound = boundPayloadOf("CheckSuiteService.onCheckSuiteRerequested");
    test:assertFalse(bound.hasKey("check_suite"), "'check_suite' should have bound to its camelCase field on CheckSuitePayload, not stayed a raw key");
}

@test:Config {}
function testDeploymentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment", "deployment_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeploymentService.onDeploymentCreated"), "DeploymentService.onDeploymentCreated should have fired");
    map<json> bound = boundPayloadOf("DeploymentService.onDeploymentCreated");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on DeploymentPayload, not stayed a raw key");
}

@test:Config {}
function testDeploymentStatusCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_status", "deployment_status_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeploymentStatusService.onDeploymentStatusCreated"), "DeploymentStatusService.onDeploymentStatusCreated should have fired");
    map<json> bound = boundPayloadOf("DeploymentStatusService.onDeploymentStatusCreated");
    test:assertFalse(bound.hasKey("deployment_status"), "'deployment_status' should have bound to its camelCase field on DeploymentStatusPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("check_run"), "'check_run' should have bound to its camelCase field on DeploymentStatusPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on DeploymentStatusPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowRunCompletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_run", "workflow_run_completed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowRunService.onWorkflowRunCompleted"), "WorkflowRunService.onWorkflowRunCompleted should have fired");
    map<json> bound = boundPayloadOf("WorkflowRunService.onWorkflowRunCompleted");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on WorkflowRunPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowRunInProgressDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_run", "workflow_run_in_progress");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowRunService.onWorkflowRunInProgress"), "WorkflowRunService.onWorkflowRunInProgress should have fired");
    map<json> bound = boundPayloadOf("WorkflowRunService.onWorkflowRunInProgress");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on WorkflowRunPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowRunRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_run", "workflow_run_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowRunService.onWorkflowRunRequested"), "WorkflowRunService.onWorkflowRunRequested should have fired");
    map<json> bound = boundPayloadOf("WorkflowRunService.onWorkflowRunRequested");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on WorkflowRunPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowJobCompletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_job", "workflow_job_completed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowJobService.onWorkflowJobCompleted"), "WorkflowJobService.onWorkflowJobCompleted should have fired");
    map<json> bound = boundPayloadOf("WorkflowJobService.onWorkflowJobCompleted");
    test:assertFalse(bound.hasKey("workflow_job"), "'workflow_job' should have bound to its camelCase field on WorkflowJobPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowJobInProgressDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_job", "workflow_job_in_progress");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowJobService.onWorkflowJobInProgress"), "WorkflowJobService.onWorkflowJobInProgress should have fired");
    map<json> bound = boundPayloadOf("WorkflowJobService.onWorkflowJobInProgress");
    test:assertFalse(bound.hasKey("workflow_job"), "'workflow_job' should have bound to its camelCase field on WorkflowJobPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowJobQueuedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_job", "workflow_job_queued");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowJobService.onWorkflowJobQueued"), "WorkflowJobService.onWorkflowJobQueued should have fired");
    map<json> bound = boundPayloadOf("WorkflowJobService.onWorkflowJobQueued");
    test:assertFalse(bound.hasKey("workflow_job"), "'workflow_job' should have bound to its camelCase field on WorkflowJobPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowJobWaitingDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_job", "workflow_job_waiting");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowJobService.onWorkflowJobWaiting"), "WorkflowJobService.onWorkflowJobWaiting should have fired");
    map<json> bound = boundPayloadOf("WorkflowJobService.onWorkflowJobWaiting");
    test:assertFalse(bound.hasKey("workflow_job"), "'workflow_job' should have bound to its camelCase field on WorkflowJobPayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryArchivedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_archived");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryArchived"), "RepositoryService.onRepositoryArchived should have fired");
}

@test:Config {}
function testRepositoryCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryCreated"), "RepositoryService.onRepositoryCreated should have fired");
}

@test:Config {}
function testRepositoryDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryDeleted"), "RepositoryService.onRepositoryDeleted should have fired");
}

@test:Config {}
function testRepositoryEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryEdited"), "RepositoryService.onRepositoryEdited should have fired");
}

@test:Config {}
function testRepositoryPrivatizedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_privatized");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryPrivatized"), "RepositoryService.onRepositoryPrivatized should have fired");
}

@test:Config {}
function testRepositoryPublicizedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_publicized");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryPublicized"), "RepositoryService.onRepositoryPublicized should have fired");
}

@test:Config {}
function testRepositoryRenamedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_renamed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryRenamed"), "RepositoryService.onRepositoryRenamed should have fired");
}

@test:Config {}
function testRepositoryTransferredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_transferred");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryTransferred"), "RepositoryService.onRepositoryTransferred should have fired");
}

@test:Config {}
function testRepositoryUnarchivedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_unarchived");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryUnarchived"), "RepositoryService.onRepositoryUnarchived should have fired");
}

@test:Config {}
function testMemberAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("member", "member_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MemberService.onMemberAdded"), "MemberService.onMemberAdded should have fired");
}

@test:Config {}
function testMemberEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("member", "member_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MemberService.onMemberEdited"), "MemberService.onMemberEdited should have fired");
}

@test:Config {}
function testMemberRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("member", "member_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MemberService.onMemberRemoved"), "MemberService.onMemberRemoved should have fired");
}

@test:Config {}
function testDiscussionAnsweredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_answered");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionAnswered"), "DiscussionService.onDiscussionAnswered should have fired");
}

@test:Config {}
function testDiscussionCategoryChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_category_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionCategoryChanged"), "DiscussionService.onDiscussionCategoryChanged should have fired");
}

@test:Config {}
function testDiscussionClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_closed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionClosed"), "DiscussionService.onDiscussionClosed should have fired");
}

@test:Config {}
function testDiscussionCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionCreated"), "DiscussionService.onDiscussionCreated should have fired");
}

@test:Config {}
function testDiscussionDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionDeleted"), "DiscussionService.onDiscussionDeleted should have fired");
}

@test:Config {}
function testDiscussionEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionEdited"), "DiscussionService.onDiscussionEdited should have fired");
}

@test:Config {}
function testDiscussionLabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_labeled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionLabeled"), "DiscussionService.onDiscussionLabeled should have fired");
}

@test:Config {}
function testDiscussionLockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_locked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionLocked"), "DiscussionService.onDiscussionLocked should have fired");
}

@test:Config {}
function testDiscussionPinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_pinned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionPinned"), "DiscussionService.onDiscussionPinned should have fired");
}

@test:Config {}
function testDiscussionReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionReopened"), "DiscussionService.onDiscussionReopened should have fired");
}

@test:Config {}
function testDiscussionTransferredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_transferred");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionTransferred"), "DiscussionService.onDiscussionTransferred should have fired");
}

@test:Config {}
function testDiscussionUnansweredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_unanswered");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionUnanswered"), "DiscussionService.onDiscussionUnanswered should have fired");
}

@test:Config {}
function testDiscussionUnlabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_unlabeled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionUnlabeled"), "DiscussionService.onDiscussionUnlabeled should have fired");
}

@test:Config {}
function testDiscussionUnlockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_unlocked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionUnlocked"), "DiscussionService.onDiscussionUnlocked should have fired");
}

@test:Config {}
function testDiscussionUnpinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_unpinned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionUnpinned"), "DiscussionService.onDiscussionUnpinned should have fired");
}

@test:Config {}
function testDiscussionCommentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion_comment", "discussion_comment_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionCommentService.onDiscussionCommentCreated"), "DiscussionCommentService.onDiscussionCommentCreated should have fired");
}

@test:Config {}
function testDiscussionCommentDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion_comment", "discussion_comment_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionCommentService.onDiscussionCommentDeleted"), "DiscussionCommentService.onDiscussionCommentDeleted should have fired");
}

@test:Config {}
function testDiscussionCommentEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion_comment", "discussion_comment_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionCommentService.onDiscussionCommentEdited"), "DiscussionCommentService.onDiscussionCommentEdited should have fired");
}

@test:Config {}
function testLabelCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("label", "label_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("LabelService.onLabelCreated"), "LabelService.onLabelCreated should have fired");
}

@test:Config {}
function testLabelDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("label", "label_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("LabelService.onLabelDeleted"), "LabelService.onLabelDeleted should have fired");
}

@test:Config {}
function testLabelEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("label", "label_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("LabelService.onLabelEdited"), "LabelService.onLabelEdited should have fired");
}

@test:Config {}
function testMilestoneClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_closed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MilestoneService.onMilestoneClosed"), "MilestoneService.onMilestoneClosed should have fired");
}

@test:Config {}
function testMilestoneCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MilestoneService.onMilestoneCreated"), "MilestoneService.onMilestoneCreated should have fired");
}

@test:Config {}
function testMilestoneDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MilestoneService.onMilestoneDeleted"), "MilestoneService.onMilestoneDeleted should have fired");
}

@test:Config {}
function testMilestoneEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MilestoneService.onMilestoneEdited"), "MilestoneService.onMilestoneEdited should have fired");
}

@test:Config {}
function testMilestoneOpenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_opened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MilestoneService.onMilestoneOpened"), "MilestoneService.onMilestoneOpened should have fired");
}

@test:Config {}
function testStatusDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("status", "status");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("StatusService.onStatus"), "StatusService.onStatus should have fired");
    map<json> bound = boundPayloadOf("StatusService.onStatus");
    test:assertFalse(bound.hasKey("target_url"), "'target_url' should have bound to its camelCase field on StatusPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("avatar_url"), "'avatar_url' should have bound to its camelCase field on StatusPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("created_at"), "'created_at' should have bound to its camelCase field on StatusPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("updated_at"), "'updated_at' should have bound to its camelCase field on StatusPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowDispatchDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_dispatch", "workflow_dispatch");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowDispatchService.onWorkflowDispatch"), "WorkflowDispatchService.onWorkflowDispatch should have fired");
}

@test:Config {}
function testPullRequestReviewThreadResolvedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_thread", "pull_request_review_thread_resolved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewThreadService.onPullRequestReviewThreadResolved"), "PullRequestReviewThreadService.onPullRequestReviewThreadResolved should have fired");
    map<json> bound = boundPayloadOf("PullRequestReviewThreadService.onPullRequestReviewThreadResolved");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewThreadPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("updated_at"), "'updated_at' should have bound to its camelCase field on PullRequestReviewThreadPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewThreadUnresolvedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_thread", "pull_request_review_thread_unresolved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved"), "PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved should have fired");
    map<json> bound = boundPayloadOf("PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewThreadPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("updated_at"), "'updated_at' should have bound to its camelCase field on PullRequestReviewThreadPayload, not stayed a raw key");
}

@test:Config {}
function testTeamAddedToRepositoryDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_added_to_repository");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamAddedToRepository"), "TeamService.onTeamAddedToRepository should have fired");
}

@test:Config {}
function testTeamCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamCreated"), "TeamService.onTeamCreated should have fired");
}

@test:Config {}
function testTeamDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamDeleted"), "TeamService.onTeamDeleted should have fired");
}

@test:Config {}
function testTeamEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamEdited"), "TeamService.onTeamEdited should have fired");
}

@test:Config {}
function testTeamRemovedFromRepositoryDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_removed_from_repository");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamRemovedFromRepository"), "TeamService.onTeamRemovedFromRepository should have fired");
}

@test:Config {}
function testOrganizationDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrganizationService.onOrganizationDeleted"), "OrganizationService.onOrganizationDeleted should have fired");
}

@test:Config {}
function testOrganizationMemberAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_member_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrganizationService.onOrganizationMemberAdded"), "OrganizationService.onOrganizationMemberAdded should have fired");
}

@test:Config {}
function testOrganizationMemberInvitedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_member_invited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrganizationService.onOrganizationMemberInvited"), "OrganizationService.onOrganizationMemberInvited should have fired");
}

@test:Config {}
function testOrganizationMemberRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_member_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrganizationService.onOrganizationMemberRemoved"), "OrganizationService.onOrganizationMemberRemoved should have fired");
}

@test:Config {}
function testOrganizationRenamedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_renamed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrganizationService.onOrganizationRenamed"), "OrganizationService.onOrganizationRenamed should have fired");
}

@test:Config {}
function testDeploymentProtectionRuleDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_protection_rule", "deployment_protection_rule");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeploymentProtectionRuleService.onDeploymentProtectionRule"), "DeploymentProtectionRuleService.onDeploymentProtectionRule should have fired");
    map<json> bound = boundPayloadOf("DeploymentProtectionRuleService.onDeploymentProtectionRule");
    test:assertFalse(bound.hasKey("deployment_callback_url"), "'deployment_callback_url' should have bound to its camelCase field on DeploymentProtectionRulePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("pull_requests"), "'pull_requests' should have bound to its camelCase field on DeploymentProtectionRulePayload, not stayed a raw key");
}

@test:Config {}
function testDeploymentReviewApprovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_review", "deployment_review_approved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeploymentReviewService.onDeploymentReviewApproved"), "DeploymentReviewService.onDeploymentReviewApproved should have fired");
    map<json> bound = boundPayloadOf("DeploymentReviewService.onDeploymentReviewApproved");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on DeploymentReviewPayload, not stayed a raw key");
}

@test:Config {}
function testDeploymentReviewRejectedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_review", "deployment_review_rejected");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeploymentReviewService.onDeploymentReviewRejected"), "DeploymentReviewService.onDeploymentReviewRejected should have fired");
    map<json> bound = boundPayloadOf("DeploymentReviewService.onDeploymentReviewRejected");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on DeploymentReviewPayload, not stayed a raw key");
}

@test:Config {}
function testDeploymentReviewRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_review", "deployment_review_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeploymentReviewService.onDeploymentReviewRequested"), "DeploymentReviewService.onDeploymentReviewRequested should have fired");
    map<json> bound = boundPayloadOf("DeploymentReviewService.onDeploymentReviewRequested");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on DeploymentReviewPayload, not stayed a raw key");
}

@test:Config {}
function testInstallationTargetRenamedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation_target", "installation_target_renamed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationTargetService.onInstallationTargetRenamed"), "InstallationTargetService.onInstallationTargetRenamed should have fired");
    map<json> bound = boundPayloadOf("InstallationTargetService.onInstallationTargetRenamed");
    test:assertFalse(bound.hasKey("target_type"), "'target_type' should have bound to its camelCase field on InstallationTargetPayload, not stayed a raw key");
}

@test:Config {}
function testIssueDependenciesBlockedByAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_dependencies", "issue_dependencies_blocked_by_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueDependenciesService.onIssueDependenciesBlockedByAdded"), "IssueDependenciesService.onIssueDependenciesBlockedByAdded should have fired");
    map<json> bound = boundPayloadOf("IssueDependenciesService.onIssueDependenciesBlockedByAdded");
    test:assertFalse(bound.hasKey("blocked_issue_id"), "'blocked_issue_id' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocked_issue"), "'blocked_issue' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocking_issue_id"), "'blocking_issue_id' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocking_issue"), "'blocking_issue' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocking_issue_repo"), "'blocking_issue_repo' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
}

@test:Config {}
function testIssueDependenciesBlockedByRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_dependencies", "issue_dependencies_blocked_by_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueDependenciesService.onIssueDependenciesBlockedByRemoved"), "IssueDependenciesService.onIssueDependenciesBlockedByRemoved should have fired");
    map<json> bound = boundPayloadOf("IssueDependenciesService.onIssueDependenciesBlockedByRemoved");
    test:assertFalse(bound.hasKey("blocked_issue_id"), "'blocked_issue_id' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocked_issue"), "'blocked_issue' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocking_issue_id"), "'blocking_issue_id' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocking_issue"), "'blocking_issue' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocking_issue_repo"), "'blocking_issue_repo' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
}

@test:Config {}
function testIssueDependenciesBlockingAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_dependencies", "issue_dependencies_blocking_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueDependenciesService.onIssueDependenciesBlockingAdded"), "IssueDependenciesService.onIssueDependenciesBlockingAdded should have fired");
    map<json> bound = boundPayloadOf("IssueDependenciesService.onIssueDependenciesBlockingAdded");
    test:assertFalse(bound.hasKey("blocked_issue_id"), "'blocked_issue_id' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocked_issue"), "'blocked_issue' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocking_issue_id"), "'blocking_issue_id' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocking_issue"), "'blocking_issue' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocking_issue_repo"), "'blocking_issue_repo' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
}

@test:Config {}
function testIssueDependenciesBlockingRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_dependencies", "issue_dependencies_blocking_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueDependenciesService.onIssueDependenciesBlockingRemoved"), "IssueDependenciesService.onIssueDependenciesBlockingRemoved should have fired");
    map<json> bound = boundPayloadOf("IssueDependenciesService.onIssueDependenciesBlockingRemoved");
    test:assertFalse(bound.hasKey("blocked_issue_id"), "'blocked_issue_id' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocked_issue"), "'blocked_issue' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocking_issue_id"), "'blocking_issue_id' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocking_issue"), "'blocking_issue' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("blocking_issue_repo"), "'blocking_issue_repo' should have bound to its camelCase field on IssueDependenciesPayload, not stayed a raw key");
}

@test:Config {}
function testMarketplacePurchaseCancelledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("marketplace_purchase", "marketplace_purchase_cancelled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MarketplacePurchaseService.onMarketplacePurchaseCancelled"), "MarketplacePurchaseService.onMarketplacePurchaseCancelled should have fired");
    map<json> bound = boundPayloadOf("MarketplacePurchaseService.onMarketplacePurchaseCancelled");
    test:assertFalse(bound.hasKey("marketplace_purchase"), "'marketplace_purchase' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("previous_marketplace_purchase"), "'previous_marketplace_purchase' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
}

@test:Config {}
function testMarketplacePurchaseChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("marketplace_purchase", "marketplace_purchase_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MarketplacePurchaseService.onMarketplacePurchaseChanged"), "MarketplacePurchaseService.onMarketplacePurchaseChanged should have fired");
    map<json> bound = boundPayloadOf("MarketplacePurchaseService.onMarketplacePurchaseChanged");
    test:assertFalse(bound.hasKey("marketplace_purchase"), "'marketplace_purchase' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("previous_marketplace_purchase"), "'previous_marketplace_purchase' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
}

@test:Config {}
function testMarketplacePurchasePendingChangeDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("marketplace_purchase", "marketplace_purchase_pending_change");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MarketplacePurchaseService.onMarketplacePurchasePendingChange"), "MarketplacePurchaseService.onMarketplacePurchasePendingChange should have fired");
    map<json> bound = boundPayloadOf("MarketplacePurchaseService.onMarketplacePurchasePendingChange");
    test:assertFalse(bound.hasKey("marketplace_purchase"), "'marketplace_purchase' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("previous_marketplace_purchase"), "'previous_marketplace_purchase' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
}

@test:Config {}
function testMarketplacePurchasePendingChangeCancelledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("marketplace_purchase", "marketplace_purchase_pending_change_cancelled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MarketplacePurchaseService.onMarketplacePurchasePendingChangeCancelled"), "MarketplacePurchaseService.onMarketplacePurchasePendingChangeCancelled should have fired");
    map<json> bound = boundPayloadOf("MarketplacePurchaseService.onMarketplacePurchasePendingChangeCancelled");
    test:assertFalse(bound.hasKey("marketplace_purchase"), "'marketplace_purchase' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("previous_marketplace_purchase"), "'previous_marketplace_purchase' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
}

@test:Config {}
function testMarketplacePurchasePurchasedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("marketplace_purchase", "marketplace_purchase_purchased");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MarketplacePurchaseService.onMarketplacePurchasePurchased"), "MarketplacePurchaseService.onMarketplacePurchasePurchased should have fired");
    map<json> bound = boundPayloadOf("MarketplacePurchaseService.onMarketplacePurchasePurchased");
    test:assertFalse(bound.hasKey("marketplace_purchase"), "'marketplace_purchase' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("previous_marketplace_purchase"), "'previous_marketplace_purchase' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on MarketplacePurchasePayload, not stayed a raw key");
}

@test:Config {}
function testPersonalAccessTokenRequestApprovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("personal_access_token_request", "personal_access_token_request_approved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved"), "PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved should have fired");
    map<json> bound = boundPayloadOf("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved");
    test:assertFalse(bound.hasKey("personal_access_token_request"), "'personal_access_token_request' should have bound to its camelCase field on PersonalAccessTokenRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPersonalAccessTokenRequestCancelledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("personal_access_token_request", "personal_access_token_request_cancelled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled"), "PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled should have fired");
    map<json> bound = boundPayloadOf("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled");
    test:assertFalse(bound.hasKey("personal_access_token_request"), "'personal_access_token_request' should have bound to its camelCase field on PersonalAccessTokenRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPersonalAccessTokenRequestCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("personal_access_token_request", "personal_access_token_request_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated"), "PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated should have fired");
    map<json> bound = boundPayloadOf("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated");
    test:assertFalse(bound.hasKey("personal_access_token_request"), "'personal_access_token_request' should have bound to its camelCase field on PersonalAccessTokenRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPersonalAccessTokenRequestDeniedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("personal_access_token_request", "personal_access_token_request_denied");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied"), "PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied should have fired");
    map<json> bound = boundPayloadOf("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied");
    test:assertFalse(bound.hasKey("personal_access_token_request"), "'personal_access_token_request' should have bound to its camelCase field on PersonalAccessTokenRequestPayload, not stayed a raw key");
}

@test:Config {}
function testProjectClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_closed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectService.onProjectClosed"), "ProjectService.onProjectClosed should have fired");
}

@test:Config {}
function testProjectCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectService.onProjectCreated"), "ProjectService.onProjectCreated should have fired");
}

@test:Config {}
function testProjectDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectService.onProjectDeleted"), "ProjectService.onProjectDeleted should have fired");
}

@test:Config {}
function testProjectEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectService.onProjectEdited"), "ProjectService.onProjectEdited should have fired");
}

@test:Config {}
function testProjectReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectService.onProjectReopened"), "ProjectService.onProjectReopened should have fired");
}

@test:Config {}
function testProjectCardConvertedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_converted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectCardService.onProjectCardConverted"), "ProjectCardService.onProjectCardConverted should have fired");
    map<json> bound = boundPayloadOf("ProjectCardService.onProjectCardConverted");
    test:assertFalse(bound.hasKey("project_card"), "'project_card' should have bound to its camelCase field on ProjectCardPayload, not stayed a raw key");
}

@test:Config {}
function testProjectCardCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectCardService.onProjectCardCreated"), "ProjectCardService.onProjectCardCreated should have fired");
    map<json> bound = boundPayloadOf("ProjectCardService.onProjectCardCreated");
    test:assertFalse(bound.hasKey("project_card"), "'project_card' should have bound to its camelCase field on ProjectCardPayload, not stayed a raw key");
}

@test:Config {}
function testProjectCardDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectCardService.onProjectCardDeleted"), "ProjectCardService.onProjectCardDeleted should have fired");
    map<json> bound = boundPayloadOf("ProjectCardService.onProjectCardDeleted");
    test:assertFalse(bound.hasKey("project_card"), "'project_card' should have bound to its camelCase field on ProjectCardPayload, not stayed a raw key");
}

@test:Config {}
function testProjectCardEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectCardService.onProjectCardEdited"), "ProjectCardService.onProjectCardEdited should have fired");
    map<json> bound = boundPayloadOf("ProjectCardService.onProjectCardEdited");
    test:assertFalse(bound.hasKey("project_card"), "'project_card' should have bound to its camelCase field on ProjectCardPayload, not stayed a raw key");
}

@test:Config {}
function testProjectCardMovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_moved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectCardService.onProjectCardMoved"), "ProjectCardService.onProjectCardMoved should have fired");
    map<json> bound = boundPayloadOf("ProjectCardService.onProjectCardMoved");
    test:assertFalse(bound.hasKey("project_card"), "'project_card' should have bound to its camelCase field on ProjectCardPayload, not stayed a raw key");
}

@test:Config {}
function testProjectColumnCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_column", "project_column_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectColumnService.onProjectColumnCreated"), "ProjectColumnService.onProjectColumnCreated should have fired");
    map<json> bound = boundPayloadOf("ProjectColumnService.onProjectColumnCreated");
    test:assertFalse(bound.hasKey("project_column"), "'project_column' should have bound to its camelCase field on ProjectColumnPayload, not stayed a raw key");
}

@test:Config {}
function testProjectColumnDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_column", "project_column_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectColumnService.onProjectColumnDeleted"), "ProjectColumnService.onProjectColumnDeleted should have fired");
    map<json> bound = boundPayloadOf("ProjectColumnService.onProjectColumnDeleted");
    test:assertFalse(bound.hasKey("project_column"), "'project_column' should have bound to its camelCase field on ProjectColumnPayload, not stayed a raw key");
}

@test:Config {}
function testProjectColumnEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_column", "project_column_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectColumnService.onProjectColumnEdited"), "ProjectColumnService.onProjectColumnEdited should have fired");
    map<json> bound = boundPayloadOf("ProjectColumnService.onProjectColumnEdited");
    test:assertFalse(bound.hasKey("project_column"), "'project_column' should have bound to its camelCase field on ProjectColumnPayload, not stayed a raw key");
}

@test:Config {}
function testProjectColumnMovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_column", "project_column_moved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectColumnService.onProjectColumnMoved"), "ProjectColumnService.onProjectColumnMoved should have fired");
    map<json> bound = boundPayloadOf("ProjectColumnService.onProjectColumnMoved");
    test:assertFalse(bound.hasKey("project_column"), "'project_column' should have bound to its camelCase field on ProjectColumnPayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryImportDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_import", "repository_import");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryImportService.onRepositoryImport"), "RepositoryImportService.onRepositoryImport should have fired");
}

@test:Config {}
function testSubIssuesParentIssueAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sub_issues", "sub_issues_parent_issue_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SubIssuesService.onSubIssuesParentIssueAdded"), "SubIssuesService.onSubIssuesParentIssueAdded should have fired");
    map<json> bound = boundPayloadOf("SubIssuesService.onSubIssuesParentIssueAdded");
    test:assertFalse(bound.hasKey("parent_issue_id"), "'parent_issue_id' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("parent_issue"), "'parent_issue' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("parent_issue_repo"), "'parent_issue_repo' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("sub_issue_id"), "'sub_issue_id' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("sub_issue"), "'sub_issue' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
}

@test:Config {}
function testSubIssuesParentIssueRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sub_issues", "sub_issues_parent_issue_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SubIssuesService.onSubIssuesParentIssueRemoved"), "SubIssuesService.onSubIssuesParentIssueRemoved should have fired");
    map<json> bound = boundPayloadOf("SubIssuesService.onSubIssuesParentIssueRemoved");
    test:assertFalse(bound.hasKey("parent_issue_id"), "'parent_issue_id' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("parent_issue"), "'parent_issue' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("parent_issue_repo"), "'parent_issue_repo' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("sub_issue_id"), "'sub_issue_id' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("sub_issue"), "'sub_issue' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
}

@test:Config {}
function testSubIssuesSubIssueAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sub_issues", "sub_issues_sub_issue_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SubIssuesService.onSubIssuesSubIssueAdded"), "SubIssuesService.onSubIssuesSubIssueAdded should have fired");
    map<json> bound = boundPayloadOf("SubIssuesService.onSubIssuesSubIssueAdded");
    test:assertFalse(bound.hasKey("parent_issue_id"), "'parent_issue_id' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("parent_issue"), "'parent_issue' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("parent_issue_repo"), "'parent_issue_repo' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("sub_issue_id"), "'sub_issue_id' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("sub_issue"), "'sub_issue' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
}

@test:Config {}
function testSubIssuesSubIssueRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sub_issues", "sub_issues_sub_issue_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SubIssuesService.onSubIssuesSubIssueRemoved"), "SubIssuesService.onSubIssuesSubIssueRemoved should have fired");
    map<json> bound = boundPayloadOf("SubIssuesService.onSubIssuesSubIssueRemoved");
    test:assertFalse(bound.hasKey("parent_issue_id"), "'parent_issue_id' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("parent_issue"), "'parent_issue' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("parent_issue_repo"), "'parent_issue_repo' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("sub_issue_id"), "'sub_issue_id' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("sub_issue"), "'sub_issue' should have bound to its camelCase field on SubIssuesPayload, not stayed a raw key");
}

@test:Config {}
function testPageBuildDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("page_build", "page_build");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PageBuildService.onPageBuild"), "PageBuildService.onPageBuild should have fired");
}

@test:Config {}
function testTeamAddDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team_add", "team_add");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamAddService.onTeamAdd"), "TeamAddService.onTeamAdd should have fired");
}

@test:Config {}
function testSponsorshipCancelledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_cancelled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SponsorshipService.onSponsorshipCancelled"), "SponsorshipService.onSponsorshipCancelled should have fired");
    map<json> bound = boundPayloadOf("SponsorshipService.onSponsorshipCancelled");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on SponsorshipPayload, not stayed a raw key");
}

@test:Config {}
function testSponsorshipCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SponsorshipService.onSponsorshipCreated"), "SponsorshipService.onSponsorshipCreated should have fired");
    map<json> bound = boundPayloadOf("SponsorshipService.onSponsorshipCreated");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on SponsorshipPayload, not stayed a raw key");
}

@test:Config {}
function testSponsorshipEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SponsorshipService.onSponsorshipEdited"), "SponsorshipService.onSponsorshipEdited should have fired");
    map<json> bound = boundPayloadOf("SponsorshipService.onSponsorshipEdited");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on SponsorshipPayload, not stayed a raw key");
}

@test:Config {}
function testSponsorshipPendingCancellationDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_pending_cancellation");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SponsorshipService.onSponsorshipPendingCancellation"), "SponsorshipService.onSponsorshipPendingCancellation should have fired");
    map<json> bound = boundPayloadOf("SponsorshipService.onSponsorshipPendingCancellation");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on SponsorshipPayload, not stayed a raw key");
}

@test:Config {}
function testSponsorshipPendingTierChangeDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_pending_tier_change");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SponsorshipService.onSponsorshipPendingTierChange"), "SponsorshipService.onSponsorshipPendingTierChange should have fired");
    map<json> bound = boundPayloadOf("SponsorshipService.onSponsorshipPendingTierChange");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on SponsorshipPayload, not stayed a raw key");
}

@test:Config {}
function testSponsorshipTierChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_tier_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SponsorshipService.onSponsorshipTierChanged"), "SponsorshipService.onSponsorshipTierChanged should have fired");
    map<json> bound = boundPayloadOf("SponsorshipService.onSponsorshipTierChanged");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on SponsorshipPayload, not stayed a raw key");
}

@test:Config {}
function testSecurityAndAnalysisDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("security_and_analysis", "security_and_analysis");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecurityAndAnalysisService.onSecurityAndAnalysis"), "SecurityAndAnalysisService.onSecurityAndAnalysis should have fired");
}

@test:Config {}
function testBranchProtectionConfigurationDisabledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_configuration", "branch_protection_configuration_disabled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("BranchProtectionConfigurationService.onBranchProtectionConfigurationDisabled"), "BranchProtectionConfigurationService.onBranchProtectionConfigurationDisabled should have fired");
}

@test:Config {}
function testBranchProtectionConfigurationEnabledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_configuration", "branch_protection_configuration_enabled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("BranchProtectionConfigurationService.onBranchProtectionConfigurationEnabled"), "BranchProtectionConfigurationService.onBranchProtectionConfigurationEnabled should have fired");
}

@test:Config {}
function testCustomPropertyCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property", "custom_property_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CustomPropertyService.onCustomPropertyCreated"), "CustomPropertyService.onCustomPropertyCreated should have fired");
}

@test:Config {}
function testCustomPropertyDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property", "custom_property_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CustomPropertyService.onCustomPropertyDeleted"), "CustomPropertyService.onCustomPropertyDeleted should have fired");
}

@test:Config {}
function testCustomPropertyPromoteToEnterpriseDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property", "custom_property_promote_to_enterprise");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CustomPropertyService.onCustomPropertyPromoteToEnterprise"), "CustomPropertyService.onCustomPropertyPromoteToEnterprise should have fired");
}

@test:Config {}
function testCustomPropertyUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property", "custom_property_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CustomPropertyService.onCustomPropertyUpdated"), "CustomPropertyService.onCustomPropertyUpdated should have fired");
}

@test:Config {}
function testCustomPropertyValuesUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property_values", "custom_property_values_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CustomPropertyValuesService.onCustomPropertyValuesUpdated"), "CustomPropertyValuesService.onCustomPropertyValuesUpdated should have fired");
    map<json> bound = boundPayloadOf("CustomPropertyValuesService.onCustomPropertyValuesUpdated");
    test:assertFalse(bound.hasKey("new_property_values"), "'new_property_values' should have bound to its camelCase field on CustomPropertyValuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("old_property_values"), "'old_property_values' should have bound to its camelCase field on CustomPropertyValuesPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemArchivedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_archived");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemArchived"), "ProjectsV2itemService.onProjectsV2ItemArchived should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemArchived");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemConvertedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_converted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemConverted"), "ProjectsV2itemService.onProjectsV2ItemConverted should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemConverted");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemCreated"), "ProjectsV2itemService.onProjectsV2ItemCreated should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemCreated");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemDeleted"), "ProjectsV2itemService.onProjectsV2ItemDeleted should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemDeleted");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemEdited"), "ProjectsV2itemService.onProjectsV2ItemEdited should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemEdited");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemReorderedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_reordered");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemReordered"), "ProjectsV2itemService.onProjectsV2ItemReordered should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemReordered");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemRestoredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_restored");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemRestored"), "ProjectsV2itemService.onProjectsV2ItemRestored should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemRestored");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2StatusUpdateCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_status_update", "projects_v2_status_update_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated"), "ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated");
    test:assertFalse(bound.hasKey("projects_v2_status_update"), "'projects_v2_status_update' should have bound to its camelCase field on 'ProjectsV2StatusUpdatePayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2StatusUpdateDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_status_update", "projects_v2_status_update_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted"), "ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted");
    test:assertFalse(bound.hasKey("projects_v2_status_update"), "'projects_v2_status_update' should have bound to its camelCase field on 'ProjectsV2StatusUpdatePayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2StatusUpdateEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_status_update", "projects_v2_status_update_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited"), "ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited");
    test:assertFalse(bound.hasKey("projects_v2_status_update"), "'projects_v2_status_update' should have bound to its camelCase field on 'ProjectsV2StatusUpdatePayload, not stayed a raw key");
}

@test:Config {}
function testRegistryPackagePublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("registry_package", "registry_package_published");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RegistryPackageService.onRegistryPackagePublished"), "RegistryPackageService.onRegistryPackagePublished should have fired");
    map<json> bound = boundPayloadOf("RegistryPackageService.onRegistryPackagePublished");
    test:assertFalse(bound.hasKey("registry_package"), "'registry_package' should have bound to its camelCase field on RegistryPackagePayload, not stayed a raw key");
}

@test:Config {}
function testRegistryPackageUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("registry_package", "registry_package_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RegistryPackageService.onRegistryPackageUpdated"), "RegistryPackageService.onRegistryPackageUpdated should have fired");
    map<json> bound = boundPayloadOf("RegistryPackageService.onRegistryPackageUpdated");
    test:assertFalse(bound.hasKey("registry_package"), "'registry_package' should have bound to its camelCase field on RegistryPackagePayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryRulesetCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_ruleset", "repository_ruleset_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryRulesetService.onRepositoryRulesetCreated"), "RepositoryRulesetService.onRepositoryRulesetCreated should have fired");
    map<json> bound = boundPayloadOf("RepositoryRulesetService.onRepositoryRulesetCreated");
    test:assertFalse(bound.hasKey("repository_ruleset"), "'repository_ruleset' should have bound to its camelCase field on RepositoryRulesetPayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryRulesetDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_ruleset", "repository_ruleset_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryRulesetService.onRepositoryRulesetDeleted"), "RepositoryRulesetService.onRepositoryRulesetDeleted should have fired");
    map<json> bound = boundPayloadOf("RepositoryRulesetService.onRepositoryRulesetDeleted");
    test:assertFalse(bound.hasKey("repository_ruleset"), "'repository_ruleset' should have bound to its camelCase field on RepositoryRulesetPayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryRulesetEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_ruleset", "repository_ruleset_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryRulesetService.onRepositoryRulesetEdited"), "RepositoryRulesetService.onRepositoryRulesetEdited should have fired");
    map<json> bound = boundPayloadOf("RepositoryRulesetService.onRepositoryRulesetEdited");
    test:assertFalse(bound.hasKey("repository_ruleset"), "'repository_ruleset' should have bound to its camelCase field on RepositoryRulesetPayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryVulnerabilityAlertCreateDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_vulnerability_alert", "repository_vulnerability_alert_create");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertCreate"), "RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertCreate should have fired");
}

@test:Config {}
function testRepositoryVulnerabilityAlertDismissDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_vulnerability_alert", "repository_vulnerability_alert_dismiss");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertDismiss"), "RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertDismiss should have fired");
}

@test:Config {}
function testRepositoryVulnerabilityAlertReopenDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_vulnerability_alert", "repository_vulnerability_alert_reopen");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertReopen"), "RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertReopen should have fired");
}

@test:Config {}
function testRepositoryVulnerabilityAlertResolveDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_vulnerability_alert", "repository_vulnerability_alert_resolve");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertResolve"), "RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertResolve should have fired");
}

@test:Config {}
function testSecretScanningAlertLocationDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert_location", "secret_scanning_alert_location");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertLocationService.onSecretScanningAlertLocation"), "SecretScanningAlertLocationService.onSecretScanningAlertLocation should have fired");
}

@test:Config {}
function testSecretScanningScanDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_scan", "secret_scanning_scan");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningScanService.onSecretScanningScan"), "SecretScanningScanService.onSecretScanningScan should have fired");
    map<json> bound = boundPayloadOf("SecretScanningScanService.onSecretScanningScan");
    test:assertFalse(bound.hasKey("started_at"), "'started_at' should have bound to its camelCase field on SecretScanningScanPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("completed_at"), "'completed_at' should have bound to its camelCase field on SecretScanningScanPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("secret_types"), "'secret_types' should have bound to its camelCase field on SecretScanningScanPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("custom_pattern_name"), "'custom_pattern_name' should have bound to its camelCase field on SecretScanningScanPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("custom_pattern_scope"), "'custom_pattern_scope' should have bound to its camelCase field on SecretScanningScanPayload, not stayed a raw key");
}

@test:Config {}
function testBranchProtectionRuleCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_rule", "branch_protection_rule_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("BranchProtectionRuleService.onBranchProtectionRuleCreated"), "BranchProtectionRuleService.onBranchProtectionRuleCreated should have fired");
}

@test:Config {}
function testBranchProtectionRuleDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_rule", "branch_protection_rule_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("BranchProtectionRuleService.onBranchProtectionRuleDeleted"), "BranchProtectionRuleService.onBranchProtectionRuleDeleted should have fired");
}

@test:Config {}
function testBranchProtectionRuleEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_rule", "branch_protection_rule_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("BranchProtectionRuleService.onBranchProtectionRuleEdited"), "BranchProtectionRuleService.onBranchProtectionRuleEdited should have fired");
}

@test:Config {}
function testCodeScanningAlertAppearedInBranchDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_appeared_in_branch");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertAppearedInBranch"), "CodeScanningAlertService.onCodeScanningAlertAppearedInBranch should have fired");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertAppearedInBranch");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testCodeScanningAlertClosedByUserDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_closed_by_user");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertClosedByUser"), "CodeScanningAlertService.onCodeScanningAlertClosedByUser should have fired");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertClosedByUser");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testCodeScanningAlertCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertCreated"), "CodeScanningAlertService.onCodeScanningAlertCreated should have fired");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertCreated");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testCodeScanningAlertFixedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_fixed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertFixed"), "CodeScanningAlertService.onCodeScanningAlertFixed should have fired");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertFixed");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testCodeScanningAlertReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertReopened"), "CodeScanningAlertService.onCodeScanningAlertReopened should have fired");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertReopened");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testCodeScanningAlertReopenedByUserDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_reopened_by_user");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertReopenedByUser"), "CodeScanningAlertService.onCodeScanningAlertReopenedByUser should have fired");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertReopenedByUser");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testCodeScanningAlertUpdatedAssignmentDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_updated_assignment");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment"), "CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment should have fired");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testDeployKeyCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deploy_key", "deploy_key_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeployKeyService.onDeployKeyCreated"), "DeployKeyService.onDeployKeyCreated should have fired");
}

@test:Config {}
function testDeployKeyDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deploy_key", "deploy_key_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeployKeyService.onDeployKeyDeleted"), "DeployKeyService.onDeployKeyDeleted should have fired");
}

@test:Config {}
function testGithubAppAuthorizationRevokedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("github_app_authorization", "github_app_authorization_revoked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("GithubAppAuthorizationService.onGithubAppAuthorizationRevoked"), "GithubAppAuthorizationService.onGithubAppAuthorizationRevoked should have fired");
}

@test:Config {}
function testMetaDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("meta", "meta_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MetaService.onMetaDeleted"), "MetaService.onMetaDeleted should have fired");
    map<json> bound = boundPayloadOf("MetaService.onMetaDeleted");
    test:assertFalse(bound.hasKey("hook_id"), "'hook_id' should have bound to its camelCase field on MetaPayload, not stayed a raw key");
}

@test:Config {}
function testOrgBlockBlockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("org_block", "org_block_blocked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrgBlockService.onOrgBlockBlocked"), "OrgBlockService.onOrgBlockBlocked should have fired");
    map<json> bound = boundPayloadOf("OrgBlockService.onOrgBlockBlocked");
    test:assertFalse(bound.hasKey("blocked_user"), "'blocked_user' should have bound to its camelCase field on OrgBlockPayload, not stayed a raw key");
}

@test:Config {}
function testOrgBlockUnblockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("org_block", "org_block_unblocked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrgBlockService.onOrgBlockUnblocked"), "OrgBlockService.onOrgBlockUnblocked should have fired");
    map<json> bound = boundPayloadOf("OrgBlockService.onOrgBlockUnblocked");
    test:assertFalse(bound.hasKey("blocked_user"), "'blocked_user' should have bound to its camelCase field on OrgBlockPayload, not stayed a raw key");
}

@test:Config {}
function testPackagePublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("package", "package_published");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PackageService.onPackagePublished"), "PackageService.onPackagePublished should have fired");
}

@test:Config {}
function testPackageUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("package", "package_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PackageService.onPackageUpdated"), "PackageService.onPackageUpdated should have fired");
}

@test:Config {}
function testProjectsV2ClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_closed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2Service.onProjectsV2Closed"), "ProjectsV2Service.onProjectsV2Closed should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2Service.onProjectsV2Closed");
    test:assertFalse(bound.hasKey("projects_v2"), "'projects_v2' should have bound to its camelCase field on 'ProjectsV2Payload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2CreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2Service.onProjectsV2Created"), "ProjectsV2Service.onProjectsV2Created should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2Service.onProjectsV2Created");
    test:assertFalse(bound.hasKey("projects_v2"), "'projects_v2' should have bound to its camelCase field on 'ProjectsV2Payload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2DeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2Service.onProjectsV2Deleted"), "ProjectsV2Service.onProjectsV2Deleted should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2Service.onProjectsV2Deleted");
    test:assertFalse(bound.hasKey("projects_v2"), "'projects_v2' should have bound to its camelCase field on 'ProjectsV2Payload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2EditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2Service.onProjectsV2Edited"), "ProjectsV2Service.onProjectsV2Edited should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2Service.onProjectsV2Edited");
    test:assertFalse(bound.hasKey("projects_v2"), "'projects_v2' should have bound to its camelCase field on 'ProjectsV2Payload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2Service.onProjectsV2Reopened"), "ProjectsV2Service.onProjectsV2Reopened should have fired");
    map<json> bound = boundPayloadOf("ProjectsV2Service.onProjectsV2Reopened");
    test:assertFalse(bound.hasKey("projects_v2"), "'projects_v2' should have bound to its camelCase field on 'ProjectsV2Payload, not stayed a raw key");
}

@test:Config {}
function testRepositoryAdvisoryPublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_advisory", "repository_advisory_published");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryAdvisoryService.onRepositoryAdvisoryPublished"), "RepositoryAdvisoryService.onRepositoryAdvisoryPublished should have fired");
    map<json> bound = boundPayloadOf("RepositoryAdvisoryService.onRepositoryAdvisoryPublished");
    test:assertFalse(bound.hasKey("repository_advisory"), "'repository_advisory' should have bound to its camelCase field on RepositoryAdvisoryPayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryAdvisoryReportedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_advisory", "repository_advisory_reported");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryAdvisoryService.onRepositoryAdvisoryReported"), "RepositoryAdvisoryService.onRepositoryAdvisoryReported should have fired");
    map<json> bound = boundPayloadOf("RepositoryAdvisoryService.onRepositoryAdvisoryReported");
    test:assertFalse(bound.hasKey("repository_advisory"), "'repository_advisory' should have bound to its camelCase field on RepositoryAdvisoryPayload, not stayed a raw key");
}

@test:Config {}
function testSecurityAdvisoryPublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("security_advisory", "security_advisory_published");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecurityAdvisoryService.onSecurityAdvisoryPublished"), "SecurityAdvisoryService.onSecurityAdvisoryPublished should have fired");
    map<json> bound = boundPayloadOf("SecurityAdvisoryService.onSecurityAdvisoryPublished");
    test:assertFalse(bound.hasKey("security_advisory"), "'security_advisory' should have bound to its camelCase field on SecurityAdvisoryPayload, not stayed a raw key");
}

@test:Config {}
function testSecurityAdvisoryUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("security_advisory", "security_advisory_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecurityAdvisoryService.onSecurityAdvisoryUpdated"), "SecurityAdvisoryService.onSecurityAdvisoryUpdated should have fired");
    map<json> bound = boundPayloadOf("SecurityAdvisoryService.onSecurityAdvisoryUpdated");
    test:assertFalse(bound.hasKey("security_advisory"), "'security_advisory' should have bound to its camelCase field on SecurityAdvisoryPayload, not stayed a raw key");
}

@test:Config {}
function testSecurityAdvisoryWithdrawnDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("security_advisory", "security_advisory_withdrawn");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecurityAdvisoryService.onSecurityAdvisoryWithdrawn"), "SecurityAdvisoryService.onSecurityAdvisoryWithdrawn should have fired");
    map<json> bound = boundPayloadOf("SecurityAdvisoryService.onSecurityAdvisoryWithdrawn");
    test:assertFalse(bound.hasKey("security_advisory"), "'security_advisory' should have bound to its camelCase field on SecurityAdvisoryPayload, not stayed a raw key");
}

@test:Config {}
function testCommitCommentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("commit_comment", "commit_comment_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CommitCommentService.onCommitCommentCreated"), "CommitCommentService.onCommitCommentCreated should have fired");
}

@test:Config {}
function testDependabotAlertAssigneesChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_assignees_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertAssigneesChanged"), "DependabotAlertService.onDependabotAlertAssigneesChanged should have fired");
}

@test:Config {}
function testDependabotAlertAutoDismissedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_auto_dismissed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertAutoDismissed"), "DependabotAlertService.onDependabotAlertAutoDismissed should have fired");
}

@test:Config {}
function testDependabotAlertAutoReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_auto_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertAutoReopened"), "DependabotAlertService.onDependabotAlertAutoReopened should have fired");
}

@test:Config {}
function testDependabotAlertCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertCreated"), "DependabotAlertService.onDependabotAlertCreated should have fired");
}

@test:Config {}
function testDependabotAlertDismissedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_dismissed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertDismissed"), "DependabotAlertService.onDependabotAlertDismissed should have fired");
}

@test:Config {}
function testDependabotAlertFixedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_fixed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertFixed"), "DependabotAlertService.onDependabotAlertFixed should have fired");
}

@test:Config {}
function testDependabotAlertReintroducedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_reintroduced");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertReintroduced"), "DependabotAlertService.onDependabotAlertReintroduced should have fired");
}

@test:Config {}
function testDependabotAlertReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertReopened"), "DependabotAlertService.onDependabotAlertReopened should have fired");
}

@test:Config {}
function testGollumDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("gollum", "gollum");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("GollumService.onGollum"), "GollumService.onGollum should have fired");
}

@test:Config {}
function testInstallationCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationService.onInstallationCreated"), "InstallationService.onInstallationCreated should have fired");
}

@test:Config {}
function testInstallationDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationService.onInstallationDeleted"), "InstallationService.onInstallationDeleted should have fired");
}

@test:Config {}
function testInstallationNewPermissionsAcceptedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_new_permissions_accepted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationService.onInstallationNewPermissionsAccepted"), "InstallationService.onInstallationNewPermissionsAccepted should have fired");
}

@test:Config {}
function testInstallationSuspendDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_suspend");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationService.onInstallationSuspend"), "InstallationService.onInstallationSuspend should have fired");
}

@test:Config {}
function testInstallationUnsuspendDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_unsuspend");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationService.onInstallationUnsuspend"), "InstallationService.onInstallationUnsuspend should have fired");
}

@test:Config {}
function testInstallationRepositoriesAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation_repositories", "installation_repositories_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationRepositoriesService.onInstallationRepositoriesAdded"), "InstallationRepositoriesService.onInstallationRepositoriesAdded should have fired");
    map<json> bound = boundPayloadOf("InstallationRepositoriesService.onInstallationRepositoriesAdded");
    test:assertFalse(bound.hasKey("repositories_added"), "'repositories_added' should have bound to its camelCase field on InstallationRepositoriesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("repositories_removed"), "'repositories_removed' should have bound to its camelCase field on InstallationRepositoriesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("repository_selection"), "'repository_selection' should have bound to its camelCase field on InstallationRepositoriesPayload, not stayed a raw key");
}

@test:Config {}
function testInstallationRepositoriesRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation_repositories", "installation_repositories_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationRepositoriesService.onInstallationRepositoriesRemoved"), "InstallationRepositoriesService.onInstallationRepositoriesRemoved should have fired");
    map<json> bound = boundPayloadOf("InstallationRepositoriesService.onInstallationRepositoriesRemoved");
    test:assertFalse(bound.hasKey("repositories_added"), "'repositories_added' should have bound to its camelCase field on InstallationRepositoriesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("repositories_removed"), "'repositories_removed' should have bound to its camelCase field on InstallationRepositoriesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("repository_selection"), "'repository_selection' should have bound to its camelCase field on InstallationRepositoriesPayload, not stayed a raw key");
}

@test:Config {}
function testMembershipAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("membership", "membership_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MembershipService.onMembershipAdded"), "MembershipService.onMembershipAdded should have fired");
}

@test:Config {}
function testMembershipRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("membership", "membership_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MembershipService.onMembershipRemoved"), "MembershipService.onMembershipRemoved should have fired");
}

@test:Config {}
function testMergeGroupChecksRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("merge_group", "merge_group_checks_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MergeGroupService.onMergeGroupChecksRequested"), "MergeGroupService.onMergeGroupChecksRequested should have fired");
    map<json> bound = boundPayloadOf("MergeGroupService.onMergeGroupChecksRequested");
    test:assertFalse(bound.hasKey("merge_group"), "'merge_group' should have bound to its camelCase field on MergeGroupPayload, not stayed a raw key");
}

@test:Config {}
function testMergeGroupDestroyedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("merge_group", "merge_group_destroyed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MergeGroupService.onMergeGroupDestroyed"), "MergeGroupService.onMergeGroupDestroyed should have fired");
    map<json> bound = boundPayloadOf("MergeGroupService.onMergeGroupDestroyed");
    test:assertFalse(bound.hasKey("merge_group"), "'merge_group' should have bound to its camelCase field on MergeGroupPayload, not stayed a raw key");
}

@test:Config {}
function testPublicDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("public", "public");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PublicService.onPublic"), "PublicService.onPublic should have fired");
}

@test:Config {}
function testRepositoryDispatchDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_dispatch", "repository_dispatch");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryDispatchService.onRepositoryDispatch"), "RepositoryDispatchService.onRepositoryDispatch should have fired");
    map<json> bound = boundPayloadOf("RepositoryDispatchService.onRepositoryDispatch");
    test:assertFalse(bound.hasKey("client_payload"), "'client_payload' should have bound to its camelCase field on RepositoryDispatchPayload, not stayed a raw key");
}

@test:Config {}
function testSecretScanningAlertAssignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_assigned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertAssigned"), "SecretScanningAlertService.onSecretScanningAlertAssigned should have fired");
}

@test:Config {}
function testSecretScanningAlertCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertCreated"), "SecretScanningAlertService.onSecretScanningAlertCreated should have fired");
}

@test:Config {}
function testSecretScanningAlertPubliclyLeakedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_publicly_leaked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertPubliclyLeaked"), "SecretScanningAlertService.onSecretScanningAlertPubliclyLeaked should have fired");
}

@test:Config {}
function testSecretScanningAlertReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertReopened"), "SecretScanningAlertService.onSecretScanningAlertReopened should have fired");
}

@test:Config {}
function testSecretScanningAlertResolvedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_resolved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertResolved"), "SecretScanningAlertService.onSecretScanningAlertResolved should have fired");
}

@test:Config {}
function testSecretScanningAlertUnassignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_unassigned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertUnassigned"), "SecretScanningAlertService.onSecretScanningAlertUnassigned should have fired");
}

@test:Config {}
function testSecretScanningAlertValidatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_validated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertValidated"), "SecretScanningAlertService.onSecretScanningAlertValidated should have fired");
}

