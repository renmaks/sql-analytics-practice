-- Задача 2:
-- Участники с ростом выше среднего.
-- Рассчитать средний рост участников и вывести тех, чей рост превышает среднее значение.
-- Дополнительно определить величину этого превышения.

with average_height as (
    select
        avg(pep.height) as avg_height
    from postypashki_exercises.parameters pep
)
select
    pep.id,
    pep.height,
    pep.weight,
    round((pep.height - ah.avg_height)::numeric, 2) as delta_height
from postypashki_exercises.parameters pep
cross join average_height ah
where pep.height > ah.avg_height
order by delta_height desc
;