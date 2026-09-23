-- Задача 4:
-- Топ-3 самых тяжёлых участников по группам роста.
-- Округлить рост участников до ближайшего целого значения.
-- Для каждого округлённого значения роста определить трёх участников с наибольшим весом.

with sorted as (
    select round(pep.height)    as rounded_height,
        pep.id,
        pep.height,
        pep.weight,
        row_number() over (
            partition by round(pep.height)
            order by weight desc
            )                   as rn
from postypashki_exercises.parameters pep
)
select
    s.rounded_height,
    s.id,
    s.height,
    s.weight
from sorted s
where s.rn <= 3
order by
    s.rounded_height asc,
    s.weight desc
;