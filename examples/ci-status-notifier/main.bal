import ballerina/log;
import ballerinax/github.trigger as github;

configurable github:ListenerConfig config = {
    webhookSecret: "xxxxxx"
};

listener github:Listener webhookListener = new (config, 8090);

// A different domain from the other two examples: CI/workflow status instead of code changes.
service github:WorkflowRunService on webhookListener {

    remote function onWorkflowRunRequested(github:WorkflowRunPayload payload) returns error? {
        log:printInfo(string `Workflow "${payload.workflow_run.name}" requested`);
    }

    remote function onWorkflowRunInProgress(github:WorkflowRunPayload payload) returns error? {
        log:printInfo(string `Workflow "${payload.workflow_run.name}" is in progress`);
    }

    remote function onWorkflowRunCompleted(github:WorkflowRunPayload payload) returns error? {
        string conclusion = payload.workflow_run?.conclusion ?: "unknown";
        if conclusion == "success" {
            log:printInfo(string `Workflow "${payload.workflow_run.name}" completed successfully`);
        } else {
            log:printWarn(string `Workflow "${payload.workflow_run.name}" completed with conclusion: ${conclusion}`);
        }
    }
}
