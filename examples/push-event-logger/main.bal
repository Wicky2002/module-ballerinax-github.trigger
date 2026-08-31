import ballerina/log;
import ballerinax/github.trigger as github;

configurable github:ListenerConfig config = {
    webhookSecret: "xxxxxx"
};

listener github:Listener webhookListener = new (config, 8090);

// The minimal, canonical use case: log every push to any branch or tag.
service github:PushService on webhookListener {

    remote function onPush(github:PushPayload payload) returns error? {
        log:printInfo("Push received", pusher = payload.pusher.name ?: payload.sender.login,
                commitCount = payload.commits.length(), ref = payload.ref,
                repository = payload.repository.full_name);

        foreach github:Commit c in payload.commits {
            log:printInfo("Commit", sha = c.id.substring(0, 7), message = c.message);
        }
    }
}
