{{ config(materialized='table', database='DBT_POC_DB', schema='DEV') }}

select
    *
from {{ source('raw', 'employees') }}