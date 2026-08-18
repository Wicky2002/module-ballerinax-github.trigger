## Overview

The GitHub Trigger module allows you to listen to the following events occurring in GitHub:
- `Ping`, `Fork`, `Push`, `Create`, `Watch`
- `Release`, `Issue`, `Label`, `Milestone`
- `Pull Request`, `Pull Request Review`, `Pull Request Review Comment`

This module receives GitHub's webhook events directly - it does not call GitHub's own REST/GraphQL
API on your behalf.

## Setup guide

Before using this trigger in your Ballerina application, you need a GitHub account with access to
the repository/organization you want to receive events from, and a Ballerina service that GitHub
can reach over the internet to deliver webhook payloads to. The two sections below cover both a
quick local test setup and a production deployment.

### Try it out locally

Use this flow to test your webhook handling logic on your own machine before deploying anywhere,
using [ngrok](https://ngrok.com/) to expose your local listener to the internet.

1. Write your service (see [Quickstart](#quickstart) below) and run it locally with `bal run`. Note
   the port it's listening on (`8090` by default).

2. Expose that port with ngrok:

   ```bash
   ngrok http 8090
   ```

   Copy the `Forwarding` URL ngrok prints out - this is your temporary public webhook URL.

   <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-github.trigger/main/docs/setup/resources/ngrok-forwarding.png" alt="ngrok forwarding a public URL to localhost:8090" width="600">

3. On the GitHub repository (or organization) you want events from, go to **Settings > Webhooks**
   and click **Add webhook**.

   <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-github.trigger/main/docs/setup/resources/webhook-settings-page.png" alt="GitHub repository Webhooks settings page" width="600">

4. Fill in the webhook form:
   - **Payload URL**: the ngrok forwarding URL from step 2.
   - **Content type**: `application/json`.
   - **Secret**: any string - this must exactly match the `webhookSecret` configured in your
     service (see [Quickstart](#quickstart)), since it's used to verify that incoming payloads
     really came from GitHub.

   <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-github.trigger/main/docs/setup/resources/webhook-form-filled.png" alt="GitHub webhook form filled in with Payload URL, content type, and secret" width="600">

5. Under **Which events would you like to trigger this webhook?**, select **Let me select
   individual events** and check the events your service handles.

   <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-github.trigger/main/docs/setup/resources/webhook-event-selection.png" alt="GitHub webhook individual event selection checkboxes" width="600">

6. Click **Add webhook**. This registers the webhook, but (unlike creating one for the first time
   in most other flows) does not itself redeliver a test ping - use **Recent Deliveries >
   Redeliver** on the webhook's page to trigger one, or just push a real commit. A successful
   delivery shows a green checkmark back on the Webhooks settings page.

   <img src="https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-github.trigger/main/docs/setup/resources/webhook-confirmed.png" alt="GitHub webhook showing a successful delivery" width="600">

### Production / business integration

For production use, deploy your Ballerina service somewhere with a stable, internet-reachable
HTTPS URL. Ballerina doesn't require any specific hosting platform - containers, a VM, a managed
PaaS, or anything else that gives you a stable HTTPS endpoint all work equally well.

Rather than hardcoding `webhookSecret` as shown in the Quickstart, inject it via `Config.toml` (or
your platform's equivalent configuration/secret mechanism), since it's a `configurable` value:

```toml
[<your_org>.<your_module_name>.userInput]
webhookSecret = "<your production secret>"
```

Then follow the same webhook registration steps as above, using your production URL as the Payload
URL and this real secret instead of a placeholder.

### Compatibility

|                     | Version                       |
|---------------------|--------------------------------|
| Ballerina Language  | Ballerina Swan Lake 2201.13.0 |

## Quickstart

To use the GitHub Trigger in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the GitHub Trigger Ballerina library

```ballerina
import ballerinax/github.trigger as github;
```

### Step 2: Initialize the GitHub Webhook Listener

Initialize the trigger by providing the listener config and a port number/`http:Listener` object.

```ballerina
configurable github:ListenerConfig userInput = {
    webhookSecret: "xxxxxx"
};
listener github:Listener webhookListener = new (userInput, 8090);
```

`webhookSecret` should always be set to the same secret configured on the webhook's GitHub page -
this is what the trigger uses to verify incoming payloads actually came from GitHub. Omitting it
disables that verification, so it isn't shown here as a normal setup option.

If you don't provide a port it will use the default port, which is 8090 - `webhookSecret` should
still always be set.

```ballerina
listener github:Listener webhookListener = new (userInput);
```

### Step 3: Use the correct service type to implement the service

Use the correct service type for the corresponding channel when implementing the service. For
example, if you need to listen to Label events, use the `LabelService` service type as follows.
Every remote function declared on a service type must be implemented - Ballerina requires a
complete implementation, not just the ones you care about.

```ballerina
service github:LabelService on webhookListener {

    remote function onLabelCreated(github:LabelPayload payload) returns error? {
        return;
    }

    remote function onLabelEdited(github:LabelPayload payload) returns error? {
        return;
    }

    remote function onLabelDeleted(github:LabelPayload payload) returns error? {
        return;
    }
}
```

### Step 4: Provide remote functions corresponding to the events you're interested in

Remote functions must be implemented inside a service, on the matching service type for the
channel you're listening to - for example, `github:PushService` for push events.

```ballerina
import ballerina/log;

service github:PushService on webhookListener {
    remote function onPush(github:PushPayload payload) returns error? {
        log:printInfo("Received push event", eventPayload = payload);
    }
}
```

### Step 5: Run the service

Use the `bal run` command to compile and run the Ballerina program.

### Step 6: Register a webhook so GitHub can reach your service

See [Setup guide](#setup-guide) above for the full walkthrough (with screenshots) of exposing your
service and registering the webhook, for both local testing and production use.

## Examples

The `github.trigger` module provides practical examples illustrating usage in various scenarios.
Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-github.trigger/tree/main/examples/),
covering common webhook event handling use cases.

## Report issues

To report bugs, request new features, start new discussions, etc., go to the
[Ballerina Library repository](https://github.com/ballerina-platform/ballerina-library).

## Useful links

- For more information go to the [`github.trigger` package](https://central.ballerina.io/ballerinax/github.trigger/latest).
- If you're upgrading from an older version, see the [migration notes](../docs/migration-notes.md) for renamed functions and other breaking changes.
- For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
- Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
- Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
