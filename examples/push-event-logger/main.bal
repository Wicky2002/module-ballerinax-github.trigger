import ballerina/log;
import ballerinax/github.trigger as github;

configurable github:ListenerConfig config = {
    webhookSecret: "xxxxxx"
};

listener github:Listener webhookListener = new (config, 8090);

// The minimal, canonical use case: log every push to any branch or tag.
service github:PushService on webhookListener {

    remote function onPush(github:PushPayload payload) returns error? {
        log:printInfo(string `${payload.pusher.name ?: payload.sender.login} pushed ${payload.commits.length()} commit(s) to ${payload.ref} in ${payload.repository.full_name}`);

        foreach github:Commit c in payload.commits {
            log:printInfo(string `  - ${c.id.substring(0, 7)}: ${c.message}`);
        }
    }
}
