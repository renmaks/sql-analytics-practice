-- Задание 5:
-- SELECT и тернарная логика.

--  Выведите список всех пользователей и их заказов,
--  чтобы были видны и те пользователи, у которых ещё нет заказов.
INSERT INTO postypashki_exercises2.users (id, email, full_name)
VALUES
    (4, 'tankist@outlook.com', 'antonina petrovna');

select
    u.full_name, o.id
from postypashki_exercises2.users u
    left join postypashki_exercises2.orders o on u.id = o.user_id;

--Напишите запрос, который выбирает все заказы, у которых total_amount ещё не посчитан
INSERT INTO postypashki_exercises2.orders (user_id, total_amount)
VALUES
    (3, 0);

select o.id
from postypashki_exercises2.orders o
where total_amount = 0;

--  Напишите запрос, который:
--  выбирает все товары дороже 100;
--  сортирует по цене по убыванию;
--  берёт только 5 самых дорогих.
select p.name, p.price
from postypashki_exercises2.products p
where p.price > 100
order by 2 desc
limit 5;

