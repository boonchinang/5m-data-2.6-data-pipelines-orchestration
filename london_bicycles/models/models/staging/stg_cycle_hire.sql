WITH raw_hire AS (
    SELECT * FROM {{ source('london_bicycles', 'cycle_hire') }}
),
valid_stations AS (
    SELECT station_id FROM {{ ref('stg_cycle_stations') }}
)
SELECT
    CAST(rental_id AS INT64) AS rental_id,
    CAST(bike_id AS INT64) AS bike_id,
    CAST(start_station_id AS INT64) AS start_station_id,
    CAST(end_station_id AS INT64) AS end_station_id,
    TIMESTAMP(start_date) AS start_date,
    TIMESTAMP(end_date) AS end_date,
    CAST(duration AS INT64) AS duration_seconds,
    ROUND(duration / 60.0, 2) AS duration_minutes
FROM raw_hire
WHERE rental_id IS NOT NULL 
  AND duration > 0
  AND start_station_id IN (SELECT station_id FROM valid_stations)
  AND end_station_id IN (SELECT station_id FROM valid_stations)