select
    user_id,
    email,
    updated_at,
    dbt_valid_from,
    dbt_valid_to
from {{ ref('users_snapshot') }}
where user_id = '423063a5-891b-4ae9-87ef-b1cc447895da'