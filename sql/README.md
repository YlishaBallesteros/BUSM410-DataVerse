# SQL analysis

Source: `bigquery-public-data.chicago_taxi_trips.taxi_trips` (US public BigQuery dataset). Run the numbered queries in order in BigQuery. Before running, confirm the field names in the table schema and review BigQuery's estimated bytes processed. The queries have not yet been run from this repository, so results and scan estimates remain pending.

## Step 1: Profile 2019 and 2020 trips

Query: [01_annual_trip_fare_comparison.sql](01_annual_trip_fare_comparison.sql)

Purpose: compare full calendar years by trip start timestamp and summarize row counts, distinct trip keys, null timestamps, null fares, negative fares, and recorded fare totals. This is a profiling query; do not exclude rows until the checks are reviewed.

Cleaning decisions: pending query results and review. Check duplicate `unique_key` values, missing or out-of-period timestamps, impossible fares, and coverage near year boundaries. Any final filters must be explained here and reflected in `findings.md`.

## Calculation plan

- Trip-count gap = 2020 recorded trip count minus 2019 recorded trip count.
- Trip-count percent change = gap divided by the 2019 trip count.
- Recorded-fare gap = 2020 sum of `fare` minus 2019 sum of `fare`.
- Report the exact query population and any excluded rows. Recorded fare is not profit or a causal estimate.

Estimated scan, result values, and chart calculations: pending BigQuery execution and human review.
