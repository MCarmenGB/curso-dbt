{{ config(
materialized='incremental',
incremental_strategy='merge',
) }}
with events as (
    select * from {{ ref('stg_sql_server_dbo__events') }}
    where not is_deleted
    {% if is_incremental() %}
      and date_load > (select dateadd('hour', -1, max(date_load)) from {{ this }})
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