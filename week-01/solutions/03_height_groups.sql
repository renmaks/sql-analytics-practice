-- Задача 3:
-- Анализ групп участников по росту.
-- Разделить участников на группы по диапазонам роста.
-- Для каждой группы рассчитать количество участников, средний рост и средний вес.
-- Оставить только группы, содержащие не менее 10 участников.

select
    p.group_name,
    count(*)        as cnt_people,
    avg(p.height)   as avg_height,
    avg(p.weight)   as avg_weight
from (
    select
        *,
        case
            when pep.height < 160 then 'small'
            when pep.height < 190 then 'medium'
            else 'tall'
        end as group_name
    from postypashki_exercises.parameters pep
      ) as p
group by p.group_name
having count(*) >= 10
order by cnt_people desc
;