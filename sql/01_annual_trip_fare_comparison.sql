-- Step 1: Profile annual taxi trip counts and recorded fares. See sql/README.md for notes.

SELECT
  EXTRACT(YEAR FROM DATE(trip_start_timestamp, 'America/Chicago')) AS trip_year,
  COUNT(*) AS recorded_rows,
  COUNT(DISTINCT unique_key) AS distinct_trip_keys,
  COUNTIF(trip_start_timestamp IS NULL) AS null_start_timestamps,
  COUNTIF(fare IS NULL) AS null_fares,
  COUNTIF(fare < 0) AS negative_fares,
  SUM(fare) AS recorded_fare_total
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE trip_start_timestamp IS NULL
   OR DATE(trip_start_timestamp, 'America/Chicago') >= DATE '2019-01-01'
  AND DATE(trip_start_timestamp, 'America/Chicago') < DATE '2021-01-01'
GROUP BY trip_year
ORDER BY trip_year;
