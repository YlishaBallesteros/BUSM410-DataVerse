# Agent Audit Protocol

This protocol describes how the DataVerse team works with the project agent.

## Team workflow

1. **Set the analysis scope.** The team identifies the business question, source table, time window, row definition, and intended decision. The agent records them in the charter and project guidance.
2. **Run BigQuery queries.** A team member reviews and runs the saved SQL in the team's BigQuery project, then shares the result and visible processing estimate. The agent does not invent missing output values.
3. **Check the analysis.** The agent transcribes the supplied results, checks arithmetic and consistency across query outputs, documents data-quality findings and exclusions, and distinguishes observed results from estimates and interpretation.
4. **Review the deliverables.** A team member compares the README and findings with the saved SQL and query results, confirms that assumptions and limitations are clear, and requests any corrections.
5. **Record decisions.** A human reviewer records the date, their name, the evidence checked, the decision, and requested corrections in the relevant category table in `audit_log.md`. The agent does not approve its own work.

## Evidence and handling

- Keep query files and analysis notes in `sql/` and retain screenshots or result exports where they support a reported number.
- Record an estimated bytes-to-process figure as an estimate; do not describe it as actual bytes billed.
- Do not exclude rows until the profile, reason, and effect are documented. Keep null fares in trip counts and disclose that `SUM(fare)` omits them.
- Report `fare` as recorded fare only. Label any calculation that applies an average fare to a trip-count difference as an estimate, not an observed shortfall or causal effect.
- Never place credentials, access tokens, or private keys in the repository or audit evidence.
