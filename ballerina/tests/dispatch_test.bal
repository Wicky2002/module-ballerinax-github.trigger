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
import ballerina/io;
import ballerina/lang.runtime;
import ballerina/test;

const TRIGGER_TEST_SECRET = "trigger-test-secret";
const TRIGGER_TEST_PORT = 9091;
const TRIGGER_PAYLOAD_DIR = "tests/resources/trigger_payloads";

isolated map<boolean> triggerFired = {};
isolated map<json> boundPayloads = {};
isolated map<json> boundJson = {};

listener Listener triggerTestListener = check new ({webhookSecret: TRIGGER_TEST_SECRET}, TRIGGER_TEST_PORT);

final http:Client triggerClient = check new (string `http://localhost:${TRIGGER_TEST_PORT}`);

service PingService on triggerTestListener {
    isolated remote function onPing(PingPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PingService.onPing"] = received;
        }
        lock {
            boundPayloads["PingService.onPing"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PingService.onPing"] = true;
        }
    }
}

service PushService on triggerTestListener {
    isolated remote function onPush(PushPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PushService.onPush"] = received;
        }
        lock {
            boundPayloads["PushService.onPush"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PushService.onPush"] = true;
        }
    }
}

service PullRequestService on triggerTestListener {
    isolated remote function onPullRequestAssigned(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestAssigned"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestAssigned"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestAssigned"] = true;
        }
    }

    isolated remote function onPullRequestAutoMergeDisabled(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestAutoMergeDisabled"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestAutoMergeDisabled"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestAutoMergeDisabled"] = true;
        }
    }

    isolated remote function onPullRequestAutoMergeEnabled(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestAutoMergeEnabled"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestAutoMergeEnabled"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestAutoMergeEnabled"] = true;
        }
    }

    isolated remote function onPullRequestClosed(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestClosed"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestClosed"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestClosed"] = true;
        }
    }

    isolated remote function onPullRequestConvertedToDraft(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestConvertedToDraft"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestConvertedToDraft"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestConvertedToDraft"] = true;
        }
    }

    isolated remote function onPullRequestDemilestoned(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestDemilestoned"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestDemilestoned"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestDemilestoned"] = true;
        }
    }

    isolated remote function onPullRequestDequeued(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestDequeued"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestDequeued"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestDequeued"] = true;
        }
    }

    isolated remote function onPullRequestEdited(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestEdited"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestEdited"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestEdited"] = true;
        }
    }

    isolated remote function onPullRequestEnqueued(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestEnqueued"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestEnqueued"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestEnqueued"] = true;
        }
    }

    isolated remote function onPullRequestLabeled(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestLabeled"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestLabeled"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestLabeled"] = true;
        }
    }

    isolated remote function onPullRequestLocked(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestLocked"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestLocked"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestLocked"] = true;
        }
    }

    isolated remote function onPullRequestMilestoned(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestMilestoned"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestMilestoned"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestMilestoned"] = true;
        }
    }

    isolated remote function onPullRequestOpened(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestOpened"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestOpened"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestOpened"] = true;
        }
    }

    isolated remote function onPullRequestReadyForReview(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestReadyForReview"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestReadyForReview"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestReadyForReview"] = true;
        }
    }

    isolated remote function onPullRequestReopened(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestReopened"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestReopened"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestReopened"] = true;
        }
    }

    isolated remote function onPullRequestReviewRequestRemoved(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestReviewRequestRemoved"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestReviewRequestRemoved"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestReviewRequestRemoved"] = true;
        }
    }

    isolated remote function onPullRequestReviewRequested(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestReviewRequested"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestReviewRequested"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestReviewRequested"] = true;
        }
    }

    isolated remote function onPullRequestSynchronize(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestSynchronize"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestSynchronize"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestSynchronize"] = true;
        }
    }

    isolated remote function onPullRequestUnassigned(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestUnassigned"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestUnassigned"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestUnassigned"] = true;
        }
    }

    isolated remote function onPullRequestUnlabeled(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestUnlabeled"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestUnlabeled"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestUnlabeled"] = true;
        }
    }

    isolated remote function onPullRequestUnlocked(PullRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestService.onPullRequestUnlocked"] = received;
        }
        lock {
            boundPayloads["PullRequestService.onPullRequestUnlocked"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestService.onPullRequestUnlocked"] = true;
        }
    }
}

service IssuesService on triggerTestListener {
    isolated remote function onIssuesAssigned(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesAssigned"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesAssigned"] = true;
        }
    }

    isolated remote function onIssuesClosed(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesClosed"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesClosed"] = true;
        }
    }

    isolated remote function onIssuesDeleted(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesDeleted"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesDeleted"] = true;
        }
    }

    isolated remote function onIssuesDemilestoned(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesDemilestoned"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesDemilestoned"] = true;
        }
    }

    isolated remote function onIssuesEdited(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesEdited"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesEdited"] = true;
        }
    }

    isolated remote function onIssuesLabeled(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesLabeled"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesLabeled"] = true;
        }
    }

    isolated remote function onIssuesLocked(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesLocked"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesLocked"] = true;
        }
    }

    isolated remote function onIssuesMilestoned(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesMilestoned"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesMilestoned"] = true;
        }
    }

    isolated remote function onIssuesOpened(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesOpened"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesOpened"] = true;
        }
    }

    isolated remote function onIssuesPinned(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesPinned"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesPinned"] = true;
        }
    }

    isolated remote function onIssuesReopened(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesReopened"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesReopened"] = true;
        }
    }

    isolated remote function onIssuesTransferred(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesTransferred"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesTransferred"] = true;
        }
    }

    isolated remote function onIssuesTyped(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesTyped"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesTyped"] = true;
        }
    }

    isolated remote function onIssuesUnassigned(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesUnassigned"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesUnassigned"] = true;
        }
    }

    isolated remote function onIssuesUnlabeled(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesUnlabeled"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesUnlabeled"] = true;
        }
    }

    isolated remote function onIssuesUnlocked(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesUnlocked"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesUnlocked"] = true;
        }
    }

    isolated remote function onIssuesUnpinned(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesUnpinned"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesUnpinned"] = true;
        }
    }

    isolated remote function onIssuesUntyped(IssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssuesService.onIssuesUntyped"] = received;
        }
        lock {
            triggerFired["IssuesService.onIssuesUntyped"] = true;
        }
    }
}

service ReleaseService on triggerTestListener {
    isolated remote function onReleaseCreated(ReleasePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ReleaseService.onReleaseCreated"] = received;
        }
        lock {
            triggerFired["ReleaseService.onReleaseCreated"] = true;
        }
    }

    isolated remote function onReleaseDeleted(ReleasePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ReleaseService.onReleaseDeleted"] = received;
        }
        lock {
            triggerFired["ReleaseService.onReleaseDeleted"] = true;
        }
    }

    isolated remote function onReleaseEdited(ReleasePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ReleaseService.onReleaseEdited"] = received;
        }
        lock {
            triggerFired["ReleaseService.onReleaseEdited"] = true;
        }
    }

    isolated remote function onReleasePrereleased(ReleasePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ReleaseService.onReleasePrereleased"] = received;
        }
        lock {
            triggerFired["ReleaseService.onReleasePrereleased"] = true;
        }
    }

    isolated remote function onReleasePublished(ReleasePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ReleaseService.onReleasePublished"] = received;
        }
        lock {
            triggerFired["ReleaseService.onReleasePublished"] = true;
        }
    }

    isolated remote function onReleaseReleased(ReleasePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ReleaseService.onReleaseReleased"] = received;
        }
        lock {
            triggerFired["ReleaseService.onReleaseReleased"] = true;
        }
    }

    isolated remote function onReleaseUnpublished(ReleasePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ReleaseService.onReleaseUnpublished"] = received;
        }
        lock {
            triggerFired["ReleaseService.onReleaseUnpublished"] = true;
        }
    }
}

service IssueCommentService on triggerTestListener {
    isolated remote function onIssueCommentCreated(IssueCommentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssueCommentService.onIssueCommentCreated"] = received;
        }
        lock {
            triggerFired["IssueCommentService.onIssueCommentCreated"] = true;
        }
    }

    isolated remote function onIssueCommentDeleted(IssueCommentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssueCommentService.onIssueCommentDeleted"] = received;
        }
        lock {
            triggerFired["IssueCommentService.onIssueCommentDeleted"] = true;
        }
    }

    isolated remote function onIssueCommentEdited(IssueCommentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssueCommentService.onIssueCommentEdited"] = received;
        }
        lock {
            triggerFired["IssueCommentService.onIssueCommentEdited"] = true;
        }
    }

    isolated remote function onIssueCommentPinned(IssueCommentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssueCommentService.onIssueCommentPinned"] = received;
        }
        lock {
            triggerFired["IssueCommentService.onIssueCommentPinned"] = true;
        }
    }

    isolated remote function onIssueCommentUnpinned(IssueCommentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssueCommentService.onIssueCommentUnpinned"] = received;
        }
        lock {
            triggerFired["IssueCommentService.onIssueCommentUnpinned"] = true;
        }
    }
}

service PullRequestReviewService on triggerTestListener {
    isolated remote function onPullRequestReviewDismissed(PullRequestReviewPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestReviewService.onPullRequestReviewDismissed"] = received;
        }
        lock {
            boundPayloads["PullRequestReviewService.onPullRequestReviewDismissed"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestReviewService.onPullRequestReviewDismissed"] = true;
        }
    }

    isolated remote function onPullRequestReviewEdited(PullRequestReviewPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestReviewService.onPullRequestReviewEdited"] = received;
        }
        lock {
            boundPayloads["PullRequestReviewService.onPullRequestReviewEdited"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestReviewService.onPullRequestReviewEdited"] = true;
        }
    }

    isolated remote function onPullRequestReviewSubmitted(PullRequestReviewPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestReviewService.onPullRequestReviewSubmitted"] = received;
        }
        lock {
            boundPayloads["PullRequestReviewService.onPullRequestReviewSubmitted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestReviewService.onPullRequestReviewSubmitted"] = true;
        }
    }
}

service PullRequestReviewCommentService on triggerTestListener {
    isolated remote function onPullRequestReviewCommentCreated(PullRequestReviewCommentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestReviewCommentService.onPullRequestReviewCommentCreated"] = received;
        }
        lock {
            boundPayloads["PullRequestReviewCommentService.onPullRequestReviewCommentCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestReviewCommentService.onPullRequestReviewCommentCreated"] = true;
        }
    }

    isolated remote function onPullRequestReviewCommentDeleted(PullRequestReviewCommentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestReviewCommentService.onPullRequestReviewCommentDeleted"] = received;
        }
        lock {
            boundPayloads["PullRequestReviewCommentService.onPullRequestReviewCommentDeleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestReviewCommentService.onPullRequestReviewCommentDeleted"] = true;
        }
    }

    isolated remote function onPullRequestReviewCommentEdited(PullRequestReviewCommentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestReviewCommentService.onPullRequestReviewCommentEdited"] = received;
        }
        lock {
            boundPayloads["PullRequestReviewCommentService.onPullRequestReviewCommentEdited"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestReviewCommentService.onPullRequestReviewCommentEdited"] = true;
        }
    }
}

service CreateService on triggerTestListener {
    isolated remote function onCreate(CreatePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CreateService.onCreate"] = received;
        }
        lock {
            boundPayloads["CreateService.onCreate"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CreateService.onCreate"] = true;
        }
    }
}

service DeleteService on triggerTestListener {
    isolated remote function onDelete(DeletePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DeleteService.onDelete"] = received;
        }
        lock {
            boundPayloads["DeleteService.onDelete"] = payload.toJson().clone();
        }
        lock {
            triggerFired["DeleteService.onDelete"] = true;
        }
    }
}

service ForkService on triggerTestListener {
    isolated remote function onFork(ForkPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ForkService.onFork"] = received;
        }
        lock {
            triggerFired["ForkService.onFork"] = true;
        }
    }
}

service StarService on triggerTestListener {
    isolated remote function onStarCreated(StarPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["StarService.onStarCreated"] = received;
        }
        lock {
            boundPayloads["StarService.onStarCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["StarService.onStarCreated"] = true;
        }
    }

    isolated remote function onStarDeleted(StarPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["StarService.onStarDeleted"] = received;
        }
        lock {
            boundPayloads["StarService.onStarDeleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["StarService.onStarDeleted"] = true;
        }
    }
}

service WatchService on triggerTestListener {
    isolated remote function onWatchStarted(WatchPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["WatchService.onWatchStarted"] = received;
        }
        lock {
            triggerFired["WatchService.onWatchStarted"] = true;
        }
    }
}

service CheckRunService on triggerTestListener {
    isolated remote function onCheckRunCompleted(CheckRunPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CheckRunService.onCheckRunCompleted"] = received;
        }
        lock {
            boundPayloads["CheckRunService.onCheckRunCompleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CheckRunService.onCheckRunCompleted"] = true;
        }
    }

    isolated remote function onCheckRunCreated(CheckRunPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CheckRunService.onCheckRunCreated"] = received;
        }
        lock {
            boundPayloads["CheckRunService.onCheckRunCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CheckRunService.onCheckRunCreated"] = true;
        }
    }

    isolated remote function onCheckRunRequestedAction(CheckRunPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CheckRunService.onCheckRunRequestedAction"] = received;
        }
        lock {
            boundPayloads["CheckRunService.onCheckRunRequestedAction"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CheckRunService.onCheckRunRequestedAction"] = true;
        }
    }

    isolated remote function onCheckRunRerequested(CheckRunPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CheckRunService.onCheckRunRerequested"] = received;
        }
        lock {
            boundPayloads["CheckRunService.onCheckRunRerequested"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CheckRunService.onCheckRunRerequested"] = true;
        }
    }
}

service CheckSuiteService on triggerTestListener {
    isolated remote function onCheckSuiteCompleted(CheckSuitePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CheckSuiteService.onCheckSuiteCompleted"] = received;
        }
        lock {
            boundPayloads["CheckSuiteService.onCheckSuiteCompleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CheckSuiteService.onCheckSuiteCompleted"] = true;
        }
    }

    isolated remote function onCheckSuiteRequested(CheckSuitePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CheckSuiteService.onCheckSuiteRequested"] = received;
        }
        lock {
            boundPayloads["CheckSuiteService.onCheckSuiteRequested"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CheckSuiteService.onCheckSuiteRequested"] = true;
        }
    }

    isolated remote function onCheckSuiteRerequested(CheckSuitePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CheckSuiteService.onCheckSuiteRerequested"] = received;
        }
        lock {
            boundPayloads["CheckSuiteService.onCheckSuiteRerequested"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CheckSuiteService.onCheckSuiteRerequested"] = true;
        }
    }
}

service DeploymentService on triggerTestListener {
    isolated remote function onDeploymentCreated(DeploymentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DeploymentService.onDeploymentCreated"] = received;
        }
        lock {
            boundPayloads["DeploymentService.onDeploymentCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["DeploymentService.onDeploymentCreated"] = true;
        }
    }
}

service DeploymentStatusService on triggerTestListener {
    isolated remote function onDeploymentStatusCreated(DeploymentStatusPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DeploymentStatusService.onDeploymentStatusCreated"] = received;
        }
        lock {
            boundPayloads["DeploymentStatusService.onDeploymentStatusCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["DeploymentStatusService.onDeploymentStatusCreated"] = true;
        }
    }
}

service WorkflowRunService on triggerTestListener {
    isolated remote function onWorkflowRunCompleted(WorkflowRunPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["WorkflowRunService.onWorkflowRunCompleted"] = received;
        }
        lock {
            boundPayloads["WorkflowRunService.onWorkflowRunCompleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["WorkflowRunService.onWorkflowRunCompleted"] = true;
        }
    }

    isolated remote function onWorkflowRunInProgress(WorkflowRunPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["WorkflowRunService.onWorkflowRunInProgress"] = received;
        }
        lock {
            boundPayloads["WorkflowRunService.onWorkflowRunInProgress"] = payload.toJson().clone();
        }
        lock {
            triggerFired["WorkflowRunService.onWorkflowRunInProgress"] = true;
        }
    }

    isolated remote function onWorkflowRunRequested(WorkflowRunPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["WorkflowRunService.onWorkflowRunRequested"] = received;
        }
        lock {
            boundPayloads["WorkflowRunService.onWorkflowRunRequested"] = payload.toJson().clone();
        }
        lock {
            triggerFired["WorkflowRunService.onWorkflowRunRequested"] = true;
        }
    }
}

service WorkflowJobService on triggerTestListener {
    isolated remote function onWorkflowJobCompleted(WorkflowJobPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["WorkflowJobService.onWorkflowJobCompleted"] = received;
        }
        lock {
            boundPayloads["WorkflowJobService.onWorkflowJobCompleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["WorkflowJobService.onWorkflowJobCompleted"] = true;
        }
    }

    isolated remote function onWorkflowJobInProgress(WorkflowJobPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["WorkflowJobService.onWorkflowJobInProgress"] = received;
        }
        lock {
            boundPayloads["WorkflowJobService.onWorkflowJobInProgress"] = payload.toJson().clone();
        }
        lock {
            triggerFired["WorkflowJobService.onWorkflowJobInProgress"] = true;
        }
    }

    isolated remote function onWorkflowJobQueued(WorkflowJobPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["WorkflowJobService.onWorkflowJobQueued"] = received;
        }
        lock {
            boundPayloads["WorkflowJobService.onWorkflowJobQueued"] = payload.toJson().clone();
        }
        lock {
            triggerFired["WorkflowJobService.onWorkflowJobQueued"] = true;
        }
    }

    isolated remote function onWorkflowJobWaiting(WorkflowJobPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["WorkflowJobService.onWorkflowJobWaiting"] = received;
        }
        lock {
            boundPayloads["WorkflowJobService.onWorkflowJobWaiting"] = payload.toJson().clone();
        }
        lock {
            triggerFired["WorkflowJobService.onWorkflowJobWaiting"] = true;
        }
    }
}

service RepositoryService on triggerTestListener {
    isolated remote function onRepositoryArchived(RepositoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryService.onRepositoryArchived"] = received;
        }
        lock {
            triggerFired["RepositoryService.onRepositoryArchived"] = true;
        }
    }

    isolated remote function onRepositoryCreated(RepositoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryService.onRepositoryCreated"] = received;
        }
        lock {
            triggerFired["RepositoryService.onRepositoryCreated"] = true;
        }
    }

    isolated remote function onRepositoryDeleted(RepositoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryService.onRepositoryDeleted"] = received;
        }
        lock {
            triggerFired["RepositoryService.onRepositoryDeleted"] = true;
        }
    }

    isolated remote function onRepositoryEdited(RepositoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryService.onRepositoryEdited"] = received;
        }
        lock {
            triggerFired["RepositoryService.onRepositoryEdited"] = true;
        }
    }

    isolated remote function onRepositoryPrivatized(RepositoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryService.onRepositoryPrivatized"] = received;
        }
        lock {
            triggerFired["RepositoryService.onRepositoryPrivatized"] = true;
        }
    }

    isolated remote function onRepositoryPublicized(RepositoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryService.onRepositoryPublicized"] = received;
        }
        lock {
            triggerFired["RepositoryService.onRepositoryPublicized"] = true;
        }
    }

    isolated remote function onRepositoryRenamed(RepositoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryService.onRepositoryRenamed"] = received;
        }
        lock {
            triggerFired["RepositoryService.onRepositoryRenamed"] = true;
        }
    }

    isolated remote function onRepositoryTransferred(RepositoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryService.onRepositoryTransferred"] = received;
        }
        lock {
            triggerFired["RepositoryService.onRepositoryTransferred"] = true;
        }
    }

    isolated remote function onRepositoryUnarchived(RepositoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryService.onRepositoryUnarchived"] = received;
        }
        lock {
            triggerFired["RepositoryService.onRepositoryUnarchived"] = true;
        }
    }
}

service MemberService on triggerTestListener {
    isolated remote function onMemberAdded(MemberPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MemberService.onMemberAdded"] = received;
        }
        lock {
            triggerFired["MemberService.onMemberAdded"] = true;
        }
    }

    isolated remote function onMemberEdited(MemberPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MemberService.onMemberEdited"] = received;
        }
        lock {
            triggerFired["MemberService.onMemberEdited"] = true;
        }
    }

    isolated remote function onMemberRemoved(MemberPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MemberService.onMemberRemoved"] = received;
        }
        lock {
            triggerFired["MemberService.onMemberRemoved"] = true;
        }
    }
}

service DiscussionService on triggerTestListener {
    isolated remote function onDiscussionAnswered(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionAnswered"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionAnswered"] = true;
        }
    }

    isolated remote function onDiscussionCategoryChanged(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionCategoryChanged"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionCategoryChanged"] = true;
        }
    }

    isolated remote function onDiscussionClosed(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionClosed"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionClosed"] = true;
        }
    }

    isolated remote function onDiscussionCreated(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionCreated"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionCreated"] = true;
        }
    }

    isolated remote function onDiscussionDeleted(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionDeleted"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionDeleted"] = true;
        }
    }

    isolated remote function onDiscussionEdited(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionEdited"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionEdited"] = true;
        }
    }

    isolated remote function onDiscussionLabeled(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionLabeled"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionLabeled"] = true;
        }
    }

    isolated remote function onDiscussionLocked(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionLocked"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionLocked"] = true;
        }
    }

    isolated remote function onDiscussionPinned(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionPinned"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionPinned"] = true;
        }
    }

    isolated remote function onDiscussionReopened(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionReopened"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionReopened"] = true;
        }
    }

    isolated remote function onDiscussionTransferred(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionTransferred"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionTransferred"] = true;
        }
    }

    isolated remote function onDiscussionUnanswered(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionUnanswered"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionUnanswered"] = true;
        }
    }

    isolated remote function onDiscussionUnlabeled(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionUnlabeled"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionUnlabeled"] = true;
        }
    }

    isolated remote function onDiscussionUnlocked(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionUnlocked"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionUnlocked"] = true;
        }
    }

    isolated remote function onDiscussionUnpinned(DiscussionPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionService.onDiscussionUnpinned"] = received;
        }
        lock {
            triggerFired["DiscussionService.onDiscussionUnpinned"] = true;
        }
    }
}

service DiscussionCommentService on triggerTestListener {
    isolated remote function onDiscussionCommentCreated(DiscussionCommentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionCommentService.onDiscussionCommentCreated"] = received;
        }
        lock {
            triggerFired["DiscussionCommentService.onDiscussionCommentCreated"] = true;
        }
    }

    isolated remote function onDiscussionCommentDeleted(DiscussionCommentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionCommentService.onDiscussionCommentDeleted"] = received;
        }
        lock {
            triggerFired["DiscussionCommentService.onDiscussionCommentDeleted"] = true;
        }
    }

    isolated remote function onDiscussionCommentEdited(DiscussionCommentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DiscussionCommentService.onDiscussionCommentEdited"] = received;
        }
        lock {
            triggerFired["DiscussionCommentService.onDiscussionCommentEdited"] = true;
        }
    }
}

service LabelService on triggerTestListener {
    isolated remote function onLabelCreated(LabelPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["LabelService.onLabelCreated"] = received;
        }
        lock {
            triggerFired["LabelService.onLabelCreated"] = true;
        }
    }

    isolated remote function onLabelDeleted(LabelPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["LabelService.onLabelDeleted"] = received;
        }
        lock {
            triggerFired["LabelService.onLabelDeleted"] = true;
        }
    }

    isolated remote function onLabelEdited(LabelPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["LabelService.onLabelEdited"] = received;
        }
        lock {
            triggerFired["LabelService.onLabelEdited"] = true;
        }
    }
}

service MilestoneService on triggerTestListener {
    isolated remote function onMilestoneClosed(MilestonePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MilestoneService.onMilestoneClosed"] = received;
        }
        lock {
            triggerFired["MilestoneService.onMilestoneClosed"] = true;
        }
    }

    isolated remote function onMilestoneCreated(MilestonePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MilestoneService.onMilestoneCreated"] = received;
        }
        lock {
            triggerFired["MilestoneService.onMilestoneCreated"] = true;
        }
    }

    isolated remote function onMilestoneDeleted(MilestonePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MilestoneService.onMilestoneDeleted"] = received;
        }
        lock {
            triggerFired["MilestoneService.onMilestoneDeleted"] = true;
        }
    }

    isolated remote function onMilestoneEdited(MilestonePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MilestoneService.onMilestoneEdited"] = received;
        }
        lock {
            triggerFired["MilestoneService.onMilestoneEdited"] = true;
        }
    }

    isolated remote function onMilestoneOpened(MilestonePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MilestoneService.onMilestoneOpened"] = received;
        }
        lock {
            triggerFired["MilestoneService.onMilestoneOpened"] = true;
        }
    }
}

service StatusService on triggerTestListener {
    isolated remote function onStatus(StatusPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["StatusService.onStatus"] = received;
        }
        lock {
            boundPayloads["StatusService.onStatus"] = payload.toJson().clone();
        }
        lock {
            triggerFired["StatusService.onStatus"] = true;
        }
    }
}

service WorkflowDispatchService on triggerTestListener {
    isolated remote function onWorkflowDispatch(WorkflowDispatchPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["WorkflowDispatchService.onWorkflowDispatch"] = received;
        }
        lock {
            triggerFired["WorkflowDispatchService.onWorkflowDispatch"] = true;
        }
    }
}

service PullRequestReviewThreadService on triggerTestListener {
    isolated remote function onPullRequestReviewThreadResolved(PullRequestReviewThreadPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestReviewThreadService.onPullRequestReviewThreadResolved"] = received;
        }
        lock {
            boundPayloads["PullRequestReviewThreadService.onPullRequestReviewThreadResolved"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestReviewThreadService.onPullRequestReviewThreadResolved"] = true;
        }
    }

    isolated remote function onPullRequestReviewThreadUnresolved(PullRequestReviewThreadPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved"] = received;
        }
        lock {
            boundPayloads["PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved"] = true;
        }
    }
}

service TeamService on triggerTestListener {
    isolated remote function onTeamAddedToRepository(TeamPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["TeamService.onTeamAddedToRepository"] = received;
        }
        lock {
            triggerFired["TeamService.onTeamAddedToRepository"] = true;
        }
    }

    isolated remote function onTeamCreated(TeamPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["TeamService.onTeamCreated"] = received;
        }
        lock {
            triggerFired["TeamService.onTeamCreated"] = true;
        }
    }

    isolated remote function onTeamDeleted(TeamPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["TeamService.onTeamDeleted"] = received;
        }
        lock {
            triggerFired["TeamService.onTeamDeleted"] = true;
        }
    }

    isolated remote function onTeamEdited(TeamPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["TeamService.onTeamEdited"] = received;
        }
        lock {
            triggerFired["TeamService.onTeamEdited"] = true;
        }
    }

    isolated remote function onTeamRemovedFromRepository(TeamPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["TeamService.onTeamRemovedFromRepository"] = received;
        }
        lock {
            triggerFired["TeamService.onTeamRemovedFromRepository"] = true;
        }
    }
}

service OrganizationService on triggerTestListener {
    isolated remote function onOrganizationDeleted(OrganizationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["OrganizationService.onOrganizationDeleted"] = received;
        }
        lock {
            triggerFired["OrganizationService.onOrganizationDeleted"] = true;
        }
    }

    isolated remote function onOrganizationMemberAdded(OrganizationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["OrganizationService.onOrganizationMemberAdded"] = received;
        }
        lock {
            triggerFired["OrganizationService.onOrganizationMemberAdded"] = true;
        }
    }

    isolated remote function onOrganizationMemberInvited(OrganizationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["OrganizationService.onOrganizationMemberInvited"] = received;
        }
        lock {
            triggerFired["OrganizationService.onOrganizationMemberInvited"] = true;
        }
    }

    isolated remote function onOrganizationMemberRemoved(OrganizationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["OrganizationService.onOrganizationMemberRemoved"] = received;
        }
        lock {
            triggerFired["OrganizationService.onOrganizationMemberRemoved"] = true;
        }
    }

    isolated remote function onOrganizationRenamed(OrganizationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["OrganizationService.onOrganizationRenamed"] = received;
        }
        lock {
            triggerFired["OrganizationService.onOrganizationRenamed"] = true;
        }
    }
}

service DeploymentProtectionRuleService on triggerTestListener {
    isolated remote function onDeploymentProtectionRule(DeploymentProtectionRulePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DeploymentProtectionRuleService.onDeploymentProtectionRule"] = received;
        }
        lock {
            boundPayloads["DeploymentProtectionRuleService.onDeploymentProtectionRule"] = payload.toJson().clone();
        }
        lock {
            triggerFired["DeploymentProtectionRuleService.onDeploymentProtectionRule"] = true;
        }
    }
}

service DeploymentReviewService on triggerTestListener {
    isolated remote function onDeploymentReviewApproved(DeploymentReviewPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DeploymentReviewService.onDeploymentReviewApproved"] = received;
        }
        lock {
            boundPayloads["DeploymentReviewService.onDeploymentReviewApproved"] = payload.toJson().clone();
        }
        lock {
            triggerFired["DeploymentReviewService.onDeploymentReviewApproved"] = true;
        }
    }

    isolated remote function onDeploymentReviewRejected(DeploymentReviewPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DeploymentReviewService.onDeploymentReviewRejected"] = received;
        }
        lock {
            boundPayloads["DeploymentReviewService.onDeploymentReviewRejected"] = payload.toJson().clone();
        }
        lock {
            triggerFired["DeploymentReviewService.onDeploymentReviewRejected"] = true;
        }
    }

    isolated remote function onDeploymentReviewRequested(DeploymentReviewPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DeploymentReviewService.onDeploymentReviewRequested"] = received;
        }
        lock {
            boundPayloads["DeploymentReviewService.onDeploymentReviewRequested"] = payload.toJson().clone();
        }
        lock {
            triggerFired["DeploymentReviewService.onDeploymentReviewRequested"] = true;
        }
    }
}

service InstallationTargetService on triggerTestListener {
    isolated remote function onInstallationTargetRenamed(InstallationTargetPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["InstallationTargetService.onInstallationTargetRenamed"] = received;
        }
        lock {
            boundPayloads["InstallationTargetService.onInstallationTargetRenamed"] = payload.toJson().clone();
        }
        lock {
            triggerFired["InstallationTargetService.onInstallationTargetRenamed"] = true;
        }
    }
}

service IssueDependenciesService on triggerTestListener {
    isolated remote function onIssueDependenciesBlockedByAdded(IssueDependenciesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssueDependenciesService.onIssueDependenciesBlockedByAdded"] = received;
        }
        lock {
            boundPayloads["IssueDependenciesService.onIssueDependenciesBlockedByAdded"] = payload.toJson().clone();
        }
        lock {
            triggerFired["IssueDependenciesService.onIssueDependenciesBlockedByAdded"] = true;
        }
    }

    isolated remote function onIssueDependenciesBlockedByRemoved(IssueDependenciesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssueDependenciesService.onIssueDependenciesBlockedByRemoved"] = received;
        }
        lock {
            boundPayloads["IssueDependenciesService.onIssueDependenciesBlockedByRemoved"] = payload.toJson().clone();
        }
        lock {
            triggerFired["IssueDependenciesService.onIssueDependenciesBlockedByRemoved"] = true;
        }
    }

    isolated remote function onIssueDependenciesBlockingAdded(IssueDependenciesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssueDependenciesService.onIssueDependenciesBlockingAdded"] = received;
        }
        lock {
            boundPayloads["IssueDependenciesService.onIssueDependenciesBlockingAdded"] = payload.toJson().clone();
        }
        lock {
            triggerFired["IssueDependenciesService.onIssueDependenciesBlockingAdded"] = true;
        }
    }

    isolated remote function onIssueDependenciesBlockingRemoved(IssueDependenciesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["IssueDependenciesService.onIssueDependenciesBlockingRemoved"] = received;
        }
        lock {
            boundPayloads["IssueDependenciesService.onIssueDependenciesBlockingRemoved"] = payload.toJson().clone();
        }
        lock {
            triggerFired["IssueDependenciesService.onIssueDependenciesBlockingRemoved"] = true;
        }
    }
}

service MarketplacePurchaseService on triggerTestListener {
    isolated remote function onMarketplacePurchaseCancelled(MarketplacePurchasePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MarketplacePurchaseService.onMarketplacePurchaseCancelled"] = received;
        }
        lock {
            boundPayloads["MarketplacePurchaseService.onMarketplacePurchaseCancelled"] = payload.toJson().clone();
        }
        lock {
            triggerFired["MarketplacePurchaseService.onMarketplacePurchaseCancelled"] = true;
        }
    }

    isolated remote function onMarketplacePurchaseChanged(MarketplacePurchasePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MarketplacePurchaseService.onMarketplacePurchaseChanged"] = received;
        }
        lock {
            boundPayloads["MarketplacePurchaseService.onMarketplacePurchaseChanged"] = payload.toJson().clone();
        }
        lock {
            triggerFired["MarketplacePurchaseService.onMarketplacePurchaseChanged"] = true;
        }
    }

    isolated remote function onMarketplacePurchasePendingChange(MarketplacePurchasePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MarketplacePurchaseService.onMarketplacePurchasePendingChange"] = received;
        }
        lock {
            boundPayloads["MarketplacePurchaseService.onMarketplacePurchasePendingChange"] = payload.toJson().clone();
        }
        lock {
            triggerFired["MarketplacePurchaseService.onMarketplacePurchasePendingChange"] = true;
        }
    }

    isolated remote function onMarketplacePurchasePendingChangeCancelled(MarketplacePurchasePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MarketplacePurchaseService.onMarketplacePurchasePendingChangeCancelled"] = received;
        }
        lock {
            boundPayloads["MarketplacePurchaseService.onMarketplacePurchasePendingChangeCancelled"] = payload.toJson().clone();
        }
        lock {
            triggerFired["MarketplacePurchaseService.onMarketplacePurchasePendingChangeCancelled"] = true;
        }
    }

    isolated remote function onMarketplacePurchasePurchased(MarketplacePurchasePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MarketplacePurchaseService.onMarketplacePurchasePurchased"] = received;
        }
        lock {
            boundPayloads["MarketplacePurchaseService.onMarketplacePurchasePurchased"] = payload.toJson().clone();
        }
        lock {
            triggerFired["MarketplacePurchaseService.onMarketplacePurchasePurchased"] = true;
        }
    }
}

service PersonalAccessTokenRequestService on triggerTestListener {
    isolated remote function onPersonalAccessTokenRequestApproved(PersonalAccessTokenRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved"] = received;
        }
        lock {
            boundPayloads["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved"] = true;
        }
    }

    isolated remote function onPersonalAccessTokenRequestCancelled(PersonalAccessTokenRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled"] = received;
        }
        lock {
            boundPayloads["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled"] = true;
        }
    }

    isolated remote function onPersonalAccessTokenRequestCreated(PersonalAccessTokenRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated"] = received;
        }
        lock {
            boundPayloads["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated"] = true;
        }
    }

    isolated remote function onPersonalAccessTokenRequestDenied(PersonalAccessTokenRequestPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied"] = received;
        }
        lock {
            boundPayloads["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied"] = payload.toJson().clone();
        }
        lock {
            triggerFired["PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied"] = true;
        }
    }
}

service ProjectService on triggerTestListener {
    isolated remote function onProjectClosed(ProjectPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectService.onProjectClosed"] = received;
        }
        lock {
            triggerFired["ProjectService.onProjectClosed"] = true;
        }
    }

    isolated remote function onProjectCreated(ProjectPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectService.onProjectCreated"] = received;
        }
        lock {
            triggerFired["ProjectService.onProjectCreated"] = true;
        }
    }

    isolated remote function onProjectDeleted(ProjectPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectService.onProjectDeleted"] = received;
        }
        lock {
            triggerFired["ProjectService.onProjectDeleted"] = true;
        }
    }

    isolated remote function onProjectEdited(ProjectPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectService.onProjectEdited"] = received;
        }
        lock {
            triggerFired["ProjectService.onProjectEdited"] = true;
        }
    }

    isolated remote function onProjectReopened(ProjectPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectService.onProjectReopened"] = received;
        }
        lock {
            triggerFired["ProjectService.onProjectReopened"] = true;
        }
    }
}

service ProjectCardService on triggerTestListener {
    isolated remote function onProjectCardConverted(ProjectCardPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectCardService.onProjectCardConverted"] = received;
        }
        lock {
            boundPayloads["ProjectCardService.onProjectCardConverted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectCardService.onProjectCardConverted"] = true;
        }
    }

    isolated remote function onProjectCardCreated(ProjectCardPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectCardService.onProjectCardCreated"] = received;
        }
        lock {
            boundPayloads["ProjectCardService.onProjectCardCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectCardService.onProjectCardCreated"] = true;
        }
    }

    isolated remote function onProjectCardDeleted(ProjectCardPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectCardService.onProjectCardDeleted"] = received;
        }
        lock {
            boundPayloads["ProjectCardService.onProjectCardDeleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectCardService.onProjectCardDeleted"] = true;
        }
    }

    isolated remote function onProjectCardEdited(ProjectCardPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectCardService.onProjectCardEdited"] = received;
        }
        lock {
            boundPayloads["ProjectCardService.onProjectCardEdited"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectCardService.onProjectCardEdited"] = true;
        }
    }

    isolated remote function onProjectCardMoved(ProjectCardPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectCardService.onProjectCardMoved"] = received;
        }
        lock {
            boundPayloads["ProjectCardService.onProjectCardMoved"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectCardService.onProjectCardMoved"] = true;
        }
    }
}

service ProjectColumnService on triggerTestListener {
    isolated remote function onProjectColumnCreated(ProjectColumnPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectColumnService.onProjectColumnCreated"] = received;
        }
        lock {
            boundPayloads["ProjectColumnService.onProjectColumnCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectColumnService.onProjectColumnCreated"] = true;
        }
    }

    isolated remote function onProjectColumnDeleted(ProjectColumnPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectColumnService.onProjectColumnDeleted"] = received;
        }
        lock {
            boundPayloads["ProjectColumnService.onProjectColumnDeleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectColumnService.onProjectColumnDeleted"] = true;
        }
    }

    isolated remote function onProjectColumnEdited(ProjectColumnPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectColumnService.onProjectColumnEdited"] = received;
        }
        lock {
            boundPayloads["ProjectColumnService.onProjectColumnEdited"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectColumnService.onProjectColumnEdited"] = true;
        }
    }

    isolated remote function onProjectColumnMoved(ProjectColumnPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectColumnService.onProjectColumnMoved"] = received;
        }
        lock {
            boundPayloads["ProjectColumnService.onProjectColumnMoved"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectColumnService.onProjectColumnMoved"] = true;
        }
    }
}

service RepositoryImportService on triggerTestListener {
    isolated remote function onRepositoryImport(RepositoryImportPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryImportService.onRepositoryImport"] = received;
        }
        lock {
            triggerFired["RepositoryImportService.onRepositoryImport"] = true;
        }
    }
}

service SubIssuesService on triggerTestListener {
    isolated remote function onSubIssuesParentIssueAdded(SubIssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SubIssuesService.onSubIssuesParentIssueAdded"] = received;
        }
        lock {
            boundPayloads["SubIssuesService.onSubIssuesParentIssueAdded"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SubIssuesService.onSubIssuesParentIssueAdded"] = true;
        }
    }

    isolated remote function onSubIssuesParentIssueRemoved(SubIssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SubIssuesService.onSubIssuesParentIssueRemoved"] = received;
        }
        lock {
            boundPayloads["SubIssuesService.onSubIssuesParentIssueRemoved"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SubIssuesService.onSubIssuesParentIssueRemoved"] = true;
        }
    }

    isolated remote function onSubIssuesSubIssueAdded(SubIssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SubIssuesService.onSubIssuesSubIssueAdded"] = received;
        }
        lock {
            boundPayloads["SubIssuesService.onSubIssuesSubIssueAdded"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SubIssuesService.onSubIssuesSubIssueAdded"] = true;
        }
    }

    isolated remote function onSubIssuesSubIssueRemoved(SubIssuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SubIssuesService.onSubIssuesSubIssueRemoved"] = received;
        }
        lock {
            boundPayloads["SubIssuesService.onSubIssuesSubIssueRemoved"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SubIssuesService.onSubIssuesSubIssueRemoved"] = true;
        }
    }
}

service PageBuildService on triggerTestListener {
    isolated remote function onPageBuild(PageBuildPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PageBuildService.onPageBuild"] = received;
        }
        lock {
            triggerFired["PageBuildService.onPageBuild"] = true;
        }
    }
}

service TeamAddService on triggerTestListener {
    isolated remote function onTeamAdd(TeamAddPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["TeamAddService.onTeamAdd"] = received;
        }
        lock {
            triggerFired["TeamAddService.onTeamAdd"] = true;
        }
    }
}

service SponsorshipService on triggerTestListener {
    isolated remote function onSponsorshipCancelled(SponsorshipPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SponsorshipService.onSponsorshipCancelled"] = received;
        }
        lock {
            boundPayloads["SponsorshipService.onSponsorshipCancelled"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SponsorshipService.onSponsorshipCancelled"] = true;
        }
    }

    isolated remote function onSponsorshipCreated(SponsorshipPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SponsorshipService.onSponsorshipCreated"] = received;
        }
        lock {
            boundPayloads["SponsorshipService.onSponsorshipCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SponsorshipService.onSponsorshipCreated"] = true;
        }
    }

    isolated remote function onSponsorshipEdited(SponsorshipPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SponsorshipService.onSponsorshipEdited"] = received;
        }
        lock {
            boundPayloads["SponsorshipService.onSponsorshipEdited"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SponsorshipService.onSponsorshipEdited"] = true;
        }
    }

    isolated remote function onSponsorshipPendingCancellation(SponsorshipPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SponsorshipService.onSponsorshipPendingCancellation"] = received;
        }
        lock {
            boundPayloads["SponsorshipService.onSponsorshipPendingCancellation"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SponsorshipService.onSponsorshipPendingCancellation"] = true;
        }
    }

    isolated remote function onSponsorshipPendingTierChange(SponsorshipPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SponsorshipService.onSponsorshipPendingTierChange"] = received;
        }
        lock {
            boundPayloads["SponsorshipService.onSponsorshipPendingTierChange"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SponsorshipService.onSponsorshipPendingTierChange"] = true;
        }
    }

    isolated remote function onSponsorshipTierChanged(SponsorshipPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SponsorshipService.onSponsorshipTierChanged"] = received;
        }
        lock {
            boundPayloads["SponsorshipService.onSponsorshipTierChanged"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SponsorshipService.onSponsorshipTierChanged"] = true;
        }
    }
}

service SecurityAndAnalysisService on triggerTestListener {
    isolated remote function onSecurityAndAnalysis(SecurityAndAnalysisPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecurityAndAnalysisService.onSecurityAndAnalysis"] = received;
        }
        lock {
            triggerFired["SecurityAndAnalysisService.onSecurityAndAnalysis"] = true;
        }
    }
}

service BranchProtectionConfigurationService on triggerTestListener {
    isolated remote function onBranchProtectionConfigurationDisabled(BranchProtectionConfigurationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["BranchProtectionConfigurationService.onBranchProtectionConfigurationDisabled"] = received;
        }
        lock {
            triggerFired["BranchProtectionConfigurationService.onBranchProtectionConfigurationDisabled"] = true;
        }
    }

    isolated remote function onBranchProtectionConfigurationEnabled(BranchProtectionConfigurationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["BranchProtectionConfigurationService.onBranchProtectionConfigurationEnabled"] = received;
        }
        lock {
            triggerFired["BranchProtectionConfigurationService.onBranchProtectionConfigurationEnabled"] = true;
        }
    }
}

service CustomPropertyService on triggerTestListener {
    isolated remote function onCustomPropertyCreated(CustomPropertyPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CustomPropertyService.onCustomPropertyCreated"] = received;
        }
        lock {
            triggerFired["CustomPropertyService.onCustomPropertyCreated"] = true;
        }
    }

    isolated remote function onCustomPropertyDeleted(CustomPropertyPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CustomPropertyService.onCustomPropertyDeleted"] = received;
        }
        lock {
            triggerFired["CustomPropertyService.onCustomPropertyDeleted"] = true;
        }
    }

    isolated remote function onCustomPropertyPromoteToEnterprise(CustomPropertyPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CustomPropertyService.onCustomPropertyPromoteToEnterprise"] = received;
        }
        lock {
            triggerFired["CustomPropertyService.onCustomPropertyPromoteToEnterprise"] = true;
        }
    }

    isolated remote function onCustomPropertyUpdated(CustomPropertyPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CustomPropertyService.onCustomPropertyUpdated"] = received;
        }
        lock {
            triggerFired["CustomPropertyService.onCustomPropertyUpdated"] = true;
        }
    }
}

service CustomPropertyValuesService on triggerTestListener {
    isolated remote function onCustomPropertyValuesUpdated(CustomPropertyValuesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CustomPropertyValuesService.onCustomPropertyValuesUpdated"] = received;
        }
        lock {
            boundPayloads["CustomPropertyValuesService.onCustomPropertyValuesUpdated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CustomPropertyValuesService.onCustomPropertyValuesUpdated"] = true;
        }
    }
}

service ProjectsV2itemService on triggerTestListener {
    isolated remote function onProjectsV2ItemArchived('ProjectsV2ItemPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2itemService.onProjectsV2ItemArchived"] = received;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemArchived"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemArchived"] = true;
        }
    }

    isolated remote function onProjectsV2ItemConverted('ProjectsV2ItemPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2itemService.onProjectsV2ItemConverted"] = received;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemConverted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemConverted"] = true;
        }
    }

    isolated remote function onProjectsV2ItemCreated('ProjectsV2ItemPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2itemService.onProjectsV2ItemCreated"] = received;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemCreated"] = true;
        }
    }

    isolated remote function onProjectsV2ItemDeleted('ProjectsV2ItemPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2itemService.onProjectsV2ItemDeleted"] = received;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemDeleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemDeleted"] = true;
        }
    }

    isolated remote function onProjectsV2ItemEdited('ProjectsV2ItemPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2itemService.onProjectsV2ItemEdited"] = received;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemEdited"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemEdited"] = true;
        }
    }

    isolated remote function onProjectsV2ItemReordered('ProjectsV2ItemPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2itemService.onProjectsV2ItemReordered"] = received;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemReordered"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemReordered"] = true;
        }
    }

    isolated remote function onProjectsV2ItemRestored('ProjectsV2ItemPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2itemService.onProjectsV2ItemRestored"] = received;
        }
        lock {
            boundPayloads["ProjectsV2itemService.onProjectsV2ItemRestored"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2itemService.onProjectsV2ItemRestored"] = true;
        }
    }
}

service ProjectsV2statusUpdateService on triggerTestListener {
    isolated remote function onProjectsV2StatusUpdateCreated('ProjectsV2StatusUpdatePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated"] = received;
        }
        lock {
            boundPayloads["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated"] = true;
        }
    }

    isolated remote function onProjectsV2StatusUpdateDeleted('ProjectsV2StatusUpdatePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted"] = received;
        }
        lock {
            boundPayloads["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted"] = true;
        }
    }

    isolated remote function onProjectsV2StatusUpdateEdited('ProjectsV2StatusUpdatePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited"] = received;
        }
        lock {
            boundPayloads["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited"] = true;
        }
    }
}

service RegistryPackageService on triggerTestListener {
    isolated remote function onRegistryPackagePublished(RegistryPackagePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RegistryPackageService.onRegistryPackagePublished"] = received;
        }
        lock {
            boundPayloads["RegistryPackageService.onRegistryPackagePublished"] = payload.toJson().clone();
        }
        lock {
            triggerFired["RegistryPackageService.onRegistryPackagePublished"] = true;
        }
    }

    isolated remote function onRegistryPackageUpdated(RegistryPackagePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RegistryPackageService.onRegistryPackageUpdated"] = received;
        }
        lock {
            boundPayloads["RegistryPackageService.onRegistryPackageUpdated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["RegistryPackageService.onRegistryPackageUpdated"] = true;
        }
    }
}

service RepositoryRulesetService on triggerTestListener {
    isolated remote function onRepositoryRulesetCreated(RepositoryRulesetPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryRulesetService.onRepositoryRulesetCreated"] = received;
        }
        lock {
            boundPayloads["RepositoryRulesetService.onRepositoryRulesetCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["RepositoryRulesetService.onRepositoryRulesetCreated"] = true;
        }
    }

    isolated remote function onRepositoryRulesetDeleted(RepositoryRulesetPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryRulesetService.onRepositoryRulesetDeleted"] = received;
        }
        lock {
            boundPayloads["RepositoryRulesetService.onRepositoryRulesetDeleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["RepositoryRulesetService.onRepositoryRulesetDeleted"] = true;
        }
    }

    isolated remote function onRepositoryRulesetEdited(RepositoryRulesetPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryRulesetService.onRepositoryRulesetEdited"] = received;
        }
        lock {
            boundPayloads["RepositoryRulesetService.onRepositoryRulesetEdited"] = payload.toJson().clone();
        }
        lock {
            triggerFired["RepositoryRulesetService.onRepositoryRulesetEdited"] = true;
        }
    }
}

service RepositoryVulnerabilityAlertService on triggerTestListener {
    isolated remote function onRepositoryVulnerabilityAlertCreate(RepositoryVulnerabilityAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertCreate"] = received;
        }
        lock {
            triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertCreate"] = true;
        }
    }

    isolated remote function onRepositoryVulnerabilityAlertDismiss(RepositoryVulnerabilityAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertDismiss"] = received;
        }
        lock {
            triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertDismiss"] = true;
        }
    }

    isolated remote function onRepositoryVulnerabilityAlertReopen(RepositoryVulnerabilityAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertReopen"] = received;
        }
        lock {
            triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertReopen"] = true;
        }
    }

    isolated remote function onRepositoryVulnerabilityAlertResolve(RepositoryVulnerabilityAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertResolve"] = received;
        }
        lock {
            triggerFired["RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertResolve"] = true;
        }
    }
}

service SecretScanningAlertLocationService on triggerTestListener {
    isolated remote function onSecretScanningAlertLocation(SecretScanningAlertLocationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecretScanningAlertLocationService.onSecretScanningAlertLocation"] = received;
        }
        lock {
            triggerFired["SecretScanningAlertLocationService.onSecretScanningAlertLocation"] = true;
        }
    }
}

service SecretScanningScanService on triggerTestListener {
    isolated remote function onSecretScanningScan(SecretScanningScanPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecretScanningScanService.onSecretScanningScan"] = received;
        }
        lock {
            boundPayloads["SecretScanningScanService.onSecretScanningScan"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SecretScanningScanService.onSecretScanningScan"] = true;
        }
    }
}

service BranchProtectionRuleService on triggerTestListener {
    isolated remote function onBranchProtectionRuleCreated(BranchProtectionRulePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["BranchProtectionRuleService.onBranchProtectionRuleCreated"] = received;
        }
        lock {
            triggerFired["BranchProtectionRuleService.onBranchProtectionRuleCreated"] = true;
        }
    }

    isolated remote function onBranchProtectionRuleDeleted(BranchProtectionRulePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["BranchProtectionRuleService.onBranchProtectionRuleDeleted"] = received;
        }
        lock {
            triggerFired["BranchProtectionRuleService.onBranchProtectionRuleDeleted"] = true;
        }
    }

    isolated remote function onBranchProtectionRuleEdited(BranchProtectionRulePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["BranchProtectionRuleService.onBranchProtectionRuleEdited"] = received;
        }
        lock {
            triggerFired["BranchProtectionRuleService.onBranchProtectionRuleEdited"] = true;
        }
    }
}

service CodeScanningAlertService on triggerTestListener {
    isolated remote function onCodeScanningAlertAppearedInBranch(CodeScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CodeScanningAlertService.onCodeScanningAlertAppearedInBranch"] = received;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertAppearedInBranch"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertAppearedInBranch"] = true;
        }
    }

    isolated remote function onCodeScanningAlertClosedByUser(CodeScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CodeScanningAlertService.onCodeScanningAlertClosedByUser"] = received;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertClosedByUser"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertClosedByUser"] = true;
        }
    }

    isolated remote function onCodeScanningAlertCreated(CodeScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CodeScanningAlertService.onCodeScanningAlertCreated"] = received;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertCreated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertCreated"] = true;
        }
    }

    isolated remote function onCodeScanningAlertFixed(CodeScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CodeScanningAlertService.onCodeScanningAlertFixed"] = received;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertFixed"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertFixed"] = true;
        }
    }

    isolated remote function onCodeScanningAlertReopened(CodeScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CodeScanningAlertService.onCodeScanningAlertReopened"] = received;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertReopened"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertReopened"] = true;
        }
    }

    isolated remote function onCodeScanningAlertReopenedByUser(CodeScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CodeScanningAlertService.onCodeScanningAlertReopenedByUser"] = received;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertReopenedByUser"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertReopenedByUser"] = true;
        }
    }

    isolated remote function onCodeScanningAlertUpdatedAssignment(CodeScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment"] = received;
        }
        lock {
            boundPayloads["CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment"] = payload.toJson().clone();
        }
        lock {
            triggerFired["CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment"] = true;
        }
    }
}

service DeployKeyService on triggerTestListener {
    isolated remote function onDeployKeyCreated(DeployKeyPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DeployKeyService.onDeployKeyCreated"] = received;
        }
        lock {
            triggerFired["DeployKeyService.onDeployKeyCreated"] = true;
        }
    }

    isolated remote function onDeployKeyDeleted(DeployKeyPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DeployKeyService.onDeployKeyDeleted"] = received;
        }
        lock {
            triggerFired["DeployKeyService.onDeployKeyDeleted"] = true;
        }
    }
}

service GithubAppAuthorizationService on triggerTestListener {
    isolated remote function onGithubAppAuthorizationRevoked(GithubAppAuthorizationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["GithubAppAuthorizationService.onGithubAppAuthorizationRevoked"] = received;
        }
        lock {
            triggerFired["GithubAppAuthorizationService.onGithubAppAuthorizationRevoked"] = true;
        }
    }
}

service MetaService on triggerTestListener {
    isolated remote function onMetaDeleted(MetaPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MetaService.onMetaDeleted"] = received;
        }
        lock {
            boundPayloads["MetaService.onMetaDeleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["MetaService.onMetaDeleted"] = true;
        }
    }
}

service OrgBlockService on triggerTestListener {
    isolated remote function onOrgBlockBlocked(OrgBlockPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["OrgBlockService.onOrgBlockBlocked"] = received;
        }
        lock {
            boundPayloads["OrgBlockService.onOrgBlockBlocked"] = payload.toJson().clone();
        }
        lock {
            triggerFired["OrgBlockService.onOrgBlockBlocked"] = true;
        }
    }

    isolated remote function onOrgBlockUnblocked(OrgBlockPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["OrgBlockService.onOrgBlockUnblocked"] = received;
        }
        lock {
            boundPayloads["OrgBlockService.onOrgBlockUnblocked"] = payload.toJson().clone();
        }
        lock {
            triggerFired["OrgBlockService.onOrgBlockUnblocked"] = true;
        }
    }
}

service PackageService on triggerTestListener {
    isolated remote function onPackagePublished(PackagePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PackageService.onPackagePublished"] = received;
        }
        lock {
            triggerFired["PackageService.onPackagePublished"] = true;
        }
    }

    isolated remote function onPackageUpdated(PackagePayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PackageService.onPackageUpdated"] = received;
        }
        lock {
            triggerFired["PackageService.onPackageUpdated"] = true;
        }
    }
}

service ProjectsV2Service on triggerTestListener {
    isolated remote function onProjectsV2Closed('ProjectsV2Payload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2Service.onProjectsV2Closed"] = received;
        }
        lock {
            boundPayloads["ProjectsV2Service.onProjectsV2Closed"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2Service.onProjectsV2Closed"] = true;
        }
    }

    isolated remote function onProjectsV2Created('ProjectsV2Payload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2Service.onProjectsV2Created"] = received;
        }
        lock {
            boundPayloads["ProjectsV2Service.onProjectsV2Created"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2Service.onProjectsV2Created"] = true;
        }
    }

    isolated remote function onProjectsV2Deleted('ProjectsV2Payload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2Service.onProjectsV2Deleted"] = received;
        }
        lock {
            boundPayloads["ProjectsV2Service.onProjectsV2Deleted"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2Service.onProjectsV2Deleted"] = true;
        }
    }

    isolated remote function onProjectsV2Edited('ProjectsV2Payload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2Service.onProjectsV2Edited"] = received;
        }
        lock {
            boundPayloads["ProjectsV2Service.onProjectsV2Edited"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2Service.onProjectsV2Edited"] = true;
        }
    }

    isolated remote function onProjectsV2Reopened('ProjectsV2Payload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["ProjectsV2Service.onProjectsV2Reopened"] = received;
        }
        lock {
            boundPayloads["ProjectsV2Service.onProjectsV2Reopened"] = payload.toJson().clone();
        }
        lock {
            triggerFired["ProjectsV2Service.onProjectsV2Reopened"] = true;
        }
    }
}

service RepositoryAdvisoryService on triggerTestListener {
    isolated remote function onRepositoryAdvisoryPublished(RepositoryAdvisoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryAdvisoryService.onRepositoryAdvisoryPublished"] = received;
        }
        lock {
            boundPayloads["RepositoryAdvisoryService.onRepositoryAdvisoryPublished"] = payload.toJson().clone();
        }
        lock {
            triggerFired["RepositoryAdvisoryService.onRepositoryAdvisoryPublished"] = true;
        }
    }

    isolated remote function onRepositoryAdvisoryReported(RepositoryAdvisoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryAdvisoryService.onRepositoryAdvisoryReported"] = received;
        }
        lock {
            boundPayloads["RepositoryAdvisoryService.onRepositoryAdvisoryReported"] = payload.toJson().clone();
        }
        lock {
            triggerFired["RepositoryAdvisoryService.onRepositoryAdvisoryReported"] = true;
        }
    }
}

service SecurityAdvisoryService on triggerTestListener {
    isolated remote function onSecurityAdvisoryPublished(SecurityAdvisoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecurityAdvisoryService.onSecurityAdvisoryPublished"] = received;
        }
        lock {
            boundPayloads["SecurityAdvisoryService.onSecurityAdvisoryPublished"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SecurityAdvisoryService.onSecurityAdvisoryPublished"] = true;
        }
    }

    isolated remote function onSecurityAdvisoryUpdated(SecurityAdvisoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecurityAdvisoryService.onSecurityAdvisoryUpdated"] = received;
        }
        lock {
            boundPayloads["SecurityAdvisoryService.onSecurityAdvisoryUpdated"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SecurityAdvisoryService.onSecurityAdvisoryUpdated"] = true;
        }
    }

    isolated remote function onSecurityAdvisoryWithdrawn(SecurityAdvisoryPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecurityAdvisoryService.onSecurityAdvisoryWithdrawn"] = received;
        }
        lock {
            boundPayloads["SecurityAdvisoryService.onSecurityAdvisoryWithdrawn"] = payload.toJson().clone();
        }
        lock {
            triggerFired["SecurityAdvisoryService.onSecurityAdvisoryWithdrawn"] = true;
        }
    }
}

service CommitCommentService on triggerTestListener {
    isolated remote function onCommitCommentCreated(CommitCommentPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["CommitCommentService.onCommitCommentCreated"] = received;
        }
        lock {
            triggerFired["CommitCommentService.onCommitCommentCreated"] = true;
        }
    }
}

service DependabotAlertService on triggerTestListener {
    isolated remote function onDependabotAlertAssigneesChanged(DependabotAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DependabotAlertService.onDependabotAlertAssigneesChanged"] = received;
        }
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertAssigneesChanged"] = true;
        }
    }

    isolated remote function onDependabotAlertAutoDismissed(DependabotAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DependabotAlertService.onDependabotAlertAutoDismissed"] = received;
        }
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertAutoDismissed"] = true;
        }
    }

    isolated remote function onDependabotAlertAutoReopened(DependabotAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DependabotAlertService.onDependabotAlertAutoReopened"] = received;
        }
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertAutoReopened"] = true;
        }
    }

    isolated remote function onDependabotAlertCreated(DependabotAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DependabotAlertService.onDependabotAlertCreated"] = received;
        }
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertCreated"] = true;
        }
    }

    isolated remote function onDependabotAlertDismissed(DependabotAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DependabotAlertService.onDependabotAlertDismissed"] = received;
        }
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertDismissed"] = true;
        }
    }

    isolated remote function onDependabotAlertFixed(DependabotAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DependabotAlertService.onDependabotAlertFixed"] = received;
        }
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertFixed"] = true;
        }
    }

    isolated remote function onDependabotAlertReintroduced(DependabotAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DependabotAlertService.onDependabotAlertReintroduced"] = received;
        }
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertReintroduced"] = true;
        }
    }

    isolated remote function onDependabotAlertReopened(DependabotAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["DependabotAlertService.onDependabotAlertReopened"] = received;
        }
        lock {
            triggerFired["DependabotAlertService.onDependabotAlertReopened"] = true;
        }
    }
}

service GollumService on triggerTestListener {
    isolated remote function onGollum(GollumPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["GollumService.onGollum"] = received;
        }
        lock {
            triggerFired["GollumService.onGollum"] = true;
        }
    }
}

service InstallationService on triggerTestListener {
    isolated remote function onInstallationCreated(InstallationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["InstallationService.onInstallationCreated"] = received;
        }
        lock {
            triggerFired["InstallationService.onInstallationCreated"] = true;
        }
    }

    isolated remote function onInstallationDeleted(InstallationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["InstallationService.onInstallationDeleted"] = received;
        }
        lock {
            triggerFired["InstallationService.onInstallationDeleted"] = true;
        }
    }

    isolated remote function onInstallationNewPermissionsAccepted(InstallationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["InstallationService.onInstallationNewPermissionsAccepted"] = received;
        }
        lock {
            triggerFired["InstallationService.onInstallationNewPermissionsAccepted"] = true;
        }
    }

    isolated remote function onInstallationSuspend(InstallationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["InstallationService.onInstallationSuspend"] = received;
        }
        lock {
            triggerFired["InstallationService.onInstallationSuspend"] = true;
        }
    }

    isolated remote function onInstallationUnsuspend(InstallationPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["InstallationService.onInstallationUnsuspend"] = received;
        }
        lock {
            triggerFired["InstallationService.onInstallationUnsuspend"] = true;
        }
    }
}

service InstallationRepositoriesService on triggerTestListener {
    isolated remote function onInstallationRepositoriesAdded(InstallationRepositoriesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["InstallationRepositoriesService.onInstallationRepositoriesAdded"] = received;
        }
        lock {
            boundPayloads["InstallationRepositoriesService.onInstallationRepositoriesAdded"] = payload.toJson().clone();
        }
        lock {
            triggerFired["InstallationRepositoriesService.onInstallationRepositoriesAdded"] = true;
        }
    }

    isolated remote function onInstallationRepositoriesRemoved(InstallationRepositoriesPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["InstallationRepositoriesService.onInstallationRepositoriesRemoved"] = received;
        }
        lock {
            boundPayloads["InstallationRepositoriesService.onInstallationRepositoriesRemoved"] = payload.toJson().clone();
        }
        lock {
            triggerFired["InstallationRepositoriesService.onInstallationRepositoriesRemoved"] = true;
        }
    }
}

service MembershipService on triggerTestListener {
    isolated remote function onMembershipAdded(MembershipPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MembershipService.onMembershipAdded"] = received;
        }
        lock {
            triggerFired["MembershipService.onMembershipAdded"] = true;
        }
    }

    isolated remote function onMembershipRemoved(MembershipPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MembershipService.onMembershipRemoved"] = received;
        }
        lock {
            triggerFired["MembershipService.onMembershipRemoved"] = true;
        }
    }
}

service MergeGroupService on triggerTestListener {
    isolated remote function onMergeGroupChecksRequested(MergeGroupPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MergeGroupService.onMergeGroupChecksRequested"] = received;
        }
        lock {
            boundPayloads["MergeGroupService.onMergeGroupChecksRequested"] = payload.toJson().clone();
        }
        lock {
            triggerFired["MergeGroupService.onMergeGroupChecksRequested"] = true;
        }
    }

    isolated remote function onMergeGroupDestroyed(MergeGroupPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["MergeGroupService.onMergeGroupDestroyed"] = received;
        }
        lock {
            boundPayloads["MergeGroupService.onMergeGroupDestroyed"] = payload.toJson().clone();
        }
        lock {
            triggerFired["MergeGroupService.onMergeGroupDestroyed"] = true;
        }
    }
}

service PublicService on triggerTestListener {
    isolated remote function onPublic(PublicPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["PublicService.onPublic"] = received;
        }
        lock {
            triggerFired["PublicService.onPublic"] = true;
        }
    }
}

service RepositoryDispatchService on triggerTestListener {
    isolated remote function onRepositoryDispatch(RepositoryDispatchPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["RepositoryDispatchService.onRepositoryDispatch"] = received;
        }
        lock {
            boundPayloads["RepositoryDispatchService.onRepositoryDispatch"] = payload.toJson().clone();
        }
        lock {
            triggerFired["RepositoryDispatchService.onRepositoryDispatch"] = true;
        }
    }
}

service SecretScanningAlertService on triggerTestListener {
    isolated remote function onSecretScanningAlertAssigned(SecretScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecretScanningAlertService.onSecretScanningAlertAssigned"] = received;
        }
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertAssigned"] = true;
        }
    }

    isolated remote function onSecretScanningAlertCreated(SecretScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecretScanningAlertService.onSecretScanningAlertCreated"] = received;
        }
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertCreated"] = true;
        }
    }

    isolated remote function onSecretScanningAlertPubliclyLeaked(SecretScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecretScanningAlertService.onSecretScanningAlertPubliclyLeaked"] = received;
        }
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertPubliclyLeaked"] = true;
        }
    }

    isolated remote function onSecretScanningAlertReopened(SecretScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecretScanningAlertService.onSecretScanningAlertReopened"] = received;
        }
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertReopened"] = true;
        }
    }

    isolated remote function onSecretScanningAlertResolved(SecretScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecretScanningAlertService.onSecretScanningAlertResolved"] = received;
        }
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertResolved"] = true;
        }
    }

    isolated remote function onSecretScanningAlertUnassigned(SecretScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecretScanningAlertService.onSecretScanningAlertUnassigned"] = received;
        }
        lock {
            triggerFired["SecretScanningAlertService.onSecretScanningAlertUnassigned"] = true;
        }
    }

    isolated remote function onSecretScanningAlertValidated(SecretScanningAlertPayload payload) returns error? {
        readonly & json received = jsondata:toJson(payload).cloneReadOnly();
        lock {
            boundJson["SecretScanningAlertService.onSecretScanningAlertValidated"] = received;
        }
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

function boundJsonOf(string trackerKey) returns json {
    lock {
        return boundJson[trackerKey].clone();
    }
}

function deliveredEvent(json bound, json fixture) returns json {
    return fixture is json[] && fixture.length() == 1 && bound is map<json>
        ? fixture[0] : fixture;
}

function assertBindsFixture(json bound, json fixture, string at) {
    if fixture is map<json> {
        test:assertTrue(bound is map<json>, string `${at} should have bound to an object`);
        if bound is map<json> {
            foreach [string, json] [key, value] in fixture.entries() {
                assertBindsFixture(bound[key], value, string `${at}.${key}`);
            }
        }
    } else if fixture is json[] {
        test:assertTrue(bound is json[] && bound.length() == fixture.length(),
                string `${at} should have bound to an array of ${fixture.length()}`);
        if bound is json[] && bound.length() == fixture.length() {
            foreach int i in 0 ..< fixture.length() {
                assertBindsFixture(bound[i], fixture[i], string `${at}[${i}]`);
            }
        }
    } else if fixture is int|float|decimal && bound is int|float|decimal {
        test:assertEquals(<decimal>bound, <decimal>fixture,
                string `${at} should have bound unchanged`);
    } else {
        test:assertEquals(bound, fixture,
                string `${at} should have bound unchanged`);
    }
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/ping.json`);
    json received = boundJsonOf("PingService.onPing");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PingPayload");
    map<json> bound = boundPayloadOf("PingService.onPing");
    test:assertFalse(bound.hasKey("hook_id"), "'hook_id' should have bound to its camelCase field on PingPayload, not stayed a raw key");
}

@test:Config {}
function testPushDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("push", "push");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PushService.onPush"), "PushService.onPush should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/push.json`);
    json received = boundJsonOf("PushService.onPush");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PushPayload");
    map<json> bound = boundPayloadOf("PushService.onPush");
    test:assertFalse(bound.hasKey("base_ref"), "'base_ref' should have bound to its camelCase field on PushPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("head_commit"), "'head_commit' should have bound to its camelCase field on PushPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestAssignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_assigned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestAssigned"), "PullRequestService.onPullRequestAssigned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_assigned.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestAssigned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestAssigned");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestAutoMergeDisabledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_auto_merge_disabled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestAutoMergeDisabled"), "PullRequestService.onPullRequestAutoMergeDisabled should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_auto_merge_disabled.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestAutoMergeDisabled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestAutoMergeDisabled");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestAutoMergeEnabledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_auto_merge_enabled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestAutoMergeEnabled"), "PullRequestService.onPullRequestAutoMergeEnabled should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_auto_merge_enabled.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestAutoMergeEnabled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestAutoMergeEnabled");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_closed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestClosed"), "PullRequestService.onPullRequestClosed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_closed.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestClosed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestClosed");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestConvertedToDraftDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_converted_to_draft");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestConvertedToDraft"), "PullRequestService.onPullRequestConvertedToDraft should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_converted_to_draft.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestConvertedToDraft");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestConvertedToDraft");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestDemilestonedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_demilestoned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestDemilestoned"), "PullRequestService.onPullRequestDemilestoned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_demilestoned.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestDemilestoned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestDemilestoned");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestDequeuedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_dequeued");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestDequeued"), "PullRequestService.onPullRequestDequeued should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_dequeued.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestDequeued");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestDequeued");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestEdited"), "PullRequestService.onPullRequestEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_edited.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestEdited");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestEnqueuedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_enqueued");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestEnqueued"), "PullRequestService.onPullRequestEnqueued should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_enqueued.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestEnqueued");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestEnqueued");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestLabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_labeled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestLabeled"), "PullRequestService.onPullRequestLabeled should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_labeled.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestLabeled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestLabeled");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestLockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_locked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestLocked"), "PullRequestService.onPullRequestLocked should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_locked.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestLocked");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestLocked");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestMilestonedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_milestoned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestMilestoned"), "PullRequestService.onPullRequestMilestoned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_milestoned.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestMilestoned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestMilestoned");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestOpenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_opened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestOpened"), "PullRequestService.onPullRequestOpened should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_opened.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestOpened");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestOpened");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReadyForReviewDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_ready_for_review");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestReadyForReview"), "PullRequestService.onPullRequestReadyForReview should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_ready_for_review.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestReadyForReview");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestReadyForReview");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestReopened"), "PullRequestService.onPullRequestReopened should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_reopened.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestReopened");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestReopened");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewRequestRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_review_request_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestReviewRequestRemoved"), "PullRequestService.onPullRequestReviewRequestRemoved should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_review_request_removed.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestReviewRequestRemoved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestReviewRequestRemoved");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_review_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestReviewRequested"), "PullRequestService.onPullRequestReviewRequested should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_review_requested.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestReviewRequested");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestReviewRequested");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestSynchronizeDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_synchronize");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestSynchronize"), "PullRequestService.onPullRequestSynchronize should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_synchronize.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestSynchronize");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestSynchronize");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestUnassignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_unassigned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestUnassigned"), "PullRequestService.onPullRequestUnassigned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_unassigned.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestUnassigned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestUnassigned");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestUnlabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_unlabeled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestUnlabeled"), "PullRequestService.onPullRequestUnlabeled should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_unlabeled.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestUnlabeled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestUnlabeled");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestUnlockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request", "pull_request_unlocked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestService.onPullRequestUnlocked"), "PullRequestService.onPullRequestUnlocked should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_unlocked.json`);
    json received = boundJsonOf("PullRequestService.onPullRequestUnlocked");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestPayload");
    map<json> bound = boundPayloadOf("PullRequestService.onPullRequestUnlocked");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_reviewer"), "'requested_reviewer' should have bound to its camelCase field on PullRequestPayload, not stayed a raw key");
}

@test:Config {}
function testIssuesAssignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_assigned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesAssigned"), "IssuesService.onIssuesAssigned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_assigned.json`);
    json received = boundJsonOf("IssuesService.onIssuesAssigned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_closed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesClosed"), "IssuesService.onIssuesClosed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_closed.json`);
    json received = boundJsonOf("IssuesService.onIssuesClosed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesDeleted"), "IssuesService.onIssuesDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_deleted.json`);
    json received = boundJsonOf("IssuesService.onIssuesDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesDemilestonedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_demilestoned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesDemilestoned"), "IssuesService.onIssuesDemilestoned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_demilestoned.json`);
    json received = boundJsonOf("IssuesService.onIssuesDemilestoned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesEdited"), "IssuesService.onIssuesEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_edited.json`);
    json received = boundJsonOf("IssuesService.onIssuesEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesLabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_labeled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesLabeled"), "IssuesService.onIssuesLabeled should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_labeled.json`);
    json received = boundJsonOf("IssuesService.onIssuesLabeled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesLockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_locked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesLocked"), "IssuesService.onIssuesLocked should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_locked.json`);
    json received = boundJsonOf("IssuesService.onIssuesLocked");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesMilestonedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_milestoned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesMilestoned"), "IssuesService.onIssuesMilestoned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_milestoned.json`);
    json received = boundJsonOf("IssuesService.onIssuesMilestoned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesOpenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_opened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesOpened"), "IssuesService.onIssuesOpened should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_opened.json`);
    json received = boundJsonOf("IssuesService.onIssuesOpened");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesPinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_pinned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesPinned"), "IssuesService.onIssuesPinned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_pinned.json`);
    json received = boundJsonOf("IssuesService.onIssuesPinned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesReopened"), "IssuesService.onIssuesReopened should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_reopened.json`);
    json received = boundJsonOf("IssuesService.onIssuesReopened");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesTransferredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_transferred");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesTransferred"), "IssuesService.onIssuesTransferred should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_transferred.json`);
    json received = boundJsonOf("IssuesService.onIssuesTransferred");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesTypedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_typed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesTyped"), "IssuesService.onIssuesTyped should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_typed.json`);
    json received = boundJsonOf("IssuesService.onIssuesTyped");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesUnassignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_unassigned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesUnassigned"), "IssuesService.onIssuesUnassigned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_unassigned.json`);
    json received = boundJsonOf("IssuesService.onIssuesUnassigned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesUnlabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_unlabeled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesUnlabeled"), "IssuesService.onIssuesUnlabeled should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_unlabeled.json`);
    json received = boundJsonOf("IssuesService.onIssuesUnlabeled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesUnlockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_unlocked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesUnlocked"), "IssuesService.onIssuesUnlocked should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_unlocked.json`);
    json received = boundJsonOf("IssuesService.onIssuesUnlocked");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesUnpinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_unpinned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesUnpinned"), "IssuesService.onIssuesUnpinned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_unpinned.json`);
    json received = boundJsonOf("IssuesService.onIssuesUnpinned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testIssuesUntypedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issues", "issues_untyped");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssuesService.onIssuesUntyped"), "IssuesService.onIssuesUntyped should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issues_untyped.json`);
    json received = boundJsonOf("IssuesService.onIssuesUntyped");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssuesPayload");
}

@test:Config {}
function testReleaseCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleaseCreated"), "ReleaseService.onReleaseCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/release_created.json`);
    json received = boundJsonOf("ReleaseService.onReleaseCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ReleasePayload");
}

@test:Config {}
function testReleaseDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleaseDeleted"), "ReleaseService.onReleaseDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/release_deleted.json`);
    json received = boundJsonOf("ReleaseService.onReleaseDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ReleasePayload");
}

@test:Config {}
function testReleaseEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleaseEdited"), "ReleaseService.onReleaseEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/release_edited.json`);
    json received = boundJsonOf("ReleaseService.onReleaseEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ReleasePayload");
}

@test:Config {}
function testReleasePrereleasedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_prereleased");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleasePrereleased"), "ReleaseService.onReleasePrereleased should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/release_prereleased.json`);
    json received = boundJsonOf("ReleaseService.onReleasePrereleased");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ReleasePayload");
}

@test:Config {}
function testReleasePublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_published");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleasePublished"), "ReleaseService.onReleasePublished should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/release_published.json`);
    json received = boundJsonOf("ReleaseService.onReleasePublished");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ReleasePayload");
}

@test:Config {}
function testReleaseReleasedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_released");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleaseReleased"), "ReleaseService.onReleaseReleased should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/release_released.json`);
    json received = boundJsonOf("ReleaseService.onReleaseReleased");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ReleasePayload");
}

@test:Config {}
function testReleaseUnpublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("release", "release_unpublished");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ReleaseService.onReleaseUnpublished"), "ReleaseService.onReleaseUnpublished should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/release_unpublished.json`);
    json received = boundJsonOf("ReleaseService.onReleaseUnpublished");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ReleasePayload");
}

@test:Config {}
function testIssueCommentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueCommentService.onIssueCommentCreated"), "IssueCommentService.onIssueCommentCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issue_comment_created.json`);
    json received = boundJsonOf("IssueCommentService.onIssueCommentCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssueCommentPayload");
}

@test:Config {}
function testIssueCommentDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueCommentService.onIssueCommentDeleted"), "IssueCommentService.onIssueCommentDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issue_comment_deleted.json`);
    json received = boundJsonOf("IssueCommentService.onIssueCommentDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssueCommentPayload");
}

@test:Config {}
function testIssueCommentEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueCommentService.onIssueCommentEdited"), "IssueCommentService.onIssueCommentEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issue_comment_edited.json`);
    json received = boundJsonOf("IssueCommentService.onIssueCommentEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssueCommentPayload");
}

@test:Config {}
function testIssueCommentPinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_pinned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueCommentService.onIssueCommentPinned"), "IssueCommentService.onIssueCommentPinned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issue_comment_pinned.json`);
    json received = boundJsonOf("IssueCommentService.onIssueCommentPinned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssueCommentPayload");
}

@test:Config {}
function testIssueCommentUnpinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_comment", "issue_comment_unpinned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueCommentService.onIssueCommentUnpinned"), "IssueCommentService.onIssueCommentUnpinned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issue_comment_unpinned.json`);
    json received = boundJsonOf("IssueCommentService.onIssueCommentUnpinned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssueCommentPayload");
}

@test:Config {}
function testPullRequestReviewDismissedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review", "pull_request_review_dismissed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewService.onPullRequestReviewDismissed"), "PullRequestReviewService.onPullRequestReviewDismissed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_review_dismissed.json`);
    json received = boundJsonOf("PullRequestReviewService.onPullRequestReviewDismissed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestReviewPayload");
    map<json> bound = boundPayloadOf("PullRequestReviewService.onPullRequestReviewDismissed");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review", "pull_request_review_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewService.onPullRequestReviewEdited"), "PullRequestReviewService.onPullRequestReviewEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_review_edited.json`);
    json received = boundJsonOf("PullRequestReviewService.onPullRequestReviewEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestReviewPayload");
    map<json> bound = boundPayloadOf("PullRequestReviewService.onPullRequestReviewEdited");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewSubmittedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review", "pull_request_review_submitted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewService.onPullRequestReviewSubmitted"), "PullRequestReviewService.onPullRequestReviewSubmitted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_review_submitted.json`);
    json received = boundJsonOf("PullRequestReviewService.onPullRequestReviewSubmitted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestReviewPayload");
    map<json> bound = boundPayloadOf("PullRequestReviewService.onPullRequestReviewSubmitted");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewCommentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_comment", "pull_request_review_comment_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewCommentService.onPullRequestReviewCommentCreated"), "PullRequestReviewCommentService.onPullRequestReviewCommentCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_review_comment_created.json`);
    json received = boundJsonOf("PullRequestReviewCommentService.onPullRequestReviewCommentCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestReviewCommentPayload");
    map<json> bound = boundPayloadOf("PullRequestReviewCommentService.onPullRequestReviewCommentCreated");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewCommentPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewCommentDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_comment", "pull_request_review_comment_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewCommentService.onPullRequestReviewCommentDeleted"), "PullRequestReviewCommentService.onPullRequestReviewCommentDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_review_comment_deleted.json`);
    json received = boundJsonOf("PullRequestReviewCommentService.onPullRequestReviewCommentDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestReviewCommentPayload");
    map<json> bound = boundPayloadOf("PullRequestReviewCommentService.onPullRequestReviewCommentDeleted");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewCommentPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewCommentEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_comment", "pull_request_review_comment_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewCommentService.onPullRequestReviewCommentEdited"), "PullRequestReviewCommentService.onPullRequestReviewCommentEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_review_comment_edited.json`);
    json received = boundJsonOf("PullRequestReviewCommentService.onPullRequestReviewCommentEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestReviewCommentPayload");
    map<json> bound = boundPayloadOf("PullRequestReviewCommentService.onPullRequestReviewCommentEdited");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewCommentPayload, not stayed a raw key");
}

@test:Config {}
function testCreateDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("create", "create");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CreateService.onCreate"), "CreateService.onCreate should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/create.json`);
    json received = boundJsonOf("CreateService.onCreate");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CreatePayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/delete.json`);
    json received = boundJsonOf("DeleteService.onDelete");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DeletePayload");
    map<json> bound = boundPayloadOf("DeleteService.onDelete");
    test:assertFalse(bound.hasKey("ref_type"), "'ref_type' should have bound to its camelCase field on DeletePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("pusher_type"), "'pusher_type' should have bound to its camelCase field on DeletePayload, not stayed a raw key");
}

@test:Config {}
function testForkDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("fork", "fork");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ForkService.onFork"), "ForkService.onFork should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/fork.json`);
    json received = boundJsonOf("ForkService.onFork");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ForkPayload");
}

@test:Config {}
function testStarCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("star", "star_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("StarService.onStarCreated"), "StarService.onStarCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/star_created.json`);
    json received = boundJsonOf("StarService.onStarCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "StarPayload");
    map<json> bound = boundPayloadOf("StarService.onStarCreated");
    test:assertFalse(bound.hasKey("starred_at"), "'starred_at' should have bound to its camelCase field on StarPayload, not stayed a raw key");
}

@test:Config {}
function testStarDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("star", "star_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("StarService.onStarDeleted"), "StarService.onStarDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/star_deleted.json`);
    json received = boundJsonOf("StarService.onStarDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "StarPayload");
    map<json> bound = boundPayloadOf("StarService.onStarDeleted");
    test:assertFalse(bound.hasKey("starred_at"), "'starred_at' should have bound to its camelCase field on StarPayload, not stayed a raw key");
}

@test:Config {}
function testWatchStartedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("watch", "watch_started");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WatchService.onWatchStarted"), "WatchService.onWatchStarted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/watch_started.json`);
    json received = boundJsonOf("WatchService.onWatchStarted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "WatchPayload");
}

@test:Config {}
function testCheckRunCompletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_run", "check_run_completed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckRunService.onCheckRunCompleted"), "CheckRunService.onCheckRunCompleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/check_run_completed.json`);
    json received = boundJsonOf("CheckRunService.onCheckRunCompleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CheckRunPayload");
    map<json> bound = boundPayloadOf("CheckRunService.onCheckRunCompleted");
    test:assertFalse(bound.hasKey("check_run"), "'check_run' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_action"), "'requested_action' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
}

@test:Config {}
function testCheckRunCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_run", "check_run_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckRunService.onCheckRunCreated"), "CheckRunService.onCheckRunCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/check_run_created.json`);
    json received = boundJsonOf("CheckRunService.onCheckRunCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CheckRunPayload");
    map<json> bound = boundPayloadOf("CheckRunService.onCheckRunCreated");
    test:assertFalse(bound.hasKey("check_run"), "'check_run' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_action"), "'requested_action' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
}

@test:Config {}
function testCheckRunRequestedActionDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_run", "check_run_requested_action");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckRunService.onCheckRunRequestedAction"), "CheckRunService.onCheckRunRequestedAction should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/check_run_requested_action.json`);
    json received = boundJsonOf("CheckRunService.onCheckRunRequestedAction");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CheckRunPayload");
    map<json> bound = boundPayloadOf("CheckRunService.onCheckRunRequestedAction");
    test:assertFalse(bound.hasKey("check_run"), "'check_run' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_action"), "'requested_action' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
}

@test:Config {}
function testCheckRunRerequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_run", "check_run_rerequested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckRunService.onCheckRunRerequested"), "CheckRunService.onCheckRunRerequested should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/check_run_rerequested.json`);
    json received = boundJsonOf("CheckRunService.onCheckRunRerequested");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CheckRunPayload");
    map<json> bound = boundPayloadOf("CheckRunService.onCheckRunRerequested");
    test:assertFalse(bound.hasKey("check_run"), "'check_run' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("requested_action"), "'requested_action' should have bound to its camelCase field on CheckRunPayload, not stayed a raw key");
}

@test:Config {}
function testCheckSuiteCompletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_suite", "check_suite_completed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckSuiteService.onCheckSuiteCompleted"), "CheckSuiteService.onCheckSuiteCompleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/check_suite_completed.json`);
    json received = boundJsonOf("CheckSuiteService.onCheckSuiteCompleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CheckSuitePayload");
    map<json> bound = boundPayloadOf("CheckSuiteService.onCheckSuiteCompleted");
    test:assertFalse(bound.hasKey("check_suite"), "'check_suite' should have bound to its camelCase field on CheckSuitePayload, not stayed a raw key");
}

@test:Config {}
function testCheckSuiteRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_suite", "check_suite_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckSuiteService.onCheckSuiteRequested"), "CheckSuiteService.onCheckSuiteRequested should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/check_suite_requested.json`);
    json received = boundJsonOf("CheckSuiteService.onCheckSuiteRequested");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CheckSuitePayload");
    map<json> bound = boundPayloadOf("CheckSuiteService.onCheckSuiteRequested");
    test:assertFalse(bound.hasKey("check_suite"), "'check_suite' should have bound to its camelCase field on CheckSuitePayload, not stayed a raw key");
}

@test:Config {}
function testCheckSuiteRerequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("check_suite", "check_suite_rerequested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CheckSuiteService.onCheckSuiteRerequested"), "CheckSuiteService.onCheckSuiteRerequested should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/check_suite_rerequested.json`);
    json received = boundJsonOf("CheckSuiteService.onCheckSuiteRerequested");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CheckSuitePayload");
    map<json> bound = boundPayloadOf("CheckSuiteService.onCheckSuiteRerequested");
    test:assertFalse(bound.hasKey("check_suite"), "'check_suite' should have bound to its camelCase field on CheckSuitePayload, not stayed a raw key");
}

@test:Config {}
function testDeploymentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment", "deployment_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeploymentService.onDeploymentCreated"), "DeploymentService.onDeploymentCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/deployment_created.json`);
    json received = boundJsonOf("DeploymentService.onDeploymentCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DeploymentPayload");
    map<json> bound = boundPayloadOf("DeploymentService.onDeploymentCreated");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on DeploymentPayload, not stayed a raw key");
}

@test:Config {}
function testDeploymentStatusCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_status", "deployment_status_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeploymentStatusService.onDeploymentStatusCreated"), "DeploymentStatusService.onDeploymentStatusCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/deployment_status_created.json`);
    json received = boundJsonOf("DeploymentStatusService.onDeploymentStatusCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DeploymentStatusPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/workflow_run_completed.json`);
    json received = boundJsonOf("WorkflowRunService.onWorkflowRunCompleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "WorkflowRunPayload");
    map<json> bound = boundPayloadOf("WorkflowRunService.onWorkflowRunCompleted");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on WorkflowRunPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowRunInProgressDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_run", "workflow_run_in_progress");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowRunService.onWorkflowRunInProgress"), "WorkflowRunService.onWorkflowRunInProgress should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/workflow_run_in_progress.json`);
    json received = boundJsonOf("WorkflowRunService.onWorkflowRunInProgress");
    assertBindsFixture(received, deliveredEvent(received, fixture), "WorkflowRunPayload");
    map<json> bound = boundPayloadOf("WorkflowRunService.onWorkflowRunInProgress");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on WorkflowRunPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowRunRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_run", "workflow_run_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowRunService.onWorkflowRunRequested"), "WorkflowRunService.onWorkflowRunRequested should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/workflow_run_requested.json`);
    json received = boundJsonOf("WorkflowRunService.onWorkflowRunRequested");
    assertBindsFixture(received, deliveredEvent(received, fixture), "WorkflowRunPayload");
    map<json> bound = boundPayloadOf("WorkflowRunService.onWorkflowRunRequested");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on WorkflowRunPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowJobCompletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_job", "workflow_job_completed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowJobService.onWorkflowJobCompleted"), "WorkflowJobService.onWorkflowJobCompleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/workflow_job_completed.json`);
    json received = boundJsonOf("WorkflowJobService.onWorkflowJobCompleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "WorkflowJobPayload");
    map<json> bound = boundPayloadOf("WorkflowJobService.onWorkflowJobCompleted");
    test:assertFalse(bound.hasKey("workflow_job"), "'workflow_job' should have bound to its camelCase field on WorkflowJobPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowJobInProgressDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_job", "workflow_job_in_progress");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowJobService.onWorkflowJobInProgress"), "WorkflowJobService.onWorkflowJobInProgress should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/workflow_job_in_progress.json`);
    json received = boundJsonOf("WorkflowJobService.onWorkflowJobInProgress");
    assertBindsFixture(received, deliveredEvent(received, fixture), "WorkflowJobPayload");
    map<json> bound = boundPayloadOf("WorkflowJobService.onWorkflowJobInProgress");
    test:assertFalse(bound.hasKey("workflow_job"), "'workflow_job' should have bound to its camelCase field on WorkflowJobPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowJobQueuedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_job", "workflow_job_queued");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowJobService.onWorkflowJobQueued"), "WorkflowJobService.onWorkflowJobQueued should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/workflow_job_queued.json`);
    json received = boundJsonOf("WorkflowJobService.onWorkflowJobQueued");
    assertBindsFixture(received, deliveredEvent(received, fixture), "WorkflowJobPayload");
    map<json> bound = boundPayloadOf("WorkflowJobService.onWorkflowJobQueued");
    test:assertFalse(bound.hasKey("workflow_job"), "'workflow_job' should have bound to its camelCase field on WorkflowJobPayload, not stayed a raw key");
}

@test:Config {}
function testWorkflowJobWaitingDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("workflow_job", "workflow_job_waiting");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("WorkflowJobService.onWorkflowJobWaiting"), "WorkflowJobService.onWorkflowJobWaiting should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/workflow_job_waiting.json`);
    json received = boundJsonOf("WorkflowJobService.onWorkflowJobWaiting");
    assertBindsFixture(received, deliveredEvent(received, fixture), "WorkflowJobPayload");
    map<json> bound = boundPayloadOf("WorkflowJobService.onWorkflowJobWaiting");
    test:assertFalse(bound.hasKey("workflow_job"), "'workflow_job' should have bound to its camelCase field on WorkflowJobPayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryArchivedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_archived");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryArchived"), "RepositoryService.onRepositoryArchived should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_archived.json`);
    json received = boundJsonOf("RepositoryService.onRepositoryArchived");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryPayload");
}

@test:Config {}
function testRepositoryCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryCreated"), "RepositoryService.onRepositoryCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_created.json`);
    json received = boundJsonOf("RepositoryService.onRepositoryCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryPayload");
}

@test:Config {}
function testRepositoryDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryDeleted"), "RepositoryService.onRepositoryDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_deleted.json`);
    json received = boundJsonOf("RepositoryService.onRepositoryDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryPayload");
}

@test:Config {}
function testRepositoryEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryEdited"), "RepositoryService.onRepositoryEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_edited.json`);
    json received = boundJsonOf("RepositoryService.onRepositoryEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryPayload");
}

@test:Config {}
function testRepositoryPrivatizedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_privatized");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryPrivatized"), "RepositoryService.onRepositoryPrivatized should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_privatized.json`);
    json received = boundJsonOf("RepositoryService.onRepositoryPrivatized");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryPayload");
}

@test:Config {}
function testRepositoryPublicizedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_publicized");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryPublicized"), "RepositoryService.onRepositoryPublicized should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_publicized.json`);
    json received = boundJsonOf("RepositoryService.onRepositoryPublicized");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryPayload");
}

@test:Config {}
function testRepositoryRenamedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_renamed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryRenamed"), "RepositoryService.onRepositoryRenamed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_renamed.json`);
    json received = boundJsonOf("RepositoryService.onRepositoryRenamed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryPayload");
}

@test:Config {}
function testRepositoryTransferredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_transferred");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryTransferred"), "RepositoryService.onRepositoryTransferred should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_transferred.json`);
    json received = boundJsonOf("RepositoryService.onRepositoryTransferred");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryPayload");
}

@test:Config {}
function testRepositoryUnarchivedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository", "repository_unarchived");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryService.onRepositoryUnarchived"), "RepositoryService.onRepositoryUnarchived should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_unarchived.json`);
    json received = boundJsonOf("RepositoryService.onRepositoryUnarchived");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryPayload");
}

@test:Config {}
function testMemberAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("member", "member_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MemberService.onMemberAdded"), "MemberService.onMemberAdded should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/member_added.json`);
    json received = boundJsonOf("MemberService.onMemberAdded");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MemberPayload");
}

@test:Config {}
function testMemberEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("member", "member_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MemberService.onMemberEdited"), "MemberService.onMemberEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/member_edited.json`);
    json received = boundJsonOf("MemberService.onMemberEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MemberPayload");
}

@test:Config {}
function testMemberRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("member", "member_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MemberService.onMemberRemoved"), "MemberService.onMemberRemoved should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/member_removed.json`);
    json received = boundJsonOf("MemberService.onMemberRemoved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MemberPayload");
}

@test:Config {}
function testDiscussionAnsweredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_answered");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionAnswered"), "DiscussionService.onDiscussionAnswered should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_answered.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionAnswered");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionCategoryChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_category_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionCategoryChanged"), "DiscussionService.onDiscussionCategoryChanged should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_category_changed.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionCategoryChanged");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_closed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionClosed"), "DiscussionService.onDiscussionClosed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_closed.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionClosed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionCreated"), "DiscussionService.onDiscussionCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_created.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionDeleted"), "DiscussionService.onDiscussionDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_deleted.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionEdited"), "DiscussionService.onDiscussionEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_edited.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionLabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_labeled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionLabeled"), "DiscussionService.onDiscussionLabeled should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_labeled.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionLabeled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionLockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_locked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionLocked"), "DiscussionService.onDiscussionLocked should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_locked.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionLocked");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionPinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_pinned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionPinned"), "DiscussionService.onDiscussionPinned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_pinned.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionPinned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionReopened"), "DiscussionService.onDiscussionReopened should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_reopened.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionReopened");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionTransferredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_transferred");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionTransferred"), "DiscussionService.onDiscussionTransferred should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_transferred.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionTransferred");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionUnansweredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_unanswered");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionUnanswered"), "DiscussionService.onDiscussionUnanswered should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_unanswered.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionUnanswered");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionUnlabeledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_unlabeled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionUnlabeled"), "DiscussionService.onDiscussionUnlabeled should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_unlabeled.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionUnlabeled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionUnlockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_unlocked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionUnlocked"), "DiscussionService.onDiscussionUnlocked should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_unlocked.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionUnlocked");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionUnpinnedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion", "discussion_unpinned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionService.onDiscussionUnpinned"), "DiscussionService.onDiscussionUnpinned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_unpinned.json`);
    json received = boundJsonOf("DiscussionService.onDiscussionUnpinned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionPayload");
}

@test:Config {}
function testDiscussionCommentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion_comment", "discussion_comment_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionCommentService.onDiscussionCommentCreated"), "DiscussionCommentService.onDiscussionCommentCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_comment_created.json`);
    json received = boundJsonOf("DiscussionCommentService.onDiscussionCommentCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionCommentPayload");
}

@test:Config {}
function testDiscussionCommentDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion_comment", "discussion_comment_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionCommentService.onDiscussionCommentDeleted"), "DiscussionCommentService.onDiscussionCommentDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_comment_deleted.json`);
    json received = boundJsonOf("DiscussionCommentService.onDiscussionCommentDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionCommentPayload");
}

@test:Config {}
function testDiscussionCommentEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("discussion_comment", "discussion_comment_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DiscussionCommentService.onDiscussionCommentEdited"), "DiscussionCommentService.onDiscussionCommentEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/discussion_comment_edited.json`);
    json received = boundJsonOf("DiscussionCommentService.onDiscussionCommentEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DiscussionCommentPayload");
}

@test:Config {}
function testLabelCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("label", "label_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("LabelService.onLabelCreated"), "LabelService.onLabelCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/label_created.json`);
    json received = boundJsonOf("LabelService.onLabelCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "LabelPayload");
}

@test:Config {}
function testLabelDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("label", "label_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("LabelService.onLabelDeleted"), "LabelService.onLabelDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/label_deleted.json`);
    json received = boundJsonOf("LabelService.onLabelDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "LabelPayload");
}

@test:Config {}
function testLabelEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("label", "label_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("LabelService.onLabelEdited"), "LabelService.onLabelEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/label_edited.json`);
    json received = boundJsonOf("LabelService.onLabelEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "LabelPayload");
}

@test:Config {}
function testMilestoneClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_closed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MilestoneService.onMilestoneClosed"), "MilestoneService.onMilestoneClosed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/milestone_closed.json`);
    json received = boundJsonOf("MilestoneService.onMilestoneClosed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MilestonePayload");
}

@test:Config {}
function testMilestoneCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MilestoneService.onMilestoneCreated"), "MilestoneService.onMilestoneCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/milestone_created.json`);
    json received = boundJsonOf("MilestoneService.onMilestoneCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MilestonePayload");
}

@test:Config {}
function testMilestoneDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MilestoneService.onMilestoneDeleted"), "MilestoneService.onMilestoneDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/milestone_deleted.json`);
    json received = boundJsonOf("MilestoneService.onMilestoneDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MilestonePayload");
}

@test:Config {}
function testMilestoneEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MilestoneService.onMilestoneEdited"), "MilestoneService.onMilestoneEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/milestone_edited.json`);
    json received = boundJsonOf("MilestoneService.onMilestoneEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MilestonePayload");
}

@test:Config {}
function testMilestoneOpenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("milestone", "milestone_opened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MilestoneService.onMilestoneOpened"), "MilestoneService.onMilestoneOpened should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/milestone_opened.json`);
    json received = boundJsonOf("MilestoneService.onMilestoneOpened");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MilestonePayload");
}

@test:Config {}
function testStatusDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("status", "status");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("StatusService.onStatus"), "StatusService.onStatus should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/status.json`);
    json received = boundJsonOf("StatusService.onStatus");
    assertBindsFixture(received, deliveredEvent(received, fixture), "StatusPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/workflow_dispatch.json`);
    json received = boundJsonOf("WorkflowDispatchService.onWorkflowDispatch");
    assertBindsFixture(received, deliveredEvent(received, fixture), "WorkflowDispatchPayload");
}

@test:Config {}
function testPullRequestReviewThreadResolvedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_thread", "pull_request_review_thread_resolved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewThreadService.onPullRequestReviewThreadResolved"), "PullRequestReviewThreadService.onPullRequestReviewThreadResolved should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_review_thread_resolved.json`);
    json received = boundJsonOf("PullRequestReviewThreadService.onPullRequestReviewThreadResolved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestReviewThreadPayload");
    map<json> bound = boundPayloadOf("PullRequestReviewThreadService.onPullRequestReviewThreadResolved");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewThreadPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("updated_at"), "'updated_at' should have bound to its camelCase field on PullRequestReviewThreadPayload, not stayed a raw key");
}

@test:Config {}
function testPullRequestReviewThreadUnresolvedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("pull_request_review_thread", "pull_request_review_thread_unresolved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved"), "PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/pull_request_review_thread_unresolved.json`);
    json received = boundJsonOf("PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PullRequestReviewThreadPayload");
    map<json> bound = boundPayloadOf("PullRequestReviewThreadService.onPullRequestReviewThreadUnresolved");
    test:assertFalse(bound.hasKey("pull_request"), "'pull_request' should have bound to its camelCase field on PullRequestReviewThreadPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("updated_at"), "'updated_at' should have bound to its camelCase field on PullRequestReviewThreadPayload, not stayed a raw key");
}

@test:Config {}
function testTeamAddedToRepositoryDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_added_to_repository");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamAddedToRepository"), "TeamService.onTeamAddedToRepository should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/team_added_to_repository.json`);
    json received = boundJsonOf("TeamService.onTeamAddedToRepository");
    assertBindsFixture(received, deliveredEvent(received, fixture), "TeamPayload");
}

@test:Config {}
function testTeamCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamCreated"), "TeamService.onTeamCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/team_created.json`);
    json received = boundJsonOf("TeamService.onTeamCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "TeamPayload");
}

@test:Config {}
function testTeamDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamDeleted"), "TeamService.onTeamDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/team_deleted.json`);
    json received = boundJsonOf("TeamService.onTeamDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "TeamPayload");
}

@test:Config {}
function testTeamEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamEdited"), "TeamService.onTeamEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/team_edited.json`);
    json received = boundJsonOf("TeamService.onTeamEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "TeamPayload");
}

@test:Config {}
function testTeamRemovedFromRepositoryDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team", "team_removed_from_repository");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamService.onTeamRemovedFromRepository"), "TeamService.onTeamRemovedFromRepository should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/team_removed_from_repository.json`);
    json received = boundJsonOf("TeamService.onTeamRemovedFromRepository");
    assertBindsFixture(received, deliveredEvent(received, fixture), "TeamPayload");
}

@test:Config {}
function testOrganizationDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrganizationService.onOrganizationDeleted"), "OrganizationService.onOrganizationDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/organization_deleted.json`);
    json received = boundJsonOf("OrganizationService.onOrganizationDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "OrganizationPayload");
}

@test:Config {}
function testOrganizationMemberAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_member_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrganizationService.onOrganizationMemberAdded"), "OrganizationService.onOrganizationMemberAdded should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/organization_member_added.json`);
    json received = boundJsonOf("OrganizationService.onOrganizationMemberAdded");
    assertBindsFixture(received, deliveredEvent(received, fixture), "OrganizationPayload");
}

@test:Config {}
function testOrganizationMemberInvitedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_member_invited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrganizationService.onOrganizationMemberInvited"), "OrganizationService.onOrganizationMemberInvited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/organization_member_invited.json`);
    json received = boundJsonOf("OrganizationService.onOrganizationMemberInvited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "OrganizationPayload");
}

@test:Config {}
function testOrganizationMemberRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_member_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrganizationService.onOrganizationMemberRemoved"), "OrganizationService.onOrganizationMemberRemoved should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/organization_member_removed.json`);
    json received = boundJsonOf("OrganizationService.onOrganizationMemberRemoved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "OrganizationPayload");
}

@test:Config {}
function testOrganizationRenamedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("organization", "organization_renamed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrganizationService.onOrganizationRenamed"), "OrganizationService.onOrganizationRenamed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/organization_renamed.json`);
    json received = boundJsonOf("OrganizationService.onOrganizationRenamed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "OrganizationPayload");
}

@test:Config {}
function testDeploymentProtectionRuleDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_protection_rule", "deployment_protection_rule");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeploymentProtectionRuleService.onDeploymentProtectionRule"), "DeploymentProtectionRuleService.onDeploymentProtectionRule should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/deployment_protection_rule.json`);
    json received = boundJsonOf("DeploymentProtectionRuleService.onDeploymentProtectionRule");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DeploymentProtectionRulePayload");
    map<json> bound = boundPayloadOf("DeploymentProtectionRuleService.onDeploymentProtectionRule");
    test:assertFalse(bound.hasKey("deployment_callback_url"), "'deployment_callback_url' should have bound to its camelCase field on DeploymentProtectionRulePayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("pull_requests"), "'pull_requests' should have bound to its camelCase field on DeploymentProtectionRulePayload, not stayed a raw key");
}

@test:Config {}
function testDeploymentReviewApprovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_review", "deployment_review_approved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeploymentReviewService.onDeploymentReviewApproved"), "DeploymentReviewService.onDeploymentReviewApproved should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/deployment_review_approved.json`);
    json received = boundJsonOf("DeploymentReviewService.onDeploymentReviewApproved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DeploymentReviewPayload");
    map<json> bound = boundPayloadOf("DeploymentReviewService.onDeploymentReviewApproved");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on DeploymentReviewPayload, not stayed a raw key");
}

@test:Config {}
function testDeploymentReviewRejectedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_review", "deployment_review_rejected");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeploymentReviewService.onDeploymentReviewRejected"), "DeploymentReviewService.onDeploymentReviewRejected should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/deployment_review_rejected.json`);
    json received = boundJsonOf("DeploymentReviewService.onDeploymentReviewRejected");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DeploymentReviewPayload");
    map<json> bound = boundPayloadOf("DeploymentReviewService.onDeploymentReviewRejected");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on DeploymentReviewPayload, not stayed a raw key");
}

@test:Config {}
function testDeploymentReviewRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deployment_review", "deployment_review_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeploymentReviewService.onDeploymentReviewRequested"), "DeploymentReviewService.onDeploymentReviewRequested should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/deployment_review_requested.json`);
    json received = boundJsonOf("DeploymentReviewService.onDeploymentReviewRequested");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DeploymentReviewPayload");
    map<json> bound = boundPayloadOf("DeploymentReviewService.onDeploymentReviewRequested");
    test:assertFalse(bound.hasKey("workflow_run"), "'workflow_run' should have bound to its camelCase field on DeploymentReviewPayload, not stayed a raw key");
}

@test:Config {}
function testInstallationTargetRenamedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation_target", "installation_target_renamed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationTargetService.onInstallationTargetRenamed"), "InstallationTargetService.onInstallationTargetRenamed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/installation_target_renamed.json`);
    json received = boundJsonOf("InstallationTargetService.onInstallationTargetRenamed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "InstallationTargetPayload");
    map<json> bound = boundPayloadOf("InstallationTargetService.onInstallationTargetRenamed");
    test:assertFalse(bound.hasKey("target_type"), "'target_type' should have bound to its camelCase field on InstallationTargetPayload, not stayed a raw key");
}

@test:Config {}
function testIssueDependenciesBlockedByAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("issue_dependencies", "issue_dependencies_blocked_by_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("IssueDependenciesService.onIssueDependenciesBlockedByAdded"), "IssueDependenciesService.onIssueDependenciesBlockedByAdded should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issue_dependencies_blocked_by_added.json`);
    json received = boundJsonOf("IssueDependenciesService.onIssueDependenciesBlockedByAdded");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssueDependenciesPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issue_dependencies_blocked_by_removed.json`);
    json received = boundJsonOf("IssueDependenciesService.onIssueDependenciesBlockedByRemoved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssueDependenciesPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issue_dependencies_blocking_added.json`);
    json received = boundJsonOf("IssueDependenciesService.onIssueDependenciesBlockingAdded");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssueDependenciesPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/issue_dependencies_blocking_removed.json`);
    json received = boundJsonOf("IssueDependenciesService.onIssueDependenciesBlockingRemoved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "IssueDependenciesPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/marketplace_purchase_cancelled.json`);
    json received = boundJsonOf("MarketplacePurchaseService.onMarketplacePurchaseCancelled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MarketplacePurchasePayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/marketplace_purchase_changed.json`);
    json received = boundJsonOf("MarketplacePurchaseService.onMarketplacePurchaseChanged");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MarketplacePurchasePayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/marketplace_purchase_pending_change.json`);
    json received = boundJsonOf("MarketplacePurchaseService.onMarketplacePurchasePendingChange");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MarketplacePurchasePayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/marketplace_purchase_pending_change_cancelled.json`);
    json received = boundJsonOf("MarketplacePurchaseService.onMarketplacePurchasePendingChangeCancelled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MarketplacePurchasePayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/marketplace_purchase_purchased.json`);
    json received = boundJsonOf("MarketplacePurchaseService.onMarketplacePurchasePurchased");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MarketplacePurchasePayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/personal_access_token_request_approved.json`);
    json received = boundJsonOf("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PersonalAccessTokenRequestPayload");
    map<json> bound = boundPayloadOf("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestApproved");
    test:assertFalse(bound.hasKey("personal_access_token_request"), "'personal_access_token_request' should have bound to its camelCase field on PersonalAccessTokenRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPersonalAccessTokenRequestCancelledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("personal_access_token_request", "personal_access_token_request_cancelled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled"), "PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/personal_access_token_request_cancelled.json`);
    json received = boundJsonOf("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PersonalAccessTokenRequestPayload");
    map<json> bound = boundPayloadOf("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCancelled");
    test:assertFalse(bound.hasKey("personal_access_token_request"), "'personal_access_token_request' should have bound to its camelCase field on PersonalAccessTokenRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPersonalAccessTokenRequestCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("personal_access_token_request", "personal_access_token_request_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated"), "PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/personal_access_token_request_created.json`);
    json received = boundJsonOf("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PersonalAccessTokenRequestPayload");
    map<json> bound = boundPayloadOf("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestCreated");
    test:assertFalse(bound.hasKey("personal_access_token_request"), "'personal_access_token_request' should have bound to its camelCase field on PersonalAccessTokenRequestPayload, not stayed a raw key");
}

@test:Config {}
function testPersonalAccessTokenRequestDeniedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("personal_access_token_request", "personal_access_token_request_denied");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied"), "PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/personal_access_token_request_denied.json`);
    json received = boundJsonOf("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PersonalAccessTokenRequestPayload");
    map<json> bound = boundPayloadOf("PersonalAccessTokenRequestService.onPersonalAccessTokenRequestDenied");
    test:assertFalse(bound.hasKey("personal_access_token_request"), "'personal_access_token_request' should have bound to its camelCase field on PersonalAccessTokenRequestPayload, not stayed a raw key");
}

@test:Config {}
function testProjectClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_closed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectService.onProjectClosed"), "ProjectService.onProjectClosed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_closed.json`);
    json received = boundJsonOf("ProjectService.onProjectClosed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectPayload");
}

@test:Config {}
function testProjectCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectService.onProjectCreated"), "ProjectService.onProjectCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_created.json`);
    json received = boundJsonOf("ProjectService.onProjectCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectPayload");
}

@test:Config {}
function testProjectDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectService.onProjectDeleted"), "ProjectService.onProjectDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_deleted.json`);
    json received = boundJsonOf("ProjectService.onProjectDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectPayload");
}

@test:Config {}
function testProjectEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectService.onProjectEdited"), "ProjectService.onProjectEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_edited.json`);
    json received = boundJsonOf("ProjectService.onProjectEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectPayload");
}

@test:Config {}
function testProjectReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project", "project_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectService.onProjectReopened"), "ProjectService.onProjectReopened should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_reopened.json`);
    json received = boundJsonOf("ProjectService.onProjectReopened");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectPayload");
}

@test:Config {}
function testProjectCardConvertedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_converted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectCardService.onProjectCardConverted"), "ProjectCardService.onProjectCardConverted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_card_converted.json`);
    json received = boundJsonOf("ProjectCardService.onProjectCardConverted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectCardPayload");
    map<json> bound = boundPayloadOf("ProjectCardService.onProjectCardConverted");
    test:assertFalse(bound.hasKey("project_card"), "'project_card' should have bound to its camelCase field on ProjectCardPayload, not stayed a raw key");
}

@test:Config {}
function testProjectCardCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectCardService.onProjectCardCreated"), "ProjectCardService.onProjectCardCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_card_created.json`);
    json received = boundJsonOf("ProjectCardService.onProjectCardCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectCardPayload");
    map<json> bound = boundPayloadOf("ProjectCardService.onProjectCardCreated");
    test:assertFalse(bound.hasKey("project_card"), "'project_card' should have bound to its camelCase field on ProjectCardPayload, not stayed a raw key");
}

@test:Config {}
function testProjectCardDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectCardService.onProjectCardDeleted"), "ProjectCardService.onProjectCardDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_card_deleted.json`);
    json received = boundJsonOf("ProjectCardService.onProjectCardDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectCardPayload");
    map<json> bound = boundPayloadOf("ProjectCardService.onProjectCardDeleted");
    test:assertFalse(bound.hasKey("project_card"), "'project_card' should have bound to its camelCase field on ProjectCardPayload, not stayed a raw key");
}

@test:Config {}
function testProjectCardEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectCardService.onProjectCardEdited"), "ProjectCardService.onProjectCardEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_card_edited.json`);
    json received = boundJsonOf("ProjectCardService.onProjectCardEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectCardPayload");
    map<json> bound = boundPayloadOf("ProjectCardService.onProjectCardEdited");
    test:assertFalse(bound.hasKey("project_card"), "'project_card' should have bound to its camelCase field on ProjectCardPayload, not stayed a raw key");
}

@test:Config {}
function testProjectCardMovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_card", "project_card_moved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectCardService.onProjectCardMoved"), "ProjectCardService.onProjectCardMoved should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_card_moved.json`);
    json received = boundJsonOf("ProjectCardService.onProjectCardMoved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectCardPayload");
    map<json> bound = boundPayloadOf("ProjectCardService.onProjectCardMoved");
    test:assertFalse(bound.hasKey("project_card"), "'project_card' should have bound to its camelCase field on ProjectCardPayload, not stayed a raw key");
}

@test:Config {}
function testProjectColumnCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_column", "project_column_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectColumnService.onProjectColumnCreated"), "ProjectColumnService.onProjectColumnCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_column_created.json`);
    json received = boundJsonOf("ProjectColumnService.onProjectColumnCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectColumnPayload");
    map<json> bound = boundPayloadOf("ProjectColumnService.onProjectColumnCreated");
    test:assertFalse(bound.hasKey("project_column"), "'project_column' should have bound to its camelCase field on ProjectColumnPayload, not stayed a raw key");
}

@test:Config {}
function testProjectColumnDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_column", "project_column_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectColumnService.onProjectColumnDeleted"), "ProjectColumnService.onProjectColumnDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_column_deleted.json`);
    json received = boundJsonOf("ProjectColumnService.onProjectColumnDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectColumnPayload");
    map<json> bound = boundPayloadOf("ProjectColumnService.onProjectColumnDeleted");
    test:assertFalse(bound.hasKey("project_column"), "'project_column' should have bound to its camelCase field on ProjectColumnPayload, not stayed a raw key");
}

@test:Config {}
function testProjectColumnEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_column", "project_column_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectColumnService.onProjectColumnEdited"), "ProjectColumnService.onProjectColumnEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_column_edited.json`);
    json received = boundJsonOf("ProjectColumnService.onProjectColumnEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectColumnPayload");
    map<json> bound = boundPayloadOf("ProjectColumnService.onProjectColumnEdited");
    test:assertFalse(bound.hasKey("project_column"), "'project_column' should have bound to its camelCase field on ProjectColumnPayload, not stayed a raw key");
}

@test:Config {}
function testProjectColumnMovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("project_column", "project_column_moved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectColumnService.onProjectColumnMoved"), "ProjectColumnService.onProjectColumnMoved should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/project_column_moved.json`);
    json received = boundJsonOf("ProjectColumnService.onProjectColumnMoved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "ProjectColumnPayload");
    map<json> bound = boundPayloadOf("ProjectColumnService.onProjectColumnMoved");
    test:assertFalse(bound.hasKey("project_column"), "'project_column' should have bound to its camelCase field on ProjectColumnPayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryImportDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_import", "repository_import");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryImportService.onRepositoryImport"), "RepositoryImportService.onRepositoryImport should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_import.json`);
    json received = boundJsonOf("RepositoryImportService.onRepositoryImport");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryImportPayload");
}

@test:Config {}
function testSubIssuesParentIssueAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sub_issues", "sub_issues_parent_issue_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SubIssuesService.onSubIssuesParentIssueAdded"), "SubIssuesService.onSubIssuesParentIssueAdded should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/sub_issues_parent_issue_added.json`);
    json received = boundJsonOf("SubIssuesService.onSubIssuesParentIssueAdded");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SubIssuesPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/sub_issues_parent_issue_removed.json`);
    json received = boundJsonOf("SubIssuesService.onSubIssuesParentIssueRemoved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SubIssuesPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/sub_issues_sub_issue_added.json`);
    json received = boundJsonOf("SubIssuesService.onSubIssuesSubIssueAdded");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SubIssuesPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/sub_issues_sub_issue_removed.json`);
    json received = boundJsonOf("SubIssuesService.onSubIssuesSubIssueRemoved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SubIssuesPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/page_build.json`);
    json received = boundJsonOf("PageBuildService.onPageBuild");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PageBuildPayload");
}

@test:Config {}
function testTeamAddDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("team_add", "team_add");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("TeamAddService.onTeamAdd"), "TeamAddService.onTeamAdd should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/team_add.json`);
    json received = boundJsonOf("TeamAddService.onTeamAdd");
    assertBindsFixture(received, deliveredEvent(received, fixture), "TeamAddPayload");
}

@test:Config {}
function testSponsorshipCancelledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_cancelled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SponsorshipService.onSponsorshipCancelled"), "SponsorshipService.onSponsorshipCancelled should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/sponsorship_cancelled.json`);
    json received = boundJsonOf("SponsorshipService.onSponsorshipCancelled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SponsorshipPayload");
    map<json> bound = boundPayloadOf("SponsorshipService.onSponsorshipCancelled");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on SponsorshipPayload, not stayed a raw key");
}

@test:Config {}
function testSponsorshipCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SponsorshipService.onSponsorshipCreated"), "SponsorshipService.onSponsorshipCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/sponsorship_created.json`);
    json received = boundJsonOf("SponsorshipService.onSponsorshipCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SponsorshipPayload");
    map<json> bound = boundPayloadOf("SponsorshipService.onSponsorshipCreated");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on SponsorshipPayload, not stayed a raw key");
}

@test:Config {}
function testSponsorshipEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SponsorshipService.onSponsorshipEdited"), "SponsorshipService.onSponsorshipEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/sponsorship_edited.json`);
    json received = boundJsonOf("SponsorshipService.onSponsorshipEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SponsorshipPayload");
    map<json> bound = boundPayloadOf("SponsorshipService.onSponsorshipEdited");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on SponsorshipPayload, not stayed a raw key");
}

@test:Config {}
function testSponsorshipPendingCancellationDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_pending_cancellation");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SponsorshipService.onSponsorshipPendingCancellation"), "SponsorshipService.onSponsorshipPendingCancellation should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/sponsorship_pending_cancellation.json`);
    json received = boundJsonOf("SponsorshipService.onSponsorshipPendingCancellation");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SponsorshipPayload");
    map<json> bound = boundPayloadOf("SponsorshipService.onSponsorshipPendingCancellation");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on SponsorshipPayload, not stayed a raw key");
}

@test:Config {}
function testSponsorshipPendingTierChangeDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_pending_tier_change");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SponsorshipService.onSponsorshipPendingTierChange"), "SponsorshipService.onSponsorshipPendingTierChange should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/sponsorship_pending_tier_change.json`);
    json received = boundJsonOf("SponsorshipService.onSponsorshipPendingTierChange");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SponsorshipPayload");
    map<json> bound = boundPayloadOf("SponsorshipService.onSponsorshipPendingTierChange");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on SponsorshipPayload, not stayed a raw key");
}

@test:Config {}
function testSponsorshipTierChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("sponsorship", "sponsorship_tier_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SponsorshipService.onSponsorshipTierChanged"), "SponsorshipService.onSponsorshipTierChanged should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/sponsorship_tier_changed.json`);
    json received = boundJsonOf("SponsorshipService.onSponsorshipTierChanged");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SponsorshipPayload");
    map<json> bound = boundPayloadOf("SponsorshipService.onSponsorshipTierChanged");
    test:assertFalse(bound.hasKey("effective_date"), "'effective_date' should have bound to its camelCase field on SponsorshipPayload, not stayed a raw key");
}

@test:Config {}
function testSecurityAndAnalysisDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("security_and_analysis", "security_and_analysis");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecurityAndAnalysisService.onSecurityAndAnalysis"), "SecurityAndAnalysisService.onSecurityAndAnalysis should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/security_and_analysis.json`);
    json received = boundJsonOf("SecurityAndAnalysisService.onSecurityAndAnalysis");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecurityAndAnalysisPayload");
}

@test:Config {}
function testBranchProtectionConfigurationDisabledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_configuration", "branch_protection_configuration_disabled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("BranchProtectionConfigurationService.onBranchProtectionConfigurationDisabled"), "BranchProtectionConfigurationService.onBranchProtectionConfigurationDisabled should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/branch_protection_configuration_disabled.json`);
    json received = boundJsonOf("BranchProtectionConfigurationService.onBranchProtectionConfigurationDisabled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "BranchProtectionConfigurationPayload");
}

@test:Config {}
function testBranchProtectionConfigurationEnabledDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_configuration", "branch_protection_configuration_enabled");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("BranchProtectionConfigurationService.onBranchProtectionConfigurationEnabled"), "BranchProtectionConfigurationService.onBranchProtectionConfigurationEnabled should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/branch_protection_configuration_enabled.json`);
    json received = boundJsonOf("BranchProtectionConfigurationService.onBranchProtectionConfigurationEnabled");
    assertBindsFixture(received, deliveredEvent(received, fixture), "BranchProtectionConfigurationPayload");
}

@test:Config {}
function testCustomPropertyCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property", "custom_property_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CustomPropertyService.onCustomPropertyCreated"), "CustomPropertyService.onCustomPropertyCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/custom_property_created.json`);
    json received = boundJsonOf("CustomPropertyService.onCustomPropertyCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CustomPropertyPayload");
}

@test:Config {}
function testCustomPropertyDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property", "custom_property_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CustomPropertyService.onCustomPropertyDeleted"), "CustomPropertyService.onCustomPropertyDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/custom_property_deleted.json`);
    json received = boundJsonOf("CustomPropertyService.onCustomPropertyDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CustomPropertyPayload");
}

@test:Config {}
function testCustomPropertyPromoteToEnterpriseDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property", "custom_property_promote_to_enterprise");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CustomPropertyService.onCustomPropertyPromoteToEnterprise"), "CustomPropertyService.onCustomPropertyPromoteToEnterprise should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/custom_property_promote_to_enterprise.json`);
    json received = boundJsonOf("CustomPropertyService.onCustomPropertyPromoteToEnterprise");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CustomPropertyPayload");
}

@test:Config {}
function testCustomPropertyUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property", "custom_property_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CustomPropertyService.onCustomPropertyUpdated"), "CustomPropertyService.onCustomPropertyUpdated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/custom_property_updated.json`);
    json received = boundJsonOf("CustomPropertyService.onCustomPropertyUpdated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CustomPropertyPayload");
}

@test:Config {}
function testCustomPropertyValuesUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("custom_property_values", "custom_property_values_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CustomPropertyValuesService.onCustomPropertyValuesUpdated"), "CustomPropertyValuesService.onCustomPropertyValuesUpdated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/custom_property_values_updated.json`);
    json received = boundJsonOf("CustomPropertyValuesService.onCustomPropertyValuesUpdated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CustomPropertyValuesPayload");
    map<json> bound = boundPayloadOf("CustomPropertyValuesService.onCustomPropertyValuesUpdated");
    test:assertFalse(bound.hasKey("new_property_values"), "'new_property_values' should have bound to its camelCase field on CustomPropertyValuesPayload, not stayed a raw key");
    test:assertFalse(bound.hasKey("old_property_values"), "'old_property_values' should have bound to its camelCase field on CustomPropertyValuesPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemArchivedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_archived");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemArchived"), "ProjectsV2itemService.onProjectsV2ItemArchived should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_item_archived.json`);
    json received = boundJsonOf("ProjectsV2itemService.onProjectsV2ItemArchived");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2ItemPayload");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemArchived");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemConvertedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_converted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemConverted"), "ProjectsV2itemService.onProjectsV2ItemConverted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_item_converted.json`);
    json received = boundJsonOf("ProjectsV2itemService.onProjectsV2ItemConverted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2ItemPayload");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemConverted");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemCreated"), "ProjectsV2itemService.onProjectsV2ItemCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_item_created.json`);
    json received = boundJsonOf("ProjectsV2itemService.onProjectsV2ItemCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2ItemPayload");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemCreated");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemDeleted"), "ProjectsV2itemService.onProjectsV2ItemDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_item_deleted.json`);
    json received = boundJsonOf("ProjectsV2itemService.onProjectsV2ItemDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2ItemPayload");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemDeleted");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemEdited"), "ProjectsV2itemService.onProjectsV2ItemEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_item_edited.json`);
    json received = boundJsonOf("ProjectsV2itemService.onProjectsV2ItemEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2ItemPayload");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemEdited");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemReorderedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_reordered");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemReordered"), "ProjectsV2itemService.onProjectsV2ItemReordered should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_item_reordered.json`);
    json received = boundJsonOf("ProjectsV2itemService.onProjectsV2ItemReordered");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2ItemPayload");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemReordered");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ItemRestoredDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_item", "projects_v2_item_restored");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2itemService.onProjectsV2ItemRestored"), "ProjectsV2itemService.onProjectsV2ItemRestored should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_item_restored.json`);
    json received = boundJsonOf("ProjectsV2itemService.onProjectsV2ItemRestored");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2ItemPayload");
    map<json> bound = boundPayloadOf("ProjectsV2itemService.onProjectsV2ItemRestored");
    test:assertFalse(bound.hasKey("projects_v2_item"), "'projects_v2_item' should have bound to its camelCase field on 'ProjectsV2ItemPayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2StatusUpdateCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_status_update", "projects_v2_status_update_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated"), "ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_status_update_created.json`);
    json received = boundJsonOf("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2StatusUpdatePayload");
    map<json> bound = boundPayloadOf("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateCreated");
    test:assertFalse(bound.hasKey("projects_v2_status_update"), "'projects_v2_status_update' should have bound to its camelCase field on 'ProjectsV2StatusUpdatePayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2StatusUpdateDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_status_update", "projects_v2_status_update_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted"), "ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_status_update_deleted.json`);
    json received = boundJsonOf("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2StatusUpdatePayload");
    map<json> bound = boundPayloadOf("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateDeleted");
    test:assertFalse(bound.hasKey("projects_v2_status_update"), "'projects_v2_status_update' should have bound to its camelCase field on 'ProjectsV2StatusUpdatePayload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2StatusUpdateEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2_status_update", "projects_v2_status_update_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited"), "ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_status_update_edited.json`);
    json received = boundJsonOf("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2StatusUpdatePayload");
    map<json> bound = boundPayloadOf("ProjectsV2statusUpdateService.onProjectsV2StatusUpdateEdited");
    test:assertFalse(bound.hasKey("projects_v2_status_update"), "'projects_v2_status_update' should have bound to its camelCase field on 'ProjectsV2StatusUpdatePayload, not stayed a raw key");
}

@test:Config {}
function testRegistryPackagePublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("registry_package", "registry_package_published");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RegistryPackageService.onRegistryPackagePublished"), "RegistryPackageService.onRegistryPackagePublished should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/registry_package_published.json`);
    json received = boundJsonOf("RegistryPackageService.onRegistryPackagePublished");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RegistryPackagePayload");
    map<json> bound = boundPayloadOf("RegistryPackageService.onRegistryPackagePublished");
    test:assertFalse(bound.hasKey("registry_package"), "'registry_package' should have bound to its camelCase field on RegistryPackagePayload, not stayed a raw key");
}

@test:Config {}
function testRegistryPackageUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("registry_package", "registry_package_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RegistryPackageService.onRegistryPackageUpdated"), "RegistryPackageService.onRegistryPackageUpdated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/registry_package_updated.json`);
    json received = boundJsonOf("RegistryPackageService.onRegistryPackageUpdated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RegistryPackagePayload");
    map<json> bound = boundPayloadOf("RegistryPackageService.onRegistryPackageUpdated");
    test:assertFalse(bound.hasKey("registry_package"), "'registry_package' should have bound to its camelCase field on RegistryPackagePayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryRulesetCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_ruleset", "repository_ruleset_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryRulesetService.onRepositoryRulesetCreated"), "RepositoryRulesetService.onRepositoryRulesetCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_ruleset_created.json`);
    json received = boundJsonOf("RepositoryRulesetService.onRepositoryRulesetCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryRulesetPayload");
    map<json> bound = boundPayloadOf("RepositoryRulesetService.onRepositoryRulesetCreated");
    test:assertFalse(bound.hasKey("repository_ruleset"), "'repository_ruleset' should have bound to its camelCase field on RepositoryRulesetPayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryRulesetDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_ruleset", "repository_ruleset_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryRulesetService.onRepositoryRulesetDeleted"), "RepositoryRulesetService.onRepositoryRulesetDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_ruleset_deleted.json`);
    json received = boundJsonOf("RepositoryRulesetService.onRepositoryRulesetDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryRulesetPayload");
    map<json> bound = boundPayloadOf("RepositoryRulesetService.onRepositoryRulesetDeleted");
    test:assertFalse(bound.hasKey("repository_ruleset"), "'repository_ruleset' should have bound to its camelCase field on RepositoryRulesetPayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryRulesetEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_ruleset", "repository_ruleset_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryRulesetService.onRepositoryRulesetEdited"), "RepositoryRulesetService.onRepositoryRulesetEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_ruleset_edited.json`);
    json received = boundJsonOf("RepositoryRulesetService.onRepositoryRulesetEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryRulesetPayload");
    map<json> bound = boundPayloadOf("RepositoryRulesetService.onRepositoryRulesetEdited");
    test:assertFalse(bound.hasKey("repository_ruleset"), "'repository_ruleset' should have bound to its camelCase field on RepositoryRulesetPayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryVulnerabilityAlertCreateDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_vulnerability_alert", "repository_vulnerability_alert_create");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertCreate"), "RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertCreate should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_vulnerability_alert_create.json`);
    json received = boundJsonOf("RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertCreate");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryVulnerabilityAlertPayload");
}

@test:Config {}
function testRepositoryVulnerabilityAlertDismissDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_vulnerability_alert", "repository_vulnerability_alert_dismiss");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertDismiss"), "RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertDismiss should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_vulnerability_alert_dismiss.json`);
    json received = boundJsonOf("RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertDismiss");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryVulnerabilityAlertPayload");
}

@test:Config {}
function testRepositoryVulnerabilityAlertReopenDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_vulnerability_alert", "repository_vulnerability_alert_reopen");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertReopen"), "RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertReopen should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_vulnerability_alert_reopen.json`);
    json received = boundJsonOf("RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertReopen");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryVulnerabilityAlertPayload");
}

@test:Config {}
function testRepositoryVulnerabilityAlertResolveDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_vulnerability_alert", "repository_vulnerability_alert_resolve");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertResolve"), "RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertResolve should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_vulnerability_alert_resolve.json`);
    json received = boundJsonOf("RepositoryVulnerabilityAlertService.onRepositoryVulnerabilityAlertResolve");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryVulnerabilityAlertPayload");
}

@test:Config {}
function testSecretScanningAlertLocationDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert_location", "secret_scanning_alert_location");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertLocationService.onSecretScanningAlertLocation"), "SecretScanningAlertLocationService.onSecretScanningAlertLocation should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/secret_scanning_alert_location.json`);
    json received = boundJsonOf("SecretScanningAlertLocationService.onSecretScanningAlertLocation");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecretScanningAlertLocationPayload");
}

@test:Config {}
function testSecretScanningScanDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_scan", "secret_scanning_scan");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningScanService.onSecretScanningScan"), "SecretScanningScanService.onSecretScanningScan should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/secret_scanning_scan.json`);
    json received = boundJsonOf("SecretScanningScanService.onSecretScanningScan");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecretScanningScanPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/branch_protection_rule_created.json`);
    json received = boundJsonOf("BranchProtectionRuleService.onBranchProtectionRuleCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "BranchProtectionRulePayload");
}

@test:Config {}
function testBranchProtectionRuleDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_rule", "branch_protection_rule_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("BranchProtectionRuleService.onBranchProtectionRuleDeleted"), "BranchProtectionRuleService.onBranchProtectionRuleDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/branch_protection_rule_deleted.json`);
    json received = boundJsonOf("BranchProtectionRuleService.onBranchProtectionRuleDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "BranchProtectionRulePayload");
}

@test:Config {}
function testBranchProtectionRuleEditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("branch_protection_rule", "branch_protection_rule_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("BranchProtectionRuleService.onBranchProtectionRuleEdited"), "BranchProtectionRuleService.onBranchProtectionRuleEdited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/branch_protection_rule_edited.json`);
    json received = boundJsonOf("BranchProtectionRuleService.onBranchProtectionRuleEdited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "BranchProtectionRulePayload");
}

@test:Config {}
function testCodeScanningAlertAppearedInBranchDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_appeared_in_branch");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertAppearedInBranch"), "CodeScanningAlertService.onCodeScanningAlertAppearedInBranch should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/code_scanning_alert_appeared_in_branch.json`);
    json received = boundJsonOf("CodeScanningAlertService.onCodeScanningAlertAppearedInBranch");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CodeScanningAlertPayload");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertAppearedInBranch");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testCodeScanningAlertClosedByUserDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_closed_by_user");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertClosedByUser"), "CodeScanningAlertService.onCodeScanningAlertClosedByUser should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/code_scanning_alert_closed_by_user.json`);
    json received = boundJsonOf("CodeScanningAlertService.onCodeScanningAlertClosedByUser");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CodeScanningAlertPayload");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertClosedByUser");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testCodeScanningAlertCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertCreated"), "CodeScanningAlertService.onCodeScanningAlertCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/code_scanning_alert_created.json`);
    json received = boundJsonOf("CodeScanningAlertService.onCodeScanningAlertCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CodeScanningAlertPayload");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertCreated");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testCodeScanningAlertFixedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_fixed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertFixed"), "CodeScanningAlertService.onCodeScanningAlertFixed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/code_scanning_alert_fixed.json`);
    json received = boundJsonOf("CodeScanningAlertService.onCodeScanningAlertFixed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CodeScanningAlertPayload");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertFixed");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testCodeScanningAlertReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertReopened"), "CodeScanningAlertService.onCodeScanningAlertReopened should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/code_scanning_alert_reopened.json`);
    json received = boundJsonOf("CodeScanningAlertService.onCodeScanningAlertReopened");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CodeScanningAlertPayload");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertReopened");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testCodeScanningAlertReopenedByUserDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_reopened_by_user");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertReopenedByUser"), "CodeScanningAlertService.onCodeScanningAlertReopenedByUser should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/code_scanning_alert_reopened_by_user.json`);
    json received = boundJsonOf("CodeScanningAlertService.onCodeScanningAlertReopenedByUser");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CodeScanningAlertPayload");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertReopenedByUser");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testCodeScanningAlertUpdatedAssignmentDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("code_scanning_alert", "code_scanning_alert_updated_assignment");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment"), "CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/code_scanning_alert_updated_assignment.json`);
    json received = boundJsonOf("CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CodeScanningAlertPayload");
    map<json> bound = boundPayloadOf("CodeScanningAlertService.onCodeScanningAlertUpdatedAssignment");
    test:assertFalse(bound.hasKey("commit_oid"), "'commit_oid' should have bound to its camelCase field on CodeScanningAlertPayload, not stayed a raw key");
}

@test:Config {}
function testDeployKeyCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deploy_key", "deploy_key_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeployKeyService.onDeployKeyCreated"), "DeployKeyService.onDeployKeyCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/deploy_key_created.json`);
    json received = boundJsonOf("DeployKeyService.onDeployKeyCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DeployKeyPayload");
}

@test:Config {}
function testDeployKeyDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("deploy_key", "deploy_key_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DeployKeyService.onDeployKeyDeleted"), "DeployKeyService.onDeployKeyDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/deploy_key_deleted.json`);
    json received = boundJsonOf("DeployKeyService.onDeployKeyDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DeployKeyPayload");
}

@test:Config {}
function testGithubAppAuthorizationRevokedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("github_app_authorization", "github_app_authorization_revoked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("GithubAppAuthorizationService.onGithubAppAuthorizationRevoked"), "GithubAppAuthorizationService.onGithubAppAuthorizationRevoked should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/github_app_authorization_revoked.json`);
    json received = boundJsonOf("GithubAppAuthorizationService.onGithubAppAuthorizationRevoked");
    assertBindsFixture(received, deliveredEvent(received, fixture), "GithubAppAuthorizationPayload");
}

@test:Config {}
function testMetaDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("meta", "meta_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MetaService.onMetaDeleted"), "MetaService.onMetaDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/meta_deleted.json`);
    json received = boundJsonOf("MetaService.onMetaDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MetaPayload");
    map<json> bound = boundPayloadOf("MetaService.onMetaDeleted");
    test:assertFalse(bound.hasKey("hook_id"), "'hook_id' should have bound to its camelCase field on MetaPayload, not stayed a raw key");
}

@test:Config {}
function testOrgBlockBlockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("org_block", "org_block_blocked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrgBlockService.onOrgBlockBlocked"), "OrgBlockService.onOrgBlockBlocked should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/org_block_blocked.json`);
    json received = boundJsonOf("OrgBlockService.onOrgBlockBlocked");
    assertBindsFixture(received, deliveredEvent(received, fixture), "OrgBlockPayload");
    map<json> bound = boundPayloadOf("OrgBlockService.onOrgBlockBlocked");
    test:assertFalse(bound.hasKey("blocked_user"), "'blocked_user' should have bound to its camelCase field on OrgBlockPayload, not stayed a raw key");
}

@test:Config {}
function testOrgBlockUnblockedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("org_block", "org_block_unblocked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("OrgBlockService.onOrgBlockUnblocked"), "OrgBlockService.onOrgBlockUnblocked should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/org_block_unblocked.json`);
    json received = boundJsonOf("OrgBlockService.onOrgBlockUnblocked");
    assertBindsFixture(received, deliveredEvent(received, fixture), "OrgBlockPayload");
    map<json> bound = boundPayloadOf("OrgBlockService.onOrgBlockUnblocked");
    test:assertFalse(bound.hasKey("blocked_user"), "'blocked_user' should have bound to its camelCase field on OrgBlockPayload, not stayed a raw key");
}

@test:Config {}
function testPackagePublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("package", "package_published");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PackageService.onPackagePublished"), "PackageService.onPackagePublished should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/package_published.json`);
    json received = boundJsonOf("PackageService.onPackagePublished");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PackagePayload");
}

@test:Config {}
function testPackageUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("package", "package_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PackageService.onPackageUpdated"), "PackageService.onPackageUpdated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/package_updated.json`);
    json received = boundJsonOf("PackageService.onPackageUpdated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PackagePayload");
}

@test:Config {}
function testProjectsV2ClosedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_closed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2Service.onProjectsV2Closed"), "ProjectsV2Service.onProjectsV2Closed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_closed.json`);
    json received = boundJsonOf("ProjectsV2Service.onProjectsV2Closed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2Payload");
    map<json> bound = boundPayloadOf("ProjectsV2Service.onProjectsV2Closed");
    test:assertFalse(bound.hasKey("projects_v2"), "'projects_v2' should have bound to its camelCase field on 'ProjectsV2Payload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2CreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2Service.onProjectsV2Created"), "ProjectsV2Service.onProjectsV2Created should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_created.json`);
    json received = boundJsonOf("ProjectsV2Service.onProjectsV2Created");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2Payload");
    map<json> bound = boundPayloadOf("ProjectsV2Service.onProjectsV2Created");
    test:assertFalse(bound.hasKey("projects_v2"), "'projects_v2' should have bound to its camelCase field on 'ProjectsV2Payload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2DeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2Service.onProjectsV2Deleted"), "ProjectsV2Service.onProjectsV2Deleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_deleted.json`);
    json received = boundJsonOf("ProjectsV2Service.onProjectsV2Deleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2Payload");
    map<json> bound = boundPayloadOf("ProjectsV2Service.onProjectsV2Deleted");
    test:assertFalse(bound.hasKey("projects_v2"), "'projects_v2' should have bound to its camelCase field on 'ProjectsV2Payload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2EditedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_edited");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2Service.onProjectsV2Edited"), "ProjectsV2Service.onProjectsV2Edited should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_edited.json`);
    json received = boundJsonOf("ProjectsV2Service.onProjectsV2Edited");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2Payload");
    map<json> bound = boundPayloadOf("ProjectsV2Service.onProjectsV2Edited");
    test:assertFalse(bound.hasKey("projects_v2"), "'projects_v2' should have bound to its camelCase field on 'ProjectsV2Payload, not stayed a raw key");
}

@test:Config {}
function testProjectsV2ReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("projects_v2", "projects_v2_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("ProjectsV2Service.onProjectsV2Reopened"), "ProjectsV2Service.onProjectsV2Reopened should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/projects_v2_reopened.json`);
    json received = boundJsonOf("ProjectsV2Service.onProjectsV2Reopened");
    assertBindsFixture(received, deliveredEvent(received, fixture), "'ProjectsV2Payload");
    map<json> bound = boundPayloadOf("ProjectsV2Service.onProjectsV2Reopened");
    test:assertFalse(bound.hasKey("projects_v2"), "'projects_v2' should have bound to its camelCase field on 'ProjectsV2Payload, not stayed a raw key");
}

@test:Config {}
function testRepositoryAdvisoryPublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_advisory", "repository_advisory_published");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryAdvisoryService.onRepositoryAdvisoryPublished"), "RepositoryAdvisoryService.onRepositoryAdvisoryPublished should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_advisory_published.json`);
    json received = boundJsonOf("RepositoryAdvisoryService.onRepositoryAdvisoryPublished");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryAdvisoryPayload");
    map<json> bound = boundPayloadOf("RepositoryAdvisoryService.onRepositoryAdvisoryPublished");
    test:assertFalse(bound.hasKey("repository_advisory"), "'repository_advisory' should have bound to its camelCase field on RepositoryAdvisoryPayload, not stayed a raw key");
}

@test:Config {}
function testRepositoryAdvisoryReportedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_advisory", "repository_advisory_reported");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryAdvisoryService.onRepositoryAdvisoryReported"), "RepositoryAdvisoryService.onRepositoryAdvisoryReported should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_advisory_reported.json`);
    json received = boundJsonOf("RepositoryAdvisoryService.onRepositoryAdvisoryReported");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryAdvisoryPayload");
    map<json> bound = boundPayloadOf("RepositoryAdvisoryService.onRepositoryAdvisoryReported");
    test:assertFalse(bound.hasKey("repository_advisory"), "'repository_advisory' should have bound to its camelCase field on RepositoryAdvisoryPayload, not stayed a raw key");
}

@test:Config {}
function testSecurityAdvisoryPublishedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("security_advisory", "security_advisory_published");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecurityAdvisoryService.onSecurityAdvisoryPublished"), "SecurityAdvisoryService.onSecurityAdvisoryPublished should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/security_advisory_published.json`);
    json received = boundJsonOf("SecurityAdvisoryService.onSecurityAdvisoryPublished");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecurityAdvisoryPayload");
    map<json> bound = boundPayloadOf("SecurityAdvisoryService.onSecurityAdvisoryPublished");
    test:assertFalse(bound.hasKey("security_advisory"), "'security_advisory' should have bound to its camelCase field on SecurityAdvisoryPayload, not stayed a raw key");
}

@test:Config {}
function testSecurityAdvisoryUpdatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("security_advisory", "security_advisory_updated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecurityAdvisoryService.onSecurityAdvisoryUpdated"), "SecurityAdvisoryService.onSecurityAdvisoryUpdated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/security_advisory_updated.json`);
    json received = boundJsonOf("SecurityAdvisoryService.onSecurityAdvisoryUpdated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecurityAdvisoryPayload");
    map<json> bound = boundPayloadOf("SecurityAdvisoryService.onSecurityAdvisoryUpdated");
    test:assertFalse(bound.hasKey("security_advisory"), "'security_advisory' should have bound to its camelCase field on SecurityAdvisoryPayload, not stayed a raw key");
}

@test:Config {}
function testSecurityAdvisoryWithdrawnDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("security_advisory", "security_advisory_withdrawn");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecurityAdvisoryService.onSecurityAdvisoryWithdrawn"), "SecurityAdvisoryService.onSecurityAdvisoryWithdrawn should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/security_advisory_withdrawn.json`);
    json received = boundJsonOf("SecurityAdvisoryService.onSecurityAdvisoryWithdrawn");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecurityAdvisoryPayload");
    map<json> bound = boundPayloadOf("SecurityAdvisoryService.onSecurityAdvisoryWithdrawn");
    test:assertFalse(bound.hasKey("security_advisory"), "'security_advisory' should have bound to its camelCase field on SecurityAdvisoryPayload, not stayed a raw key");
}

@test:Config {}
function testCommitCommentCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("commit_comment", "commit_comment_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("CommitCommentService.onCommitCommentCreated"), "CommitCommentService.onCommitCommentCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/commit_comment_created.json`);
    json received = boundJsonOf("CommitCommentService.onCommitCommentCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "CommitCommentPayload");
}

@test:Config {}
function testDependabotAlertAssigneesChangedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_assignees_changed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertAssigneesChanged"), "DependabotAlertService.onDependabotAlertAssigneesChanged should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/dependabot_alert_assignees_changed.json`);
    json received = boundJsonOf("DependabotAlertService.onDependabotAlertAssigneesChanged");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DependabotAlertPayload");
}

@test:Config {}
function testDependabotAlertAutoDismissedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_auto_dismissed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertAutoDismissed"), "DependabotAlertService.onDependabotAlertAutoDismissed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/dependabot_alert_auto_dismissed.json`);
    json received = boundJsonOf("DependabotAlertService.onDependabotAlertAutoDismissed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DependabotAlertPayload");
}

@test:Config {}
function testDependabotAlertAutoReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_auto_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertAutoReopened"), "DependabotAlertService.onDependabotAlertAutoReopened should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/dependabot_alert_auto_reopened.json`);
    json received = boundJsonOf("DependabotAlertService.onDependabotAlertAutoReopened");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DependabotAlertPayload");
}

@test:Config {}
function testDependabotAlertCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertCreated"), "DependabotAlertService.onDependabotAlertCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/dependabot_alert_created.json`);
    json received = boundJsonOf("DependabotAlertService.onDependabotAlertCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DependabotAlertPayload");
}

@test:Config {}
function testDependabotAlertDismissedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_dismissed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertDismissed"), "DependabotAlertService.onDependabotAlertDismissed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/dependabot_alert_dismissed.json`);
    json received = boundJsonOf("DependabotAlertService.onDependabotAlertDismissed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DependabotAlertPayload");
}

@test:Config {}
function testDependabotAlertFixedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_fixed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertFixed"), "DependabotAlertService.onDependabotAlertFixed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/dependabot_alert_fixed.json`);
    json received = boundJsonOf("DependabotAlertService.onDependabotAlertFixed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DependabotAlertPayload");
}

@test:Config {}
function testDependabotAlertReintroducedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_reintroduced");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertReintroduced"), "DependabotAlertService.onDependabotAlertReintroduced should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/dependabot_alert_reintroduced.json`);
    json received = boundJsonOf("DependabotAlertService.onDependabotAlertReintroduced");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DependabotAlertPayload");
}

@test:Config {}
function testDependabotAlertReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("dependabot_alert", "dependabot_alert_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("DependabotAlertService.onDependabotAlertReopened"), "DependabotAlertService.onDependabotAlertReopened should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/dependabot_alert_reopened.json`);
    json received = boundJsonOf("DependabotAlertService.onDependabotAlertReopened");
    assertBindsFixture(received, deliveredEvent(received, fixture), "DependabotAlertPayload");
}

@test:Config {}
function testGollumDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("gollum", "gollum");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("GollumService.onGollum"), "GollumService.onGollum should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/gollum.json`);
    json received = boundJsonOf("GollumService.onGollum");
    assertBindsFixture(received, deliveredEvent(received, fixture), "GollumPayload");
}

@test:Config {}
function testInstallationCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationService.onInstallationCreated"), "InstallationService.onInstallationCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/installation_created.json`);
    json received = boundJsonOf("InstallationService.onInstallationCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "InstallationPayload");
}

@test:Config {}
function testInstallationDeletedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_deleted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationService.onInstallationDeleted"), "InstallationService.onInstallationDeleted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/installation_deleted.json`);
    json received = boundJsonOf("InstallationService.onInstallationDeleted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "InstallationPayload");
}

@test:Config {}
function testInstallationNewPermissionsAcceptedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_new_permissions_accepted");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationService.onInstallationNewPermissionsAccepted"), "InstallationService.onInstallationNewPermissionsAccepted should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/installation_new_permissions_accepted.json`);
    json received = boundJsonOf("InstallationService.onInstallationNewPermissionsAccepted");
    assertBindsFixture(received, deliveredEvent(received, fixture), "InstallationPayload");
}

@test:Config {}
function testInstallationSuspendDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_suspend");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationService.onInstallationSuspend"), "InstallationService.onInstallationSuspend should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/installation_suspend.json`);
    json received = boundJsonOf("InstallationService.onInstallationSuspend");
    assertBindsFixture(received, deliveredEvent(received, fixture), "InstallationPayload");
}

@test:Config {}
function testInstallationUnsuspendDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation", "installation_unsuspend");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationService.onInstallationUnsuspend"), "InstallationService.onInstallationUnsuspend should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/installation_unsuspend.json`);
    json received = boundJsonOf("InstallationService.onInstallationUnsuspend");
    assertBindsFixture(received, deliveredEvent(received, fixture), "InstallationPayload");
}

@test:Config {}
function testInstallationRepositoriesAddedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("installation_repositories", "installation_repositories_added");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("InstallationRepositoriesService.onInstallationRepositoriesAdded"), "InstallationRepositoriesService.onInstallationRepositoriesAdded should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/installation_repositories_added.json`);
    json received = boundJsonOf("InstallationRepositoriesService.onInstallationRepositoriesAdded");
    assertBindsFixture(received, deliveredEvent(received, fixture), "InstallationRepositoriesPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/installation_repositories_removed.json`);
    json received = boundJsonOf("InstallationRepositoriesService.onInstallationRepositoriesRemoved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "InstallationRepositoriesPayload");
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
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/membership_added.json`);
    json received = boundJsonOf("MembershipService.onMembershipAdded");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MembershipPayload");
}

@test:Config {}
function testMembershipRemovedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("membership", "membership_removed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MembershipService.onMembershipRemoved"), "MembershipService.onMembershipRemoved should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/membership_removed.json`);
    json received = boundJsonOf("MembershipService.onMembershipRemoved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MembershipPayload");
}

@test:Config {}
function testMergeGroupChecksRequestedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("merge_group", "merge_group_checks_requested");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MergeGroupService.onMergeGroupChecksRequested"), "MergeGroupService.onMergeGroupChecksRequested should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/merge_group_checks_requested.json`);
    json received = boundJsonOf("MergeGroupService.onMergeGroupChecksRequested");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MergeGroupPayload");
    map<json> bound = boundPayloadOf("MergeGroupService.onMergeGroupChecksRequested");
    test:assertFalse(bound.hasKey("merge_group"), "'merge_group' should have bound to its camelCase field on MergeGroupPayload, not stayed a raw key");
}

@test:Config {}
function testMergeGroupDestroyedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("merge_group", "merge_group_destroyed");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("MergeGroupService.onMergeGroupDestroyed"), "MergeGroupService.onMergeGroupDestroyed should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/merge_group_destroyed.json`);
    json received = boundJsonOf("MergeGroupService.onMergeGroupDestroyed");
    assertBindsFixture(received, deliveredEvent(received, fixture), "MergeGroupPayload");
    map<json> bound = boundPayloadOf("MergeGroupService.onMergeGroupDestroyed");
    test:assertFalse(bound.hasKey("merge_group"), "'merge_group' should have bound to its camelCase field on MergeGroupPayload, not stayed a raw key");
}

@test:Config {}
function testPublicDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("public", "public");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("PublicService.onPublic"), "PublicService.onPublic should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/public.json`);
    json received = boundJsonOf("PublicService.onPublic");
    assertBindsFixture(received, deliveredEvent(received, fixture), "PublicPayload");
}

@test:Config {}
function testRepositoryDispatchDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("repository_dispatch", "repository_dispatch");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("RepositoryDispatchService.onRepositoryDispatch"), "RepositoryDispatchService.onRepositoryDispatch should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/repository_dispatch.json`);
    json received = boundJsonOf("RepositoryDispatchService.onRepositoryDispatch");
    assertBindsFixture(received, deliveredEvent(received, fixture), "RepositoryDispatchPayload");
    map<json> bound = boundPayloadOf("RepositoryDispatchService.onRepositoryDispatch");
    test:assertFalse(bound.hasKey("client_payload"), "'client_payload' should have bound to its camelCase field on RepositoryDispatchPayload, not stayed a raw key");
}

@test:Config {}
function testSecretScanningAlertAssignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_assigned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertAssigned"), "SecretScanningAlertService.onSecretScanningAlertAssigned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/secret_scanning_alert_assigned.json`);
    json received = boundJsonOf("SecretScanningAlertService.onSecretScanningAlertAssigned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecretScanningAlertPayload");
}

@test:Config {}
function testSecretScanningAlertCreatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_created");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertCreated"), "SecretScanningAlertService.onSecretScanningAlertCreated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/secret_scanning_alert_created.json`);
    json received = boundJsonOf("SecretScanningAlertService.onSecretScanningAlertCreated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecretScanningAlertPayload");
}

@test:Config {}
function testSecretScanningAlertPubliclyLeakedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_publicly_leaked");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertPubliclyLeaked"), "SecretScanningAlertService.onSecretScanningAlertPubliclyLeaked should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/secret_scanning_alert_publicly_leaked.json`);
    json received = boundJsonOf("SecretScanningAlertService.onSecretScanningAlertPubliclyLeaked");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecretScanningAlertPayload");
}

@test:Config {}
function testSecretScanningAlertReopenedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_reopened");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertReopened"), "SecretScanningAlertService.onSecretScanningAlertReopened should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/secret_scanning_alert_reopened.json`);
    json received = boundJsonOf("SecretScanningAlertService.onSecretScanningAlertReopened");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecretScanningAlertPayload");
}

@test:Config {}
function testSecretScanningAlertResolvedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_resolved");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertResolved"), "SecretScanningAlertService.onSecretScanningAlertResolved should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/secret_scanning_alert_resolved.json`);
    json received = boundJsonOf("SecretScanningAlertService.onSecretScanningAlertResolved");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecretScanningAlertPayload");
}

@test:Config {}
function testSecretScanningAlertUnassignedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_unassigned");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertUnassigned"), "SecretScanningAlertService.onSecretScanningAlertUnassigned should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/secret_scanning_alert_unassigned.json`);
    json received = boundJsonOf("SecretScanningAlertService.onSecretScanningAlertUnassigned");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecretScanningAlertPayload");
}

@test:Config {}
function testSecretScanningAlertValidatedDispatch() returns error? {
    http:Response response = check sendSignedTriggerWebhook("secret_scanning_alert", "secret_scanning_alert_validated");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    test:assertTrue(waitForDispatch("SecretScanningAlertService.onSecretScanningAlertValidated"), "SecretScanningAlertService.onSecretScanningAlertValidated should have fired");
    json fixture = check io:fileReadJson(string `${TRIGGER_PAYLOAD_DIR}/secret_scanning_alert_validated.json`);
    json received = boundJsonOf("SecretScanningAlertService.onSecretScanningAlertValidated");
    assertBindsFixture(received, deliveredEvent(received, fixture), "SecretScanningAlertPayload");
}

