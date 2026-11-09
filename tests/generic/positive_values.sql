{# =============================================================================
   Test genérico: positive_values
   =============================================================================
   Falla si la columna tiene algún valor menor o igual que 0.
   Devuelve las filas que incumplen la regla: cero filas = PASS.
   ============================================================================= #}
{% test positive_values(model, column_name) %}

select {{ column_name }}
from {{ model }}
where {{ column_name }} <= 0

{% endtest %}
