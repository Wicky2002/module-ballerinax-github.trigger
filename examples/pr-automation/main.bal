import ballerina/log;
import ballerinax/github.trigger as github;

configurable github:ListenerConfig config = {
    webhookSecret: "xxxxxx"
};

listener github:Listener webhookListener = new (config, 8090);

// Auto-notify on pull request open and merge. PullRequestService declares many more remote
// functions than these two - every one of them must still be implemented, even as a no-op,
// since Ballerina requires a complete implementation of the service type.
service github:PullRequestService on webhookListener {

    remote function onPullRequestOpened(github:PullRequestPayload payload) returns error? {
        log:printInfo(string `New PR #${payload.number} "${payload.pull_request.title}" opened by ${payload.pull_request.user?.login ?: "unknown"}: ${payload.pull_request.html_url ?: ""}`);
    }

    remote function onPullRequestClosed(github:PullRequestPayload payload) returns error? {
        if payload.pull_request?.merged == true {
            log:printInfo(string `PR #${payload.number} "${payload.pull_request.title}" was merged`);
        } else {
            log:printInfo(string `PR #${payload.number} "${payload.pull_request.title}" was closed without merging`);
        }
    }

    remote function onPullRequestEnqueued(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestReviewRequestRemoved(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestReadyForReview(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestLabeled(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestUnassigned(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestEdited(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestSynchronize(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestReviewRequested(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestReopened(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestAutoMergeDisabled(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestLocked(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestAutoMergeEnabled(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestMilestoned(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestDequeued(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestUnlabeled(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestUnlocked(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestAssigned(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestConvertedToDraft(github:PullRequestPayload payload) returns error? {
        return;
    }

    remote function onPullRequestDemilestoned(github:PullRequestPayload payload) returns error? {
        return;
    }
}
