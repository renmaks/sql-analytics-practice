-- Задание 3:
-- Обновление данных.

-- Увеличьте цену всех товаров на 10%
UPDATE postypashki_exercises2.products
SET price = price + ((price/100)*10)
WHERE price > 0;

-- Скидка на конкретного пользователя:
-- выберите пользователя по email;
-- заказы только new
UPDATE postypashki_exercises2.orders
SET total_amount = total_amount * 0.9
WHERE 1=1
    and user_id = (select user_id from postypashki_exercises2.users where email = 'penis@mail.ru')
    and status = 'new';

-- пусть в orders.total_amount пока нули;
-- одним запросом UPDATE ... SET total_amount = ...
-- пересчитайте сумму как сумму quantity * price по всем строкам из order_items для каждого заказа
UPDATE postypashki_exercises2.orders
SET total_amount = (select
                        sum(oi.quantity * oi.price)
                    from postypashki_exercises2.order_items oi
                    where oi.order_id = orders.id)
WHERE total_amount = 0;

