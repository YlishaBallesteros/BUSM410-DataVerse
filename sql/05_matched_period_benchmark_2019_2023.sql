-- Compare hourly taxi demand in matched Jan 1-Sep 29 windows for 2019 and 2023. Review 2019 coverage before interpreting.

WITH scoped AS (
  SELECT
    EXTRACT(YEAR FROM DATE(trip_start_timestamp, 'America/Chicago')) AS trip_year,
    EXTRACT(HOUR FROM DATETIME(trip_start_timestamp, 'America/Chicago')) AS start_hour,
    COUNT(*) AS trip_count
  FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
  WHERE (
      DATE(trip_start_timestamp, 'America/Chicago') >= DATE '2019-01-01'
      AND DATE(trip_start_timestamp, 'America/Chicago') < DATE '2019-09-30'
    )
    OR (
      DATE(trip_start_timestamp, 'America/Chicago') >= DATE '2023-01-01'
      AND DATE(trip_start_timestamp, 'America/Chicago') < DATE '2023-09-30'
    )
  GROUP BY trip_year, start_hour
), daily_counts AS (
  SELECT
    trip_year,
    start_hour,
    trip_count,
    272 AS calendar_days
  FROM scoped
)
SELECT
  start_hour,
  MAX(IF(trip_year = 2019, trip_count, NULL)) AS trips_2019_jan_sep,
  MAX(IF(trip_year = 2023, trip_count, NULL)) AS trips_2023_jan_sep,
  SAFE_DIVIDE(MAX(IF(trip_year = 2019, trip_count, NULL)), 272)
    AS average_trips_per_hour_day_2019,
  SAFE_DIVIDE(MAX(IF(trip_year = 2023, trip_count, NULL)), 272)
    AS average_trips_per_hour_day_2023,
  SAFE_DIVIDE(
    MAX(IF(trip_year = 2023, trip_count, NULL))
      - MAX(IF(trip_year = 2019, trip_count, NULL)),
    MAX(IF(trip_year = 2019, trip_count, NULL))
  ) AS relative_change_2023_vs_2019
FROM daily_counts
GROUP BY start_hour
ORDER BY start_hour;
