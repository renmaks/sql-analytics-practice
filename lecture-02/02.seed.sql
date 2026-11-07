-- Задание 2:
-- Вставка данных.

INSERT INTO postypashki_exercises2.users (id, email, full_name)
VALUES
    (1, 'kykyryza@gmail.com', 'pesche suda'),
    (2, 'penis@mail.ru', 'kirill'),
    (3, '25sisek@yandex.ru', 'anton');

INSERT INTO postypashki_exercises2.products (id, name, price)
VALUES
    (1, 'dildo', 500),
    (2, 'teso', 5000),
    (3, 'chipsi', 125);

INSERT INTO postypashki_exercises2.orders (user_id, total_amount)
VALUES
    (2, 5000);

INSERT INTO postypashki_exercises2.order_items (order_id, product_id, price)
VALUES
    (2, 2, 5000);
