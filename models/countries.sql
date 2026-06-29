{{ config(materialized='table') }}

select
    country_id,
    country_name,
    region_id,
    current_timestamp() as dbt_loaded_at
from {{ source('raw', 'countries') }}