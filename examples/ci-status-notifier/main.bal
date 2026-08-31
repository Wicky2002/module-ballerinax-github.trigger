import ballerina/log;
import ballerinax/github.trigger as github;

configurable github:ListenerConfig config = {
    webhookSecret: "xxxxxx"
};

listener github:Listener webhookListener = new (config, 8090);

// A different domain from the other two examples: CI/workflow status instead of code changes.
service github:WorkflowRunService on webhookListener {

    remote function onWorkflowRunRequested(github:WorkflowRunPayload payload) returns error? {
        log:printInfo("Workflow requested", workflow = payload.workflow_run.name);
    }

    remote function onWorkflowRunInProgress(github:WorkflowRunPayload payload) returns error? {
        log:printInfo("Workflow in progress", workflow = payload.workflow_run.name);
    }

    remote function onWorkflowRunCompleted(github:WorkflowRunPayload payload) returns error? {
        string conclusion = payload.workflow_run?.conclusion ?: "unknown";
        if conclusion == "success" {
            log:printInfo("Workflow completed successfully", workflow = payload.workflow_run.name);
        } else {
            log:printWarn("Workflow completed", workflow = payload.workflow_run.name, conclusion = conclusion);
        }
    }
}
