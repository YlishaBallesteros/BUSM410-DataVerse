-- Step 1: Profile trip keys, timestamps, fares, and trip values for 2023. See sql/README.md for notes.

WITH scoped AS (
  SELECT
    unique_key,
    trip_start_timestamp,
    trip_end_timestamp,
    trip_seconds,
    trip_miles,
    fare
  FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
  WHERE DATE(trip_start_timestamp, 'America/Chicago') >= DATE '2023-01-01'
    AND DATE(trip_start_timestamp, 'America/Chicago') < DATE '2024-01-01'
), duplicate_keys AS (
  SELECT unique_key
  FROM scoped
  WHERE unique_key IS NOT NULL
  GROUP BY unique_key
  HAVING COUNT(*) > 1
)
SELECT
  COUNT(*) AS scoped_rows,
  (SELECT COUNT(*)
   FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
   WHERE trip_start_timestamp IS NULL) AS null_start_timestamps,
  COUNT(DISTINCT unique_key) AS distinct_trip_keys,
  (SELECT COUNT(*) FROM duplicate_keys) AS duplicated_key_count,
  COUNTIF(unique_key IS NULL) AS null_trip_keys,
  COUNTIF(fare IS NULL) AS null_fares,
  COUNTIF(fare < 0) AS negative_fares,
  COUNTIF(trip_seconds < 0) AS negative_durations,
  COUNTIF(trip_miles < 0) AS negative_distances,
  COUNTIF(trip_end_timestamp < trip_start_timestamp) AS end_before_start
FROM scoped;


