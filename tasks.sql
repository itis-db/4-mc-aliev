select
    date,
    amount,
    sum(amount) over (
    order by date
    rows between unbounded preceding and current row
    ) as cumulative_amount
from transactions;

select
    id,
    category,
    price,
    price - avg(price) over (
    partition by category
  ) as price_diff
from products;

select
    log_time,
    temperature,
    avg(temperature) over (
    order by log_time
    rows between 2 preceding and current row
  ) as moving_avg
from temperature_logs;

select
    task_id,
    project_id,
    start_date,
    first_value(start_date) over (
    partition by project_id
    order by start_date
  ) as first_task_date,
    last_value(start_date) over (
    partition by project_id
    order by start_date
    rows between unbounded preceding and unbounded following
  ) as last_task_date
from project_tasks;

