# Project Audit Skill

Use this project-specific process when creating or revising analysis, findings, or audit records.

## Evidence and analysis

- Tie data claims to a saved query, source documentation, or result supplied by the project owner.
- Mark assumptions and inferences clearly; do not present them as facts.
- Do not invent query results, scan estimates, or human review actions.
- Keep each query reproducible and put its explanations and cleaning decisions in `sql/README.md`.
- Treat BigQuery output and documented schema as evidence to inspect; confirm fields and estimated bytes before a query is run.

## Audit records

- `Other/audit_log.md` records checks performed by a human project owner, not the agent's own internal checks.
- Add an entry only when the owner actually verifies or corrects something. Record the check and its result in the appropriate category.
- Do not modify `Other/audit_protocol.md` without the owner's approval of the proposed addition. Present the exact proposed text and wait for approval first.
- Never copy another project's audit examples as if they happened in this project.
