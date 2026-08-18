# CI status notifier

Listens for GitHub Actions workflow run events and logs the outcome - a different domain from the
other two examples (repository/code events), showing this connector also covers CI status.

## Run

```bash
bal run
```

Then follow the [Setup guide](../../ballerina/README.md#setup-guide) in the package README to
expose this listener and register a webhook subscribed to at least the `Workflow runs` event.
