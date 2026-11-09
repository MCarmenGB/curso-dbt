-- =============================================================================
-- Test singular: todo pedido tiene al menos una línea de pedido.
-- =============================================================================
-- Devuelve los pedidos de fct_orders que no aparecen en fct_order_items.
-- Cero filas: PASS.
-- =============================================================================

select
      o.order_id
from {{ ref('fct_orders') }} o
left join {{ ref('fct_order_items') }} oi
    on o.order_id = oi.order_id
where oi.order_id is null
