-- Step 4: Compare recorded fares by weekday, hour, and weekday-hour. See sql/README.md for notes.

WITH trips AS (
  SELECT
    DATE(trip_start_timestamp, 'America/Chicago') AS local_date,
    EXTRACT(DAYOFWEEK FROM DATE(trip_start_timestamp, 'America/Chicago')) AS weekday_number,
    FORMAT_DATE('%A', DATE(trip_start_timestamp, 'America/Chicago')) AS weekday,
    EXTRACT(HOUR FROM DATETIME(trip_start_timestamp, 'America/Chicago')) AS start_hour,
    fare
  FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
  WHERE DATE(trip_start_timestamp, 'America/Chicago') >= DATE '2023-01-01'
    AND DATE(trip_start_timestamp, 'America/Chicago') < DATE '2024-01-01'
), calendar_days AS (
  SELECT calendar_date, EXTRACT(DAYOFWEEK FROM calendar_date) AS weekday_number
  FROM UNNEST(GENERATE_DATE_ARRAY(DATE '2023-01-01', DATE '2023-12-31')) AS calendar_date
), weekday_counts AS (
  SELECT weekday_number, COUNT(*) AS calendar_occurrences
  FROM calendar_days
  GROUP BY weekday_number
), weekday_hour_fares AS (
  SELECT weekday_number, weekday, start_hour,
         COUNT(*) AS trip_count, SUM(fare) AS recorded_fare_total
  FROM trips
  GROUP BY weekday_number, weekday, start_hour
), weekday_fares AS (
  SELECT weekday_number, weekday,
         COUNT(*) AS trip_count, SUM(fare) AS recorded_fare_total
  FROM trips
  GROUP BY weekday_number, weekday
), hour_fares AS (
  SELECT start_hour,
         COUNT(*) AS trip_count, SUM(fare) AS recorded_fare_total
  FROM trips
  GROUP BY start_hour
)
SELECT
  'weekday_hour' AS grouping_level,
  f.weekday_number,
  f.weekday,
  f.start_hour,
  f.trip_count,
  f.recorded_fare_total,
  c.calendar_occurrences,
  SAFE_DIVIDE(f.recorded_fare_total, c.calendar_occurrences) AS average_fare_per_calendar_occurrence
FROM weekday_hour_fares f
JOIN weekday_counts c USING (weekday_number)

UNION ALL

SELECT
  'weekday' AS grouping_level,
  f.weekday_number,
  f.weekday,
  CAST(NULL AS INT64) AS start_hour,
  f.trip_count,
  f.recorded_fare_total,
  c.calendar_occurrences,
  SAFE_DIVIDE(f.recorded_fare_total, c.calendar_occurrences) AS average_fare_per_calendar_occurrence
FROM weekday_fares f
JOIN weekday_counts c USING (weekday_number)

UNION ALL

SELECT
  'hour' AS grouping_level,
  CAST(NULL AS INT64) AS weekday_number,
  CAST(NULL AS STRING) AS weekday,
  f.start_hour,
  f.trip_count,
  f.recorded_fare_total,
  (SELECT COUNT(*) FROM calendar_days) AS calendar_occurrences,
  SAFE_DIVIDE(f.recorded_fare_total, (SELECT COUNT(*) FROM calendar_days)) AS average_fare_per_calendar_occurrence
FROM hour_fares f
ORDER BY grouping_level, weekday_number, start_hour;


