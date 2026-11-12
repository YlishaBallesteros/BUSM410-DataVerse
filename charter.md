# Project Charter

## The question

How much lower were Chicago taxi trips in the matched January 1–September 29 period of 2023 than in 2019, and what is the estimated recorded-fare equivalent of that difference?

## The decision this supports

Managers can use the comparison to understand the scale of the lower recorded trip volume when planning capacity. The fare equivalent is an estimate based on the 2023 average fare per fare-bearing trip; it is not a forecast, realized loss, or proof that a staffing change would recover that amount.

## Scope

The analysis uses `bigquery-public-data.chicago_taxi_trips.taxi_trips` and groups timestamps in `America/Chicago`. It compares the same 272 local dates, January 1 through September 29, in 2019 and 2023. One source row is one recorded taxi trip. The dollar estimate applies the 2023 full-year recorded-fare average ($142,690,533.04 / 6,415,469 fare-bearing trips) to the matched-period trip-count difference. `fare` excludes tips, tolls, extras, and trip total. The table's 85 end-before-start records remain included; the analysis does not calculate trip duration.

## What success looks like

- Saved SQL reproduces the matched-period trip totals and the 2023 fare average used in the estimate.
- Findings identify the row unit, 2019 benchmark, 2023 comparison window, difference, dollar-equivalent math, and source queries.
- One chart communicates this single gap and the fare-equivalent estimate.
- Limitations state that the fare equivalent is estimated and does not establish causality or profit.
- Dataset documentation, table diagram, and human audit records are present.
