_Author_:  Dinuka Wickramasinghe \
_Created_: 2026-08-17 \
_Updated_: 2026-09-08 \
_Edition_: Swan Lake

# Sanitation for AsyncAPI specification

This document records the sanitation done on top of the AsyncAPI specification for the GitHub trigger (`asyncapi.yml`, this directory). Unlike a client connector, this package is a webhook *trigger* (an inbound listener) generated from an AsyncAPI spec, not an OpenAPI client spec — the spec describes the webhook events GitHub delivers, not a REST API this package calls out to. These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. Marked the `assignee` field on `PullRequestPayload` and the `starred_at` field on `StarPayload` as explicitly nilable (`?` on the type) in the generated Ballerina records, matching the `nullable: true` declared on both in the spec - the generator otherwise produced non-nilable required fields, which fails to deserialize a real payload where either value is `null`.
2. Reordered the `GenericDataType` union so that schemas with no required fields (e.g. `Installation`) are grouped after every concrete event type, instead of wherever they happened to fall in declaration order. Ballerina resolves union-typed JSON conversion by trying members in declaration order; a schema with every field optional can structurally match almost any payload, so leaving one ahead of a more specific event type risks it being matched first.
3. Quoted the `off` and `null` enum values in `asyncapi.yml` (`pull_request_reviews_enforcement_level` and `security_severity_level`) - unquoted, YAML 1.1 parses bare `off`/`null` as the boolean `false`/the null literal rather than the intended string values.
4. Filled in ~44 previously-blank (`type: object` with no properties) webhook payload fields, tracked in `ballerina-platform/ballerina-library#9120`. Each shape was checked against real GitHub data rather than guessed from field or event names - primarily [octokit/webhooks](https://github.com/octokit/webhooks) (community-maintained real example payloads and JSON schemas) and [github/docs](https://github.com/github/docs) (GitHub's own docs-source repository, which renders the official webhook-events-and-payloads pages and proved more current than octokit/webhooks for a few newer fields). A handful of fields remain deliberately blank where the real-world shape is still too thin or inconsistent across both sources to be confident about - see issue #9120 for the current list.

5. `ProjectsV2ItemPayload` no longer requires `changes`. Verified against real payloads in [octokit/webhooks](https://github.com/octokit/webhooks): `changes` is absent on `created`, present on `edited`/`reordered`. This went unnoticed while payloads were bound with `cloneWithType`, which silently left the field unset when it was missing; binding to the concrete event type (`ballerina-platform/ballerina-library#9218`) surfaced it as a real dispatch failure against the existing `created` fixture.
6. Typed `Repository.created_at` and `Repository.pushed_at` as a string-or-integer `oneOf`. Verified against a real `push` webhook payload in octokit/webhooks: GitHub sends both as Unix timestamps (integers) on `push` specifically, ISO 8601 strings elsewhere - the spec declared them `string` only, so binding to the concrete type on a real push payload failed. `Repository.updated_at` was checked too and is genuinely always a string; left unchanged.
7. Fixed nine test fixtures carrying synthetic empty-object placeholders (`{}`) for fields the tool had auto-generated as stand-ins during migration, for `App` (`check_run.app`, `performed_via_github_app`), `WorkflowRun` (`workflow_run`), `invitation`, and `previous_marketplace_purchase`. Cross-checked each field against octokit/webhooks: GitHub never sends `{}` for any of these - each is either fully populated or the key is omitted from the payload entirely. `App`, `MarketplacePurchase`, `WorkflowRun`, and `invitation`'s `required` lists were correct all along; the fixtures were wrong, not the spec. (An earlier version of this fix mistakenly went the other way - dropped these `required` lists - before the octokit cross-check caught it.) Fixtures were completed either by removing the key (`performed_via_github_app`, `invitation`, matching GitHub's real "omit when not applicable" behaviour) or by populating it with a realistic value (`check_run.app`, `workflow_run`, `previous_marketplace_purchase` - the last one cloned from its already-populated sibling field, `marketplace_purchase`, in the same fixture).

## Ballerina trigger generation

The Ballerina trigger source (`listener.bal`, `dispatcher_service.bal`, `service_types.bal`, `types.bal`) is generated from `asyncapi.yml` using the `asyncapi-tools` generator (`ballerina-platform/asyncapi-tools`). The command should be executed from the repository root directory.

```bash
bal asyncapi http -i docs/spec/asyncapi.yml -o ballerina/
```

This overwrites `listener.bal`, `dispatcher_service.bal`, `service_types.bal`, and the data-types file in `ballerina/` with fresh output. Diff the result before committing - anything currently correct only because of a hand patch to these files (rather than to the spec or the generator itself) will be silently reverted by this command.

Note: the generated license header year is derived at generation time, not hardcoded - it will match whatever year the tool is run in.
