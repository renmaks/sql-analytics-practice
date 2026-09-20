-- Задача 1:
-- Минимальные и максимальные параметры участников.
-- Определить минимальный и максимальный рост и вес среди всех участников исследования.

select
    min(pep.height) as min_height,
    max(pep.height) as max_height,
    min(pep.weight) as min_weight,
    max(pep.weight) as max_weight
from postypashki_exercises.parameters pep
;