-- Задача 7:
-- Среднее время успешного прохождения квестов.
-- Для каждого квеста рассчитать среднюю продолжительность успешных прохождений.
-- Учитывать только попытки со статусом 'success'.

select
    q.quest_name,
    q.story_difficulty,
    avg(qr.duration_minutes) as avg_duration
from postypashki_exercises.quests q
join postypashki_exercises.quest_runs qr
    on q.quest_id = qr.quest_id
where qr.status = 'success'
group by
    q.quest_id,
    q.quest_name,
    q.story_difficulty
order by avg_duration
;