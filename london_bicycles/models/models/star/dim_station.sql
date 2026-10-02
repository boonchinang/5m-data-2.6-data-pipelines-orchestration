SELECT
    station_id,
    station_name,
    latitude,
    longitude,
    bikes_count,
    docks_count,
    install_date
FROM {{ ref('stg_cycle_stations') }}