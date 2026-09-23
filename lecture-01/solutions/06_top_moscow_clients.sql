-- Задача 6:
-- Клиенты с наибольшими расходами в Москве.
-- Рассчитать общую сумму, которую каждый клиент потратил на прохождение квестов в Москве.
-- Вывести 10 клиентов с наибольшими расходами.

select
    c.first_name,
    c.last_name,
    sum(go.amount) as total_amount
from postypashki_exercises.clients c
join postypashki_exercises.guest_orders go
    on c.client_id = go.client_id
where go.city = 'Москва'
group by
    c.client_id,
    c.first_name,
    c.last_name
order by total_amount desc
limit 10
;