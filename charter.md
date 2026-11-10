# Project Charter

## The question

How did the number of recorded Chicago taxi trips and recorded fare revenue change from 2019 to 2020?

## The decision this supports

This analysis can help Chicago transportation stakeholders and taxi industry decision makers understand how trip activity changed during 2020 and where further investigation may be useful. The data alone cannot establish why the change occurred or what action should be taken.

## Scope

The project uses the public BigQuery table `bigquery-public-data.chicago_taxi_trips.taxi_trips`. The proposed comparison is calendar year 2020 against calendar year 2019. One row represents one recorded taxi trip. The query will document the date, duplicate, fare, and timestamp checks before finalizing the gap and dollar estimate.

## What success looks like

- The 2019 and 2020 comparison is reproducible from saved SQL.
- The analysis defines the trip population and reports cleaning checks.
- Findings report the measured difference, benchmark, and fare calculation with caveats.
- One chart compares both years and is linked from `findings.md`.
- Data sources and project decisions are documented, with human checks recorded in the audit log.

The comparison and decision framing are a working proposal until the query is run and the results are reviewed.
