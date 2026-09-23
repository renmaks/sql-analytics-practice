CREATE SCHEMA IF NOT EXISTS postypashki_exercises2;

-- Задание 2:
-- Создать схему для простого интернет-магазина.

CREATE  TABLE postypashki_exercises2.users
(
    id          SERIAL PRIMARY KEY,
    email       TEXT NOT NULL UNIQUE,
    full_name   TEXT,
    created_at  TIMESTAMP DEFAULT(CURRENT_TIMESTAMP)
);

COMMENT ON TABLE postypashki_exercises2.users is 'Содержит список пользователей интернет-магазина';

CREATE  TABLE postypashki_exercises2.products
(
    id          SERIAL PRIMARY KEY,
    name        TEXT NOT NULL,
    price       NUMERIC(25,2) NOT NULL CHECK(price > 0)
);

COMMENT ON TABLE postypashki_exercises2.products is 'Содержит список товаров интернет-магазина';

CREATE  TABLE postypashki_exercises2.orders
(
    id              SERIAL PRIMARY KEY,
    user_id         INTEGER NOT NULL REFERENCES postypashki_exercises2.users(id),
    status          TEXT NOT NULL DEFAULT('new'),
    total_amount    NUMERIC(25,2) NOT NULL CHECK(total_amount >= 0)
);

COMMENT ON TABLE postypashki_exercises2.orders is 'Содержит заказы интернет-магазина';

CREATE  TABLE postypashki_exercises2.order_items
(
    PRIMARY KEY(order_id, product_id),
    order_id    INTEGER REFERENCES postypashki_exercises2.orders(id),
    product_id  INTEGER REFERENCES postypashki_exercises2.products(id),
    quantity    INTEGER NOT NULL CHECK(quantity > 0),
    price       NUMERIC(25, 2) NOT NULL CHECK (price > 0)
);

COMMENT ON TABLE postypashki_exercises2.order_items is 'Хранит содержимое заказов интернет-магазина';

