CREATE SCHEMA sf;

-- Пользователи
CREATE TABLE sf.users (
    user_id           BIGSERIAL PRIMARY KEY,
    email             TEXT NOT NULL UNIQUE,
    full_name         TEXT NOT NULL,
    country_code      CHAR(2) NOT NULL,
    created_at        TIMESTAMP NOT NULL DEFAULT now(),
    referrer_user_id  BIGINT,
    CONSTRAINT fk_users_referrer
        FOREIGN KEY (referrer_user_id) REFERENCES sf.users(user_id)
        ON DELETE SET NULL
);

-- Тарифные планы
CREATE TABLE sf.plans (
    plan_id          BIGSERIAL PRIMARY KEY,
    plan_name        TEXT NOT NULL,
    monthly_price    NUMERIC(10,2) NOT NULL,
    is_premium       BOOLEAN NOT NULL DEFAULT false,   -- напр. UHD, без рекламы
    is_active        BOOLEAN NOT NULL DEFAULT true
);

-- Подписки пользователей
CREATE TABLE sf.subscriptions (
    subscription_id   BIGSERIAL PRIMARY KEY,
    user_id           BIGINT NOT NULL,
    plan_id           BIGINT NOT NULL,
    started_at        TIMESTAMP NOT NULL,
    cancelled_at      TIMESTAMP,          -- NULL = активна
    auto_renew        BOOLEAN NOT NULL DEFAULT true,
    CONSTRAINT fk_subscriptions_user
        FOREIGN KEY (user_id) REFERENCES sf.users(user_id),
    CONSTRAINT fk_subscriptions_plan
        FOREIGN KEY (plan_id) REFERENCES sf.plans(plan_id)
);

-- Платежи по подпискам
CREATE TABLE sf.payments (
    payment_id        BIGSERIAL PRIMARY KEY,
    subscription_id   BIGINT NOT NULL,
    paid_at           TIMESTAMP NOT NULL,
    amount            NUMERIC(10,2) NOT NULL,  -- >0 для оплаты, <0 для возврата
    currency          CHAR(3) NOT NULL DEFAULT 'USD',
    is_refund         BOOLEAN NOT NULL DEFAULT false,
    CONSTRAINT fk_payments_subscription
        FOREIGN KEY (subscription_id) REFERENCES sf.subscriptions(subscription_id)
);

-- Каталог фильмов/сериалов
CREATE TABLE sf.shows (
    show_id        BIGSERIAL PRIMARY KEY,
    title          TEXT NOT NULL,
    category       TEXT NOT NULL, -- 'movie', 'series', 'kids', 'sports', ...
    is_original    BOOLEAN NOT NULL DEFAULT false,
    release_date   DATE NOT NULL
);

-- События просмотра
CREATE TABLE sf.viewings (
    viewing_id       BIGSERIAL PRIMARY KEY,
    user_id          BIGINT NOT NULL,
    show_id          BIGINT NOT NULL,
    started_at       TIMESTAMP NOT NULL,
    minutes_watched  INTEGER NOT NULL,
    device_type      TEXT NOT NULL, -- 'mobile', 'tv', 'web', ...
    CONSTRAINT fk_viewings_user
        FOREIGN KEY (user_id) REFERENCES sf.users(user_id),
    CONSTRAINT fk_viewings_show
        FOREIGN KEY (show_id) REFERENCES sf.shows(show_id)
);
