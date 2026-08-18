# PR automation

Logs a notification when a pull request is opened, and reports whether a closed pull request was
merged or just closed. Demonstrates a service type with many required remote functions
(`PullRequestService` has 21) - Ballerina requires every one of them to be implemented, even the
ones you don't care about, so this example shows the no-op boilerplate that comes with it.

## Run

```bash
bal run
```

Then follow the [Setup guide](../../ballerina/README.md#setup-guide) in the package README to
expose this listener and register a webhook subscribed to at least the `Pull requests` event.
