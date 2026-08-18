# Push event logger

The minimal, canonical `github.trigger` use case: listen for `push` events on a repository and log
a one-line summary plus each commit's message.

## Run

```bash
bal run
```

Then follow the [Setup guide](../../ballerina/README.md#setup-guide) in the package README to
expose this listener and register a webhook subscribed to at least the `Pushes` event.
