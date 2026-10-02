WITH hire AS (
    SELECT * FROM {{ ref('stg_cycle_hire') }}
)
SELECT
    h.rental_id,
    h.bike_id,
    h.start_station_id,
    h.end_station_id,
    CAST(FORMAT_DATE('%Y%m%d', DATE(h.start_date)) AS INT64) AS start_date_id,
    CAST(FORMAT_DATE('%Y%m%d', DATE(h.end_date)) AS INT64) AS end_date_id,
    h.start_date,
    h.end_date,
    EXTRACT(HOUR FROM h.start_date) AS start_hour,
    h.duration_seconds,
    h.duration_minutes,
    IF(h.start_station_id = h.end_station_id, TRUE, FALSE) AS is_round_trip
FROM hire h