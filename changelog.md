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
- Corrected spec inaccuracies that the stricter payload binding surfaced. `App`, `MarketplacePurchase`, `WorkflowRun` and the inline `invitation` object declared fields as required that GitHub omits entirely on events where the object is not applicable - it sends `{}` instead. `ProjectsV2ItemPayload` required `changes`, which GitHub only sends on `edited` and `reordered` actions, not on `created`.
- `Repository.created_at` and `Repository.pushed_at` are now typed as a string-or-integer union. GitHub sends them as ISO 8601 strings on most events but as Unix timestamps on push events; the spec declared them as strings only.
- Completed four sponsorship fixtures whose `changes.tier.from` was an empty object, and two issue-comment fixtures that carried an empty `changes` object GitHub does not send for `pinned`/`unpinned`. Added the `state` and `body` fields GitHub always sends but the pinned/unpinned fixtures omitted.

## [0.1.0] - 2026-09-22
### Added
- Initial release of the GitHub trigger as its own package, migrated out of the `asyncapi-triggers` monorepo (265 events), with HMAC-SHA256 signature verification.
