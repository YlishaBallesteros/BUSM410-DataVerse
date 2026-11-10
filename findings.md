# Findings

*Chicago taxi trips. The 2019-versus-2020 comparison is a working analysis until query results are checked.*

## The gap

**Question:** How did the number of recorded taxi trips and recorded fare revenue change in 2020 compared with 2019?

**One row:** One record in `bigquery-public-data.chicago_taxi_trips.taxi_trips`, treated as one recorded trip. Duplicate-key checks are required before finalizing this definition.

| Measure | 2019 benchmark | 2020 | Difference |
|---|---:|---:|---:|
| Recorded trips | Pending query | Pending query | Pending query |
| Sum of recorded fare (`fare`) | Pending query | Pending query | Pending query |

The difference and percent change will be calculated from the saved query results. No result values have been verified yet.

## The benchmark

2019 is the comparison year because it is the immediately preceding calendar year and provides a full-year baseline. The comparison describes changes in recorded trips and fares; it does not identify their causes.

## Value

The project will report the difference in recorded `fare` totals as the observed fare gap. It is a descriptive amount, not an estimate of lost profit, preventable loss, or causal impact. Calculation: 2020 total recorded fare minus 2019 total recorded fare. Values are pending query results.

## Chart

The comparison chart will be added after the query output is reviewed.

<!-- Add when created: ![Chicago taxi trip and fare comparison](visuals/gap_chart.png) -->

## Limits

- Results describe the records and selected dates in the public table; they do not establish why trips or fares changed.
- Missing and duplicate records, invalid timestamps, and impossible values must be profiled and documented before the final population is chosen.
- The `fare` total is recorded fare, not necessarily driver earnings or industry revenue.
