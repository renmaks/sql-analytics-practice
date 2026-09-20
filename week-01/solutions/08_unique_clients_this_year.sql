-- Задача 8:
-- Уникальные посетители сайта за текущий год.
-- Подсчитать количество уникальных клиентов,
-- которые хотя бы один раз посетили сайт в течение текущего календарного года.

select
    count(distinct sv.site_client_id) as unique_clients_this_year
from postypashki_exercises.site_visits sv
where 1=1
  and sv.visited_at >= date_trunc('year', current_date)
  and sv.visited_at <  date_trunc('year', current_date) + interval '1 year'
;