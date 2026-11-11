# Audit Log

Summary: The project team supplied screenshots and query results from BigQuery for the year-coverage query, 2023 data profile, trip demand, and recorded fare summaries. The visible quality evidence does not show the negative-value or timestamp-order columns. No named reviewer or explicit final project approval is recorded. The protocol in `../audit_protocol.md` remains proposed and awaits project-owner approval.

| Category | Entries |
|---|---|
| Caught an error | None recorded |
| Verified a claim | Query outputs supplied for year coverage, 2023 profile, demand, fares, and the matched 2019–2023 benchmark; details and limits below. |
| Separated fact from interpretation | Findings describe observed trip counts and recorded fare, not profit or causal impact. |
| Changed the analysis | None evidenced in the supplied BigQuery outputs. |
| Improved agent instructions | Project facts in `../AGENTS.md`; proposed audit protocol in `../audit_protocol.md` pending approval. |

## Caught an error

No entries yet.

## Verified a claim

| Date | Human reviewer | Claim or check | Evidence and outcome |
|---|---|---|---|
| Date not captured | Project team member (name not captured) | Year coverage and 2023 Chicago-local trip profile | BigQuery screenshots shared in the project conversation. The year summary shows 2023, partial 2019 and 2022, and no 2020 or 2021 rows. The quality result shows 6,427,460 scoped rows, 6,427,460 distinct keys, zero duplicate keys, zero null keys, zero null start timestamps, 11,991 null fares, zero negative fares/durations/distances, and 85 end-before-start rows. These 85 rows remain included, with the decision documented in `../sql/README.md`. |
| Date not captured | Project team member (name not captured) | Trip demand by hour, weekday, and weekday-hour | BigQuery screenshots and pasted results shared in the project conversation; the results are transcribed in `../sql/README.md`. |
| Date not captured | Project team member (name not captured) | Recorded fare totals by hour, weekday, and weekday-hour | BigQuery screenshots and pasted results shared in the project conversation; the results are transcribed in `../sql/README.md`. A later screenshot displays an estimated 3.17 GB to process for query 04. This is not actual bytes billed. Fare means the source `fare` field only. |
| Date not captured | Project team member (name not captured) | Matched-period hourly demand benchmark, 2019 vs 2023 | BigQuery result screenshots shared in the project conversation show 24 hourly buckets for Jan 1–Sep 29, 272 days per year. Totals transcribed in `../sql/README.md`: 16,386,009 in 2019 and 4,839,408 in 2023. |

## Separated fact from interpretation

| Date | Human reviewer | Check | Evidence and outcome |
|---|---|---|---|
| Date not captured | Project team member (name not captured) | Keep measured results distinct from interpretation | The shared query outputs are used as observed results. Project documents state that recorded fares are not profit or net revenue and that patterns do not show causal staffing impact. No explicit final approval was provided. |
| Date not captured | Project team member (name not captured) | Interpret matched-period difference | The 70.5% decline is reported as an observed difference between two matched windows, with no claim about its cause. |

## Changed the analysis

No analysis change is evidenced in the supplied query outputs.

## Improved agent instructions

| Date | Change | Evidence |
|---|---|---|
| Date not captured | Project-specific facts and a proposed review protocol are documented. Protocol approval remains pending. | `../AGENTS.md` and `../audit_protocol.md`. |
