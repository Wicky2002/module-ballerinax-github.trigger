## Overview

The GitHub Trigger module allows you to listen to the following events occurring in GitHub:
- `Ping`, `Fork`, `Push`, `Create`, `Watch`
- `Release`, `Issue`, `Label`, `Milestone`
- `Pull Request`, `Pull Request Review`, `Pull Request Review Comment`

This module receives GitHub's webhook events directly - it does not call GitHub's own REST/GraphQL
API on your behalf.

## Setup guide

Before using this trigger in your Ballerina application, complete the following:

* Create a GitHub account and have access to the repository/organization you want to receive
  events from.

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
    secret: "xxxxxx"
};
listener github:Listener webhookListener = new (userInput, 8090);
```

Listener config is not mandatory if you haven't set up a secret on the webhook page - you can
omit it and initialize as follows.

```ballerina
listener github:Listener webhookListener = new (listenOn = 8090);
```

If you don't provide a port it will use the default port, which is 8090.

```ballerina
listener github:Listener webhookListener = new ();
```

### Step 3: Use the correct service type to implement the service

Use the correct service type for the corresponding channel when implementing the service. For
example, if you need to listen to Issue events, use the `IssuesService` service type as follows.

```ballerina
service github:IssuesService on webhookListener {

    remote function onAssigned(github:IssuesEvent payload) returns error? {
        return;
    }

    remote function onClosed(github:IssuesEvent payload) returns error? {
        return;
    }

    remote function onLabeled(github:IssuesEvent payload) returns error? {
        return;
    }

    remote function onOpened(github:IssuesEvent payload) returns error? {
        return;
    }

    remote function onReopened(github:IssuesEvent payload) returns error? {
        return;
    }

    remote function onUnassigned(github:IssuesEvent payload) returns error? {
        return;
    }

    remote function onUnlabeled(github:IssuesEvent payload) returns error? {
        return;
    }
}
```

### Step 4: Provide remote functions corresponding to the events you're interested in

```ballerina
remote function onPush(github:PushEvent payload) returns error? {
    log:printInfo("Received push event", eventPayload = payload);
}
```

### Step 5: Run the service

Use the `bal run` command to compile and run the Ballerina program.

### Step 6: Configure the GitHub webhook with the URL of the service

- Create a webhook in GitHub following the
  [GitHub documentation](https://docs.github.com/en/developers/webhooks-and-events/webhooks/creating-webhooks).
- Provide the public URL of the started service as the Payload URL (add a trailing `/` to the URL
  if it's not already present).
- Provide `application/json` for the content type.
- Select the list of events you need to subscribe to and click **Add webhook**.

This adds a subscription to the GitHub event API, and the Ballerina service functions will be
triggered once a subscribed event fires.

## Examples

The `github.trigger` module provides practical examples illustrating usage in various scenarios.
Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-github.trigger/tree/main/examples/),
covering common webhook event handling use cases.

## Report issues

To report bugs, request new features, start new discussions, etc., go to the
[Ballerina Library repository](https://github.com/ballerina-platform/ballerina-library).

## Useful links

- For more information go to the [`github.trigger` package](https://central.ballerina.io/ballerinax/github.trigger/latest).
- For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
- Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
- Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
