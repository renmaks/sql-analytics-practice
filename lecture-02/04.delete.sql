-- Задание 4:
-- Удаление данных.

--Удалите один товар из products, который ещё не используется в order_items.
DELETE FROM postypashki_exercises2.products
WHERE id not in (select product_id from postypashki_exercises2.order_items);

--Напишите запрос, который удалит все заказы со статусом 'cancelled'
INSERT INTO postypashki_exercises2.orders (user_id, status, total_amount)
VALUES
    (1,'cancelled', 0);

DELETE FROM postypashki_exercises2.orders
WHERE status = 'cancelled';