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
- Working question: compare taxi trip counts in matched Jan 1–Sep 29 windows in 2019 and 2023, then estimate the recorded-fare equivalent of that trip-count difference using the 2023 average fare per fare-bearing trip.
- One source row is treated as one recorded trip; verify duplicate `unique_key` values and timestamp/fare quality before finalizing the population.
- Candidate fields: `unique_key`, `trip_start_timestamp`, and `fare`. Confirm the schema in BigQuery before running queries.
- Scope: compare Jan 1–Sep 29 in 2019 and 2023, grouped in Chicago local time, for the trip-count gap. The estimated fare equivalent uses the 2023 full-year average recorded fare per fare-bearing trip. The year summary shows source timestamps from Jan 1 through Dec 31, 2023, no records for 2020 or 2021, and partial coverage in 2019 and 2022. Confirm local-date boundary coverage before finalizing results. Report `fare` as recorded fare, not net revenue, driver income, or causal impact.
- Do not invent result values or cleaning choices. Document profiling evidence and explain exclusions in `sql/README.md`.
- Add audit log entries only for checks the human actually performed. Propose audit protocol additions separately for human approval.
