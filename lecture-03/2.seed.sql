BEGIN;

-- Тарифы
INSERT INTO sf.plans (plan_id, plan_name, monthly_price, is_premium, is_active) VALUES
    (1, 'Free',       0.00, false, true),
    (2, 'Standard',  9.99, false, true),
    (3, 'Premium',  14.99, true,  true),
    (4, 'Legacy',    7.99, false, false);

-- Пользователи
INSERT INTO sf.users
    (user_id, email, full_name, country_code, created_at, referrer_user_id)
VALUES
    (1,  'anna@example.com',   'Anna Petrova',   'RU', '2024-11-15 10:00:00', NULL),
    (2,  'bob@example.com',    'Bob Stone',      'US', '2024-12-01 12:30:00', 1),
    (3,  'dina@example.com',   'Dina Ibragim',   'RU', '2025-01-05 09:15:00', 2),
    (4,  'liam@example.com',   'Liam Chen',      'CA', '2025-01-20 18:45:00', 1),
    (5,  'sofia@example.com',  'Sofia Novak',    'PL', '2025-02-02 14:10:00', 2),
    (6,  'marco@example.com',  'Marco Rossi',    'IT', '2025-02-14 08:20:00', NULL),
    (7,  'maya@example.com',   'Maya Patel',     'IN', '2025-03-01 16:00:00', 3),
    (8,  'oliver@example.com', 'Oliver Brown',   'GB', '2025-03-12 11:05:00', 4),
    (9,  'yuki@example.com',   'Yuki Sato',      'JP', '2025-04-03 20:40:00', 5),
    (10, 'noah@example.com',   'Noah Wilson',    'US', '2025-04-18 07:50:00', 1),
    (11, 'elena@example.com',  'Elena Garcia',   'ES', '2025-05-09 13:25:00', 6),
    (12, 'amir@example.com',   'Amir Haddad',    'AE', '2025-06-21 19:30:00', 3);

-- Подписки
INSERT INTO sf.subscriptions
    (subscription_id, user_id, plan_id, started_at, cancelled_at, auto_renew)
VALUES
    (10, 1, 3, '2025-01-01 00:00:00', NULL,                  true),
    (11, 2, 2, '2025-01-10 00:00:00', '2025-02-10 00:00:00', false),
    (12, 3, 1, '2025-02-01 00:00:00', NULL,                  true),
    (13, 4, 3, '2025-02-15 00:00:00', NULL,                  true),
    (14, 5, 2, '2025-03-01 00:00:00', '2025-05-01 00:00:00', false),
    (15, 6, 2, '2025-03-10 00:00:00', NULL,                  true),
    (16, 7, 3, '2025-04-01 00:00:00', NULL,                  true),
    (17, 8, 1, '2025-04-15 00:00:00', NULL,                  true),
    (18, 9, 2, '2025-05-01 00:00:00', '2025-06-01 00:00:00', false),
    (19, 10, 3, '2025-05-15 00:00:00', NULL,                 true),
    (20, 11, 2, '2025-06-01 00:00:00', NULL,                 true),
    (21, 12, 4, '2025-07-01 00:00:00', '2025-08-01 00:00:00', false),
    (22, 2,  3, '2025-03-01 00:00:00', NULL,                 true),
    (23, 5,  3, '2025-06-01 00:00:00', NULL,                 true);

-- Платежи: положительная сумма — оплата, отрицательная — возврат
INSERT INTO sf.payments
    (payment_id, subscription_id, paid_at, amount, currency, is_refund)
VALUES
    (100, 10, '2025-01-01 00:05:00',  14.99, 'USD', false),
    (101, 10, '2025-02-01 00:05:00',  14.99, 'USD', false),
    (102, 10, '2025-03-01 00:05:00',  14.99, 'USD', false),
    (103, 11, '2025-01-10 09:00:00',   9.99, 'USD', false),
    (104, 11, '2025-01-11 12:00:00',  -9.99, 'USD', true),
    (105, 13, '2025-02-15 10:00:00',  14.99, 'USD', false),
    (106, 13, '2025-03-15 10:00:00',  14.99, 'USD', false),
    (107, 14, '2025-03-01 08:30:00',   9.99, 'USD', false),
    (108, 15, '2025-03-10 11:20:00',   9.99, 'EUR', false),
    (109, 16, '2025-04-01 07:45:00',  14.99, 'USD', false),
    (110, 18, '2025-05-01 15:00:00',   9.99, 'USD', false),
    (111, 19, '2025-05-15 12:00:00',  14.99, 'USD', false),
    (112, 20, '2025-06-01 16:30:00',   9.99, 'USD', false),
    (113, 21, '2025-07-01 10:15:00',   7.99, 'USD', false),
    (114, 22, '2025-03-01 09:00:00',  14.99, 'USD', false),
    (115, 23, '2025-06-01 09:00:00',  14.99, 'USD', false),
    (116, 23, '2025-07-01 09:00:00',  14.99, 'USD', false);

-- Фильмы, сериалы и другие материалы
INSERT INTO sf.shows
    (show_id, title, category, is_original, release_date)
VALUES
    (1, 'Neon City',          'series',   true,  '2024-09-01'),
    (2, 'Moon Taxi',          'movie',    false, '2023-05-10'),
    (3, 'Little Comets',      'kids',     true,  '2022-11-20'),
    (4, 'The Last Orchard',   'movie',    true,  '2025-01-18'),
    (5, 'World Cup Highlights','sports',  false, '2024-06-15'),
    (6, 'Deep Blue',          'documentary', false, '2021-03-08'),
    (7, 'Northbound',         'series',   false, '2020-10-02'),
    (8, 'Robot Pals',         'kids',     false, '2023-12-01'),
    (9, 'Quiet Signals',      'movie',    true,  '2025-04-11'),
    (10,'City Kitchen',       'series',   true,  '2024-02-14');

-- Просмотры
INSERT INTO sf.viewings
    (viewing_id, user_id, show_id, started_at, minutes_watched, device_type)
VALUES
    (500,  1, 1, '2025-02-01 20:00:00',  45, 'tv'),
    (501,  2, 1, '2025-02-02 21:00:00',  60, 'mobile'),
    (502,  3, 2, '2025-02-02 19:10:00',  30, 'web'),
    (503,  1, 4, '2025-02-05 20:15:00',  95, 'tv'),
    (504,  4, 1, '2025-02-06 18:30:00',  42, 'tablet'),
    (505,  5, 3, '2025-02-07 09:00:00',  25, 'mobile'),
    (506,  6, 5, '2025-02-08 17:45:00',  80, 'web'),
    (507,  7, 4, '2025-02-10 22:10:00', 110, 'tv'),
    (508,  8, 8, '2025-02-11 16:00:00',  35, 'tablet'),
    (509,  9, 2, '2025-02-12 20:20:00', 105, 'tv'),
    (510, 10, 6, '2025-02-14 13:05:00',  50, 'mobile'),
    (511, 11, 7, '2025-02-15 19:30:00',  55, 'web'),
    (512, 12, 9, '2025-02-16 21:00:00',  90, 'tv'),
    (513,  2, 4, '2025-03-01 20:10:00', 100, 'tv'),
    (514,  3, 3, '2025-03-03 10:30:00',  18, 'mobile'),
    (515,  5, 10,'2025-03-05 18:15:00',  47, 'web'),
    (516,  1, 1, '2025-03-07 21:00:00',  60, 'mobile'),
    (517,  4, 5, '2025-03-10 16:45:00',  72, 'tv'),
    (518,  7, 7, '2025-03-12 22:20:00',  40, 'web'),
    (519,  9, 9, '2025-03-15 20:00:00',  88, 'tv'),
    (520, 10, 2, '2025-03-18 12:10:00',  65, 'mobile'),
    (521, 11, 6, '2025-03-20 19:25:00',  52, 'tablet'),
    (522, 12, 8, '2025-03-22 08:45:00',  30, 'mobile'),
    (523,  6, 10,'2025-04-01 17:00:00',  58, 'web'),
    (524,  8, 3, '2025-04-03 09:15:00',  22, 'tablet'),
    (525,  2, 7, '2025-04-05 20:40:00',  48, 'tv');

-- Синхронизация последовательности
SELECT setval(pg_get_serial_sequence('sf.users', 'user_id'),
              (SELECT MAX(user_id) FROM sf.users));
SELECT setval(pg_get_serial_sequence('sf.plans', 'plan_id'),
              (SELECT MAX(plan_id) FROM sf.plans));
SELECT setval(pg_get_serial_sequence('sf.subscriptions', 'subscription_id'),
              (SELECT MAX(subscription_id) FROM sf.subscriptions));
SELECT setval(pg_get_serial_sequence('sf.payments', 'payment_id'),
              (SELECT MAX(payment_id) FROM sf.payments));
SELECT setval(pg_get_serial_sequence('sf.shows', 'show_id'),
              (SELECT MAX(show_id) FROM sf.shows));
SELECT setval(pg_get_serial_sequence('sf.viewings', 'viewing_id'),
              (SELECT MAX(viewing_id) FROM sf.viewings));

COMMIT;