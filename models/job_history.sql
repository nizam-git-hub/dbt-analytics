{{ config(materialized='table') }}

select
    *,
    current_timestamp() as dbt_loaded_at
from {{ source('raw', 'job_history') }}