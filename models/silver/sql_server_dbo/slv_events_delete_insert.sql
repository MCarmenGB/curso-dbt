{{
    config(
        materialized='incremental',
        incremental_strategy='delete+insert',
        unique_key='event_id'
    )
}}

-- Ejercicio 1 (temporal): estrategia delete+insert. Borra por clave y reinserta.

with events as (
    select * from {{ ref('stg_sql_server_dbo__events') }}
    where not is_deleted
    {% if is_incremental() %}
      and date_load >= (select dateadd('hour', -1, max(date_load)) from {{ this }})
    {% endif %}
),

deduplicated as (
    select
          event_id
        , session_id
        , user_id
        , page_url
        , event_type
        , order_id
        , product_id
        , created_at_utc
        , date_load
    from events
    qualify row_number() over (partition by event_id order by date_load desc) = 1
)

select * from deduplicated