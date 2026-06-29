{{ config(materialized='table', database='DBT_POC_DB', schema='DEV') }}

select
    *,
    current_timestamp() as dbt_loaded_at
from {{ source('raw', 'jobs') }}