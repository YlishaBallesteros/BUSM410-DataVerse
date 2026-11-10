# Dataset documentation

The analysis source is the BigQuery public table `bigquery-public-data.chicago_taxi_trips.taxi_trips`.

- BigQuery table: [`bigquery-public-data.chicago_taxi_trips.taxi_trips`](https://console.cloud.google.com/bigquery?project=enduring-smile-509700-n5&ws=!1m5!1m4!4m3!1sbigquery-public-data!2schicago_taxi_trips!3staxi_trips)
- City of Chicago source and field documentation: [Taxi Trips data portal](https://data.cityofchicago.org/Transportation/Taxi-Trips/wrvz-psew)
- Project table diagram source: [taxi_trips.dbml](taxi_trips.dbml)

The City portal documents the trip identifier, start/end timestamps, distance, fare, tips, tolls, extras, total, payment type, and company fields. Confirm that the BigQuery schema matches the fields used by each saved query. No data extract is stored in this repository.
