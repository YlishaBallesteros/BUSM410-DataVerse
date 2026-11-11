# Findings

*Chicago taxi trips in 2023. Values are transcribed from the team's supplied BigQuery outputs; final project-owner review is pending.*

## The gap

The project measures when trip demand peaks compared with the average hour and average weekday-hour. One row represents one recorded taxi trip. The 2023 Chicago-local-date profile found 6,427,460 rows; all had distinct non-null `unique_key` values. It found 11,991 missing fares, which remain in trip counts but are not included by `SUM(fare)`. Quality checks found no negative fares, durations, or distances, and 85 rows whose end timestamp precedes the start. No rows were excluded; the 85 cases are retained because the analysis groups by valid start time and does not use trip duration. The hourly and weekday-hour counts reconcile to the profiled trip count. Final local-date boundary review remains pending. The year-coverage query shows source timestamps spanning January 1 through December 31, 2023; 2020 and 2021 have no records in the table, and 2019 and 2022 are partial. See [sql/README.md](sql/README.md) for the profile details.

| Measure | Peak category | Value | Comparison |
|---|---|---:|---:|
| Matched-period demand | Jan 1–Sep 29 total trips | 2019: 16,386,009; 2023: 4,839,408 | 2023 is 11,546,601 lower (−70.5%); same 272 local dates per period |
| Matched-period hourly demand | Noon–12:59 p.m. | 2019: 4,351.50 trips per hour-day; 2023: 1,249.58 | 2023 is 3,101.92 lower (−71.3%) |
| Trips by hour | 11:00–11:59 a.m. | 451,453 trips | 183,642 above the 24-hour mean of 267,811 (+68.6%) |
| Trips by weekday | Thursday | 20,669 trips per Thursday on average | 3,060 above the 2023 daily mean of 17,609 (+17.4%) |
| Trips by weekday and hour | Thursday, 11 a.m.–noon | 75,711 trips (1,455.98 per Thursday) | 594.77 above Thursday’s average hour of 861.22 (+69.1%) |
| Recorded fares by hour | 10:00–10:59 a.m. | $9,742,359.75 | $3,796,920.87 above the 24-hour mean of $5,945,438.88 (+63.9%) |
| Recorded fares by weekday | Thursday | $449,821.24 per Thursday on average | $58,888.27 above the 2023 daily mean of $390,932.97 (+15.1%) |
| Recorded fares by weekday and hour | Thursday, 10:00–10:59 a.m. | $31,059.68 per occurrence | $12,317.13 above Thursday’s average hour of $18,742.55 (+65.7%) |

## The benchmark

The prior-period benchmark is the matched Jan 1–Sep 29 period in 2019. This is the longest same-date window supported by the table's partial 2019 coverage, and excludes Sep 30 because the latest 2019 timestamp shown in the year profile is Oct 1 at 00:00 UTC, which is the prior evening in Chicago. Across these 272 dates, the table records 16,386,009 trips in 2019 and 4,839,408 in 2023. The gap is 4,839,408 − 16,386,009 = −11,546,601 (−70.5%). Dividing by the 272 dates gives 60,242.68 versus 17,791.94 trips per day. This same-period comparison controls for window length; it shows the scale and direction of the recorded change, but does not explain its cause.

For the hourly comparison, query 05 counts each hour over those same dates. Noon (hour 12) has the largest 2023 matched-period count, 339,887 / 272 = 1,249.58 trips per hour-day. The prior-period benchmark for that hour is 1,183,608 / 272 = 4,351.50. The difference is 1,249.58 − 4,351.50 = −3,101.92 (−71.3%). The chart visualizes all 24 hours against the 2019 benchmark.

The within-2023 averages provide additional operating context: the average across 24 hourly buckets is useful because it compares each hour with a typical hour in the same day. Query 02 gives 6,427,460 / 24 = 267,810.83 trips per hour bucket on average. Hour 11 has 451,453 trips, 183,642.17 (68.6%) above that mean. The weekday totals in [query 03](sql/03_peak_day_hour_2023.sql) sum to 6,427,460 trips. Thursday has 1,074,797 trips over 52 Thursdays, or 20,669.17 per Thursday; compared with 6,427,460 / 365 = 17,609.48 trips per calendar day, that is 3,059.69 (17.4%) above the mean. The busiest weekday-hour is Thursday at 11 a.m.: 75,711 trips over 52 Thursdays, or 1,455.98 per occurrence. Thursday's average hour is 20,669.17 / 24 = 861.22 trips; the peak is 594.77 (69.1%) above that benchmark. For fares, [query 04](sql/04_fare_by_day_hour_2023.sql) shows $142,690,533.04 across the 24 hourly groups. Hour 10 totals $9,742,359.75, $3,796,920.87 (63.9%) above the mean hourly total of $5,945,438.88. Thursday averages $449,821.24 in recorded fares per occurrence, $58,888.27 (15.1%) above the daily mean of $390,932.97. Thursday at 10 a.m. is highest for weekday-hour fares at $1,615,103.30 over 52 occurrences, or $31,059.68 per occurrence, $12,317.13 (65.7%) above Thursday's average hour of $18,742.55. These 2023 means are internal baselines for operational context, not external staffing standards.

## Value

Fare value is measured as the sum of `fare` in the BigQuery source table, which represents recorded fare charges only. It excludes tips, tolls, and extras, and does not measure profit or net income. In the 2023 results, the 10 a.m. hour is $9,742,359.75 − ($142,690,533.04 / 24) = $3,796,920.87 above the average hourly total. Thursday at 10 a.m. averages $31,059.68 per occurrence, which is $12,317.13 above Thursday's average hour. These calculations quantify recorded fare concentration; they do not estimate savings or staffing impact.

## Chart

The chart compares average hourly trip counts per calendar day in matched 2019 and 2023 date windows. It shows the scale of the lower 2023 recorded demand across all hours and the noon peak within the 2023 matched window.

![Chicago taxi trip demand by hour, comparing matched 2019 and 2023 periods](visuals/gap_chart.svg)

## Limits

- The analysis describes trips recorded in the public table during 2023; it does not establish why demand or fares vary.
- Counts and fare sums can be affected by missing, duplicated, or invalid records. Apply only documented cleaning rules after profiling.
- The source profile found 85 trips with an end timestamp earlier than the start timestamp; they remain included in this start-time analysis and should be considered when interpreting trip validity.
- `fare` is not net company revenue or driver income.
- Hour-of-day calculations use Chicago local time; verify timestamp handling in the query environment.
