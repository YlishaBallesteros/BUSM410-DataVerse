-- Step 2: Count trips by Chicago local hour in 2023. See sql/README.md for notes.

SELECT
  EXTRACT(HOUR FROM DATETIME(trip_start_timestamp, 'America/Chicago')) AS start_hour,
  COUNT(*) AS trip_count
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE DATE(trip_start_timestamp, 'America/Chicago') >= DATE '2023-01-01'
  AND DATE(trip_start_timestamp, 'America/Chicago') < DATE '2024-01-01'
GROUP BY start_hour
ORDER BY start_hour;


