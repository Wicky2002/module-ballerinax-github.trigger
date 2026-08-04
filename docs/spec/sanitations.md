_Author_:  <!-- TODO: Add author name --> \
_Created_: <!-- TODO: Add date --> \
_Updated_: <!-- TODO: Add date --> \
_Edition_: Swan Lake

# Sanitation for AsyncAPI specification

This document records the sanitation done on top of the AsyncAPI specification for the GitHub
trigger (`asyncapi.yml`, this directory). Unlike a client connector, this package is a webhook
*trigger* (an inbound listener) generated from an AsyncAPI spec, not an OpenAPI client spec — the
spec describes the webhook events GitHub delivers, not a REST API this package calls out to.
These changes are done in order to improve the overall usability, and as workarounds for some
known language limitations.

[//]: # (TODO: Add sanitation details)
1. 
2. 
3. 

## Ballerina trigger generation

The Ballerina trigger source (`listener.bal`, `dispatcher_service.bal`, `service_types.bal`,
`data_types.bal`) is generated from `asyncapi.yml` using the `asyncapi-tools` generator
(`ballerina-platform/asyncapi-tools`). The command should be executed from the repository root
directory.

```bash
# TODO: Add asyncapi-tools generator command used to generate the trigger
```
Note: The license year is hardcoded to 2024, change if necessary.
