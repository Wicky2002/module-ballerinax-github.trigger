# Examples

The `ballerinax/github.trigger` connector provides practical examples illustrating usage in various scenarios.

1. [Push event logger](https://github.com/ballerina-platform/module-ballerinax-github.trigger/tree/main/examples/push-event-logger) - Log each push with its commits.
2. [Pull request automation](https://github.com/ballerina-platform/module-ballerinax-github.trigger/tree/main/examples/pr-automation) - React to pull requests being opened, merged or closed.
3. [CI status notifier](https://github.com/ballerina-platform/module-ballerinax-github.trigger/tree/main/examples/ci-status-notifier) - Report the outcome of GitHub Actions workflow runs.

## Prerequisites

Expose the running example with a public URL and register it as a webhook on your repository with a secret, as described in the [Setup guide](https://github.com/ballerina-platform/module-ballerinax-github.trigger/blob/main/ballerina/README.md#setup-guide).

## Running an example

Execute the following commands from an example's directory (for example `cd ci-status-notifier`) to build it from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
