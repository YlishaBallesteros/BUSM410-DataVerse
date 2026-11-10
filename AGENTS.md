# Project guidance

This repository supports a BUSM410 team analysis of Chicago taxi trips using the public BigQuery table `bigquery-public-data.chicago_taxi_trips.taxi_trips`.

## Working rules

- Keep analysis reproducible: document the source table, filters, time period, and calculation behind each reported result.
- Do not invent query outputs, statistics, or conclusions. Mark unverified values as pending verification.
- Keep SQL in `sql/`, model and planning notes in `model/`, and visual documentation in `visuals/`.
- In findings, distinguish observed results from interpretation and recommendations.
- Treat audit approval as a human decision. Record reviewer and evidence when an audit is approved.
- Never commit credentials, access tokens, or private key files.
- Preserve existing project content unless a requested change requires editing it.

## Project facts

- Dataset: Chicago Taxi Trips.
- Source table: `bigquery-public-data.chicago_taxi_trips.taxi_trips` in BigQuery.
- Team: Ylisha Ballesteros and Layhok Houn; Canvas team DataVerse.
- Working question: compare recorded trips and recorded fare between calendar years 2019 and 2020. This is a proposed analysis until the query results are checked.
- One source row is treated as one recorded trip; verify duplicate `unique_key` values and timestamp/fare quality before finalizing the population.
- Candidate fields used by the analysis: `unique_key`, `trip_start_timestamp`, and `fare`. Confirm the schema in BigQuery before running queries.
- Benchmark: calendar year 2019. Report observed fare totals as recorded fare, not profit, preventable loss, or causal impact.
- Do not invent result values or cleaning choices. Document profiling evidence and explain exclusions in `sql/README.md`.
- Add audit log entries only for checks the human actually performed. Propose audit protocol additions separately for human approval.
