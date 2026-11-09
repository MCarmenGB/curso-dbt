{# =============================================================================
   seconds_to_minutes(column_name, precision=2)
   =============================================================================
   Convierte una columna en segundos a minutos, redondeada a `precision`
   decimales (2 por defecto).
     {{ seconds_to_minutes('s.session_duration_seconds') }}
   compila a:
     round(s.session_duration_seconds / 60, 2)
   ============================================================================= #}
{% macro seconds_to_minutes(column_name, precision=2) -%}
    round({{ column_name }} / 60, {{ precision }})
{%- endmacro %}
