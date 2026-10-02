WITH date_spine AS (
  SELECT d
  FROM UNNEST(GENERATE_DATE_ARRAY('2015-01-01', '2025-12-31', INTERVAL 1 DAY)) AS d
)
SELECT
    CAST(FORMAT_DATE('%Y%m%d', d) AS INT64) AS date_id,
    d AS full_date,
    EXTRACT(DAY FROM d) AS day_of_month,
    FORMAT_DATE('%A', d) AS day_of_week_name,
    EXTRACT(DAYOFWEEK FROM d) AS day_of_week,
    IF(EXTRACT(DAYOFWEEK FROM d) IN (1, 7), TRUE, FALSE) AS is_weekend,
    EXTRACT(MONTH FROM d) AS month,
    FORMAT_DATE('%B', d) AS month_name,
    EXTRACT(QUARTER FROM d) AS quarter,
    EXTRACT(YEAR FROM d) AS year
FROM date_spine