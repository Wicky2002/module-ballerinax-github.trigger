# Changelog
This file contains all the notable changes done to the Ballerina GitHub trigger through the releases.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.0] - 2026-09-28
### Changed
- [Generated record fields are now camelCase, carrying the original JSON key via `@jsondata:Name`](https://github.com/ballerina-platform/ballerina-library/issues/9218). This renames public fields - code reading them by their previous snake_case names needs updating.
- [Webhook payloads now bind to the concrete event type instead of the `GenericDataType` union](https://github.com/ballerina-platform/ballerina-library/issues/9218). Binding into a union resolved to the first structurally matching member, so the value handed to a handler was typed by declaration order rather than by which event arrived. An unrecognised event identifier now returns an error instead of binding to an arbitrary member.
- [Generated doc comments are wrapped to the 120-character line budget](https://github.com/ballerina-platform/ballerina-library/issues/9217) instead of being emitted as a single long line.

### Fixed
- `ProjectsV2ItemPayload` no longer requires `changes`, which GitHub only sends on `edited`/`reordered` actions, not `created`. Verified against real payloads in [octokit/webhooks](https://github.com/octokit/webhooks).
- `Repository.created_at` and `Repository.pushed_at` are now typed as a string-or-integer union. GitHub sends them as ISO 8601 strings on most events but as Unix timestamps on `push` events specifically; verified against a real octokit `push` payload.
- Fixed thirteen test fixtures carrying synthetic placeholder data that the stricter payload binding surfaced as real dispatch failures: nine had empty-object (`{}`) stand-ins for `App`, `WorkflowRun`, `invitation`, or `previous_marketplace_purchase` fields that GitHub never actually sends empty (verified against octokit/webhooks - each is either fully populated or the key is omitted), four sponsorship fixtures had an empty `changes.tier.from`, and two issue-comment fixtures carried an empty `changes` object plus missing `state`/`body` fields. `App`, `MarketplacePurchase`, `WorkflowRun`, and `invitation`'s required-field declarations in the spec were correct throughout - the fixtures were wrong, not the spec.

## [0.1.0] - 2026-09-22
### Added
- Initial release of the GitHub trigger as its own package, migrated out of the `asyncapi-triggers` monorepo (265 events), with HMAC-SHA256 signature verification.
