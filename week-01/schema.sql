CREATE SCHEMA IF NOT EXISTS postypashki_exercises;

-- Создание таблицы parameters:
CREATE TABLE postypashki_exercises.parameters
(
    id      INTEGER PRIMARY KEY,
    height  FLOAT4,
    weight  FLOAT4
);

COMMENT ON TABLE postypashki_exercises.parameters is 'Содержит рост/вес участников эксперимента';

-- Создание таблиц employees и game_sessions:
CREATE TABLE postypashki_exercises.employees
(
    employee_id INTEGER PRIMARY KEY,
    first_name  TEXT,
    last_name   TEXT
);

COMMENT ON TABLE postypashki_exercises.employees is 'Хранит данные о сотрудниках игрового центра';

CREATE TABLE postypashki_exercises.game_sessions
(
    session_id  INTEGER PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    started_at  TIMESTAMP NOT NULL,

    CONSTRAINT fk_game_sessions_employee
        FOREIGN KEY (employee_id)
        REFERENCES postypashki_exercises.employees(employee_id)
);

COMMENT ON TABLE postypashki_exercises.game_sessions is 'Хранит информацию о проведённых игровых сеансах';

-- Создание таблиц clients и guest_orders:
CREATE TABLE postypashki_exercises.clients
(
    client_id INTEGER PRIMARY KEY,
    first_name  TEXT,
    last_name   TEXT,
    city        TEXT
);

COMMENT ON TABLE postypashki_exercises.clients is 'Хранит информацию о клиентах';

CREATE TABLE postypashki_exercises.guest_orders
(
    order_id    INTEGER PRIMARY KEY,
    client_id   INTEGER NOT NULL,
    city        TEXT,
    amount      NUMERIC,

    CONSTRAINT fk_guest_orders_client
        FOREIGN KEY (client_id)
        REFERENCES postypashki_exercises.clients(client_id)
);

COMMENT ON TABLE postypashki_exercises.guest_orders is 'Хранит данные о бронировании и оплате квестов';

-- Создание таблиц quests и quest_runs:
CREATE TABLE postypashki_exercises.quests
(
    quest_id            INTEGER PRIMARY KEY,
    quest_name          TEXT,
    story_difficulty    INTEGER,

    CONSTRAINT chk_quests_story_difficulty
        CHECK (story_difficulty BETWEEN 1 AND 5)
);


COMMENT ON TABLE postypashki_exercises.quests is 'Содержит информацию о квестах';

CREATE TABLE postypashki_exercises.quest_runs
(
    run_id              INTEGER PRIMARY KEY,
    quest_id            INTEGER NOT NULL,
    status              TEXT NOT NULL,
    duration_minutes    INTEGER,

    CONSTRAINT fk_quest_runs_quest
        FOREIGN KEY (quest_id)
        REFERENCES postypashki_exercises.quests(quest_id),

    CONSTRAINT chk_quest_status
        CHECK (status IN ('success', 'fail'))
);

COMMENT ON TABLE postypashki_exercises.quest_runs is 'Хранит информацию о попытках прохождения квестов';

-- Создание таблицы site_visits:
CREATE TABLE postypashki_exercises.site_visits
(
    visit_id            INTEGER PRIMARY KEY,
    site_client_id      INTEGER,
    visited_at          TIMESTAMP
);


COMMENT ON TABLE postypashki_exercises.site_visits is 'Хранит информацию о посещениях сайта авторизованными клиентами';

