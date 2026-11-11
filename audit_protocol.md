# Agent Audit Protocol

**Status: Proposed for project-owner review.** This protocol is not approved, and no audit approval is implied by entries in [Other/audit_log.md](Other/audit_log.md).

## Proposed review steps

1. **Check project facts and scope.** Compare the source table, local-time year filter, fields, and one-row definition against `AGENTS.md`, the saved SQL, and the BigQuery schema.
2. **Reproduce reported values.** Run the saved query in the team's own Google Cloud project, capture the query/job evidence and results, and independently recalculate the benchmark, difference, and percentage shown in `README.md` and `findings.md`.
3. **Review data quality and cleaning.** Inspect duplicate keys, missing values, negative fares, negative durations and distances, and end-before-start timestamps. Confirm each exclusion is justified and documented in `sql/README.md`.
4. **Check interpretation.** Confirm recorded `fare` is described as fare only, observed results are distinct from recommendations, and no causal, profit, or net-revenue claim is made.
5. **Record the human decision.** The reviewer records their name, date, evidence checked, corrections requested, and explicit approval or rejection in the matching category table in `Other/audit_log.md`. The agent must not mark its own work as human-approved.

## Evidence and decision rules

- A screenshot or saved BigQuery result should show the executed SQL or query name, project context where visible, and result values. Keep the full result where a table has many rows.
- Record an audit as approved only when a named human reviewer explicitly approves it. Otherwise use `pending` or `not approved`.
- If the query, result, calculation, cleaning rule, or project context changes, rerun the affected checks and add a dated log entry instead of silently replacing prior evidence.
- Never include credentials, access tokens, or private keys in audit evidence.
