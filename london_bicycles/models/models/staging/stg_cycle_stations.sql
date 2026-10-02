WITH raw_stations AS (
    SELECT * FROM {{ source('london_bicycles', 'cycle_stations') }}
)
SELECT
    CAST(id AS INT64) AS station_id,
    TRIM(name) AS station_name,
    latitude,
    longitude,
    bikes_count,
    docks_count,
    DATE(install_date) AS install_date
FROM raw_stations