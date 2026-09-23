-- Задача 5:
-- Самые активные сотрудники игрового центра.
-- Подсчитать количество проведённых игровых сессий для каждого сотрудника.
-- Вывести трёх сотрудников с наибольшим количеством сессий.

select
    e.employee_id,
    e.last_name,
    e.first_name,
    count(gs.session_id) as games_cnt
from postypashki_exercises.employees e
left join postypashki_exercises.game_sessions gs
    on e.employee_id = gs.employee_id
group by
    e.employee_id,
    e.first_name,
    e.last_name
order by
    games_cnt desc,
    e.last_name asc
limit 3
;