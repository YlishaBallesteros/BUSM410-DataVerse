# SQL analysis

Source: `bigquery-public-data.chicago_taxi_trips.taxi_trips`. Main analysis scope is trips starting in calendar year 2023, using `America/Chicago` local time. The project team supplied results for the year-coverage query and queries 01–05; summaries below are transcribed from that evidence. Confirm field names and types and review the estimated bytes processed before rerunning any query; only the query 04 estimate is recorded here.

## Query sequence

0. [00_year_coverage.sql](00_year_coverage.sql) summarizes record counts and timestamp ranges by UTC year. The supplied output reports no rows for 2020 or 2021 and partial coverage in 2019 and 2022; 2023 spans Jan 1–Dec 31 UTC.
1. [01_data_quality_2023.sql](01_data_quality_2023.sql) profiles timestamp, key, and fare quality for 2023. Review duplicate keys and invalid values before choosing exclusions.
2. [02_demand_by_hour_2023.sql](02_demand_by_hour_2023.sql) counts trips by hour.
3. [03_peak_day_hour_2023.sql](03_peak_day_hour_2023.sql) counts trips by weekday and hour to identify scheduling peaks.
4. [04_fare_by_day_hour_2023.sql](04_fare_by_day_hour_2023.sql) summarizes recorded fare by weekday and hour. The latest BigQuery screenshot displays an estimated 3.17 GB to process; this is an estimate, not a recorded actual-bytes-billed figure.
5. [05_matched_period_benchmark_2019_2023.sql](05_matched_period_benchmark_2019_2023.sql) compares trip counts by hour across matched January 1–September 29 periods. September 30 is excluded because the year summary shows the 2019 last timestamp at October 1 00:00 UTC (September 30 evening in Chicago), so that local day may be incomplete. Matching the date window avoids comparing a full 2023 year against a shorter 2019 period.

## Cleaning and calculation notes

Use one row per recorded trip unless duplicate-key profiling shows a need to deduplicate. Confirm null timestamps, duplicate `unique_key`, negative fare, negative duration or distance, and trips with end timestamps before start timestamps. Do not remove records until the effect is quantified and the rule is written here. The 2023 filters use the local trip start date; trips with a null start timestamp cannot be assigned to a day or hour and should be reported separately.

`fare` is the recorded fare charge. It excludes tips, tolls, and extras and should not be described as net revenue or profit. For demand comparisons, compare hourly and weekday-hour counts to the corresponding period average. The day/hour queries divide by the calendar occurrences in 2023, so zero-trip days remain in the denominator. Do not compare raw weekday totals as if every weekday occurred the same number of times.

## Step 1 result supplied from BigQuery

The 2023 Chicago-local-date profile returned 6,427,460 rows and 6,427,460 distinct `unique_key` values, with 0 duplicate key values, 0 null keys, and 0 null start timestamps. It reported 11,991 null `fare` values, leaving 6,415,469 rows with fare values (99.8134% coverage: (6,427,460 − 11,991) / 6,427,460). Keep all rows in trip counts; BigQuery `SUM(fare)` ignores null fare values, so do not treat missing fares as zero charges. The full quality result reports 0 negative fares, 0 negative durations, 0 negative distances, and 85 rows where the end timestamp precedes the start. No rows were excluded: these analyses group by valid start timestamps, do not calculate trip duration, and report the fare as recorded; the 85 timestamp-order cases remain a documented limitation.

The separate year-coverage query grouped using the timestamp's UTC year and counted 6,430,021 rows in 2023. The local-year profile uses `America/Chicago` dates and therefore has a different boundary count. Use the local-year population consistently for the analysis, and describe this timezone choice in findings.

## Step 2 result supplied from BigQuery

Query 02 returned 24 hourly groups. Their counts sum to 6,427,460, matching the local-year profile. The mean is 6,427,460 / 24 = 267,810.83 trips per hour bucket. The maximum is hour 11 with 451,453 trips; the minimum is hour 22 with 33,659 trips. The peak is 183,642.17 trips (68.6%) above the hourly mean. Quality checks are summarized in Step 1.

## Step 3 result supplied from BigQuery

The weekday totals are Sunday 676,124; Monday 907,708; Tuesday 990,209; Wednesday 1,036,938; Thursday 1,074,797; Friday 993,026; and Saturday 748,658. They sum to 6,427,460. There are 52 Thursdays in 2023, so Thursday averaged 1,074,797 / 52 = 20,669.17 trips per Thursday. The all-day average is 6,427,460 / 365 = 17,609.48, making Thursday 3,059.69 (17.4%) above the daily mean. The full weekday-hour table identifies Thursday at 11 a.m. as the peak, with 75,711 trips or 1,455.98 per Thursday. The average Thursday hour is 20,669.17 / 24 = 861.22, so the peak is 594.77 (69.1%) above that benchmark.

## Step 4 result supplied from BigQuery

The hourly fare groups sum to $142,690,533.04. Hour 10 has the highest recorded fare total at $9,742,359.75, compared with a 24-hour average of $5,945,438.88; the difference is $3,796,920.87 (63.9%). The weekday summary shows Thursday averaging $449,821.24 per Thursday, compared with an overall calendar-day mean of $390,932.97; the difference is $58,888.27 (15.1%). The full pasted result shows Thursday at 10 a.m. as the weekday-hour fare peak: $1,615,103.30 across 52 occurrences, or $31,059.68 per occurrence. Thursday's average hour is $449,821.24 / 24 = $18,742.55, so this peak is $12,317.13 (65.7%) above the benchmark. These amounts use the `fare` field only.

## Step 5 result supplied from BigQuery

The matched Jan 1–Sep 29 windows contain 272 calendar dates each. Query 05 returned 16,386,009 trips in 2019 and 4,839,408 in 2023, a difference of 4,839,408 − 16,386,009 = −11,546,601 trips (−70.5%). The period averages are 16,386,009 / 272 = 60,242.68 and 4,839,408 / 272 = 17,791.94 trips per calendar day, respectively. At hour 12 (noon–12:59 p.m.), 2019 recorded 1,183,608 trips (4,351.50 per day) and 2023 recorded 339,887 (1,249.58 per day), a decline of 3,101.92 per hour-day (71.3%). Every hourly bucket is lower in the 2023 matched window. The 2019 comparison is a prior-period benchmark, not evidence that any specific cause produced the decline.

Exclusion decision: no rows are filtered beyond the local start-date scope. Null fares are naturally omitted from `SUM(fare)` but the trips remain in trip counts. The 85 end-before-start records remain included as described above. Scan estimates for the other queries and final human review remain pending.

