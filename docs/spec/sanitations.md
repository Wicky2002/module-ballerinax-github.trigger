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

1. Marked the `assignee` field on `PullRequestEvent` and the `starred_at` field on `StarEvent` as
   explicitly nilable (`?` on the type) in the generated Ballerina records, matching the
   `nullable: true` declared on both in the spec - the generator otherwise produced non-nilable
   required fields, which fails to deserialize a real payload where either value is `null`.
2. Reordered the `GenericDataType` union so `Installation` (a record with only optional fields)
   sits last, after every concrete event type. Ballerina resolves union-typed JSON conversion by
   trying members in declaration order; with `Installation` earlier in the list, a payload that
   should bind to a more specific event type could incorrectly match `Installation` first, since
   its all-optional shape accepts almost any object.
3. Quoted the `off` and `null` enum values in `asyncapi.yml` (`pull_request_reviews_enforcement_level`
   and `security_severity_level`) - unquoted, YAML 1.1 parses bare `off`/`null` as the boolean
   `false`/the null literal rather than the intended string values.

## Ballerina trigger generation

The Ballerina trigger source (`listener.bal`, `dispatcher_service.bal`, `service_types.bal`,
`data_types.bal`) is generated from `asyncapi.yml` using the `asyncapi-tools` generator
(`ballerina-platform/asyncapi-tools`). The command should be executed from the repository root
directory.

```bash
# TODO: Add asyncapi-tools generator command used to generate the trigger
```
Note: The license year is hardcoded to 2021 (matching the source files' copyright year), change
if necessary.
