# Migration notes: full regeneration from spec (breaking)

This release replaces the hand-maintained `ballerina/` source (`data_types.bal`,
`dispatcher_service.bal`, `listener.bal`, `service_types.bal`, `tests/`) with output freshly
generated from `docs/spec/asyncapi.yml` using the `asyncapi-tools` generator, after fixing two real
bugs in that generator (see "Behavioral fixes" below). Previously, the shipped `.bal` files had
drifted from what the spec + generator actually produce, because past changes were hand-patched
into the generated files directly instead of into the spec, and never reconciled back. This release
removes that drift entirely - future changes should go through the spec and a regeneration, not
hand edits to `ballerina/*.bal`.

## Breaking change: remote function names

Nearly every remote function name changes from a short, action-only form to a full
`on<EventType><Action>` form, e.g. `onCompleted` (on `CheckSuiteService`) becomes
`onCheckSuiteCompleted`. This is not a bug fix or a stylistic choice made this release - it's what
the spec's `x-ballerina-event-type` values have said since an AsyncAPI 3.0 migration a while back;
the old short names were only still shipping because the generated code was never refreshed against
that change.

**Full old -> new mapping, per service type:** see `docs/spec/function-rename-table.md` in this
directory (239 renamed functions across the 75 service types that had any change).

## New: `IssueDependenciesService` now has 4 functions, not 2

Previously: `onIssueDependencyAdded`, `onIssueDependencyRemoved` (generic, covering both
"blocking" and "blocked by" relationships in one function each).

Now: `onIssueDependenciesBlockingAdded`, `onIssueDependenciesBlockingRemoved`,
`onIssueDependenciesBlockedByAdded`, `onIssueDependenciesBlockedByRemoved` - matching GitHub's real
4 distinct actions. This was already possible from the spec and the payload data; the shipped code
just never routed to it. If you were implementing the old generic functions and switching on the
payload's `action` field yourself, you can now implement the specific function you actually need
directly.

## Fixed: 8 events with incomplete identifiers

`watch`, `deployment`, `deployment_status`, `installation_target`, `custom_property_values`,
`github_app_authorization`, `meta`, and `commit_comment` were declared in the spec with a bare
event-type identifier (e.g. `"watch"`) instead of the full action-specific one (e.g.
`"watch_started"`). Since these services each have only one action today, this had no visible
effect other than the function names below now including that action. Same root cause and same fix
as `ballerina-platform/asyncapi-triggers#188`, which fixed this same gap in the old monorepo but
was never carried into this repo's copy of the spec.

## Behavioral fixes (from the generator itself, not spec-driven)

Two real bugs were fixed in `asyncapi-tools`'s generator (`ballerina-platform/asyncapi-tools`, PR
pending) and are reflected in this regeneration:

1. **Ack no longer blocks on the user's handler.** Previously, the dispatcher acknowledged the
   webhook *after* invoking the matched remote function, using `check` - so an error in a user's
   handler prevented the acknowledgement entirely, and the delivering service (GitHub) would treat
   it as a failed delivery and retry. The ack is now sent immediately after the payload is parsed,
   before the handler runs; handler errors are now logged, not propagated.
2. **Signature verification now supports a configured `headerFormat`.** The spec's
   `x-ballerina-auth` block was missing `signature.headerFormat`, so signature verification
   defaulted to comparing a bare, unprefixed digest - which would have rejected every real GitHub
   webhook (GitHub always sends `sha256=<hex>`). `docs/spec/asyncapi.yml` now declares
   `headerFormat: "sha256=$signature"` explicitly.

## Test suite

The 13 hand-written test files under `ballerina/tests/` are replaced by a single generated
`tests/dispatch_test.bal`, covering all 265 events against real Octokit sample webhook payloads
(`ballerina/tests/resources/trigger_payloads/`), each sent as a real signed HTTP request to a test
listener and asserting the correct remote function fired. `bal test`: 265/265 passing.
