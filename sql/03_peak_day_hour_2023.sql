-- Step 3: Compare weekday and weekday-hour trip demand in 2023. See sql/README.md for notes.

WITH daily_calendar AS (
  SELECT
    EXTRACT(DAYOFWEEK FROM calendar_date) AS weekday_number,
    COUNT(*) AS calendar_occurrences
  FROM UNNEST(GENERATE_DATE_ARRAY(DATE '2023-01-01', DATE '2023-12-31')) AS calendar_date
  GROUP BY weekday_number
), grouped_trips AS (
  SELECT
    EXTRACT(DAYOFWEEK FROM DATE(trip_start_timestamp, 'America/Chicago')) AS weekday_number,
    FORMAT_DATE('%A', DATE(trip_start_timestamp, 'America/Chicago')) AS weekday,
    EXTRACT(HOUR FROM DATETIME(trip_start_timestamp, 'America/Chicago')) AS start_hour,
    COUNT(*) AS trip_count
  FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
  WHERE DATE(trip_start_timestamp, 'America/Chicago') >= DATE '2023-01-01'
    AND DATE(trip_start_timestamp, 'America/Chicago') < DATE '2024-01-01'
  GROUP BY weekday_number, weekday, start_hour
), weekday_trips AS (
  SELECT
    EXTRACT(DAYOFWEEK FROM DATE(trip_start_timestamp, 'America/Chicago')) AS weekday_number,
    FORMAT_DATE('%A', DATE(trip_start_timestamp, 'America/Chicago')) AS weekday,
    COUNT(*) AS trip_count
  FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
  WHERE DATE(trip_start_timestamp, 'America/Chicago') >= DATE '2023-01-01'
    AND DATE(trip_start_timestamp, 'America/Chicago') < DATE '2024-01-01'
  GROUP BY weekday_number, weekday
), summary AS (
  SELECT 'weekday_hour' AS grouping_level,
         weekday_number, weekday, start_hour, trip_count
  FROM grouped_trips
  UNION ALL
  SELECT 'weekday' AS grouping_level,
         weekday_number, weekday, CAST(NULL AS INT64) AS start_hour, trip_count
  FROM weekday_trips
)
SELECT
  summary.*,
  daily_calendar.calendar_occurrences,
  SAFE_DIVIDE(summary.trip_count, daily_calendar.calendar_occurrences)
    AS average_trips_per_calendar_occurrence
FROM summary
JOIN daily_calendar USING (weekday_number)
ORDER BY grouping_level, weekday_number, start_hour;


