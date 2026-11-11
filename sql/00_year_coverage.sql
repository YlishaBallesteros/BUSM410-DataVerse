-- Profile the table's UTC-year coverage and timestamp range. See sql/README.md for interpretation.

SELECT
  EXTRACT(YEAR FROM trip_start_timestamp) AS trip_year,
  COUNT(*) AS trip_count,
  MIN(trip_start_timestamp) AS first_trip,
  MAX(trip_start_timestamp) AS last_trip
FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE trip_start_timestamp IS NOT NULL
GROUP BY trip_year
ORDER BY trip_year;
