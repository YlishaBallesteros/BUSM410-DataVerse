# Project Charter

## The question

During 2023, which hours and days had the most Chicago taxi trips, and when was recorded taxi fare highest?

## The decision this supports

Taxi company managers can use the results to schedule driver availability around demand and understand when recorded fares are highest. The data describes historical patterns; it does not prove that changing staffing will cause revenue or service improvements.

## Scope

The project uses `bigquery-public-data.chicago_taxi_trips.taxi_trips`. It analyzes trips whose start date falls in calendar year 2023, using Chicago local time. The year-coverage query shows source timestamps from January 1 through December 31, 2023; confirm the local-date boundary coverage before finalizing the population. 2020 and 2021 are absent, and the nearby years 2019 and 2022 are partial. One source row is one recorded trip, subject to duplicate-key and data-quality checks. Fare revenue means the sum of the `fare` field; tips, tolls, extras, and trip total are not included in that measure.

The analysis answers three questions:

1. Which hours of the day have the most recorded trips?
2. Which weekdays and weekday-hour combinations have the most trips?
3. Which weekdays and hours have the highest recorded fare totals?

## What success looks like

- Each question is answered by saved, reproducible SQL.
- Query notes document the date scope, missing values, duplicates, impossible values, and any exclusions.
- Findings show the busiest categories, comparisons to appropriate averages, and recorded fare totals without claiming causal effects.
- At least one chart compares the peak with its benchmark and is linked from `findings.md`.
- Dataset documentation, table diagram, and human audit records are included in the repository.
