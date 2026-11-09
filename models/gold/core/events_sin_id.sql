-- =============================================================================
-- events_sin_id
-- =============================================================================
-- Día 4 · Ejercicio 1: todas las columnas de slv_sql_server_dbo__events salvo
-- las de la lista. dbt_utils.star consulta Snowflake para conocer las columnas
-- y las escribe una a una en el SQL compilado.
--   dbt compile --select events_sin_id
-- =============================================================================

{% set columnas_excluidas = ['event_id'] %}

select
    {{ dbt_utils.star(from=ref('slv_sql_server_dbo__events'), except=columnas_excluidas) }}
from {{ ref('slv_sql_server_dbo__events') }}
