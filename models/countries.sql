{{ config(materialized='table', database='DBT_POC_DB', schema='DEV') }}

select country_id, country_name, region_ids
from {{ source('raw', 'countries') }}