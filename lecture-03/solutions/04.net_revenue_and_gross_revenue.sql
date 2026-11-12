-- Нужно вывести одну строку с колонками:
-- gross_revenue
-- net_revenue
-- где:
-- gross_revenue — сумма только успешных оплат (учитывать is_refund = false и amount > 0);
-- net_revenue — сумма всех платежей с учётом возвратов (то есть просто сумма
-- amount по всем строкам sf.payments, включая отрицательные).
-- Условия
-- Используйте один запрос (один внешний SELECT), а не два отдельных запроса.
-- Запрещено делать две независимые агрегации над одной и той же таблицей sf.payments:
-- ожидается декомпозиция через CTE или подзапрос.
-- Внутри решения должна быть осознанная работа с UNION/UNION ALL.
with payments_groups as
(   select
        p.amount,
        'gross' as payment_group
    from sf.payments p
    where 1=1
        and p.is_refund = false
        and p.amount > 0
    UNION ALL
    select
        p.amount,
        'net' as payment_group
    from sf.payments p
    )
select
    sum(amount) filter ( where payment_group = 'gross' )    as gross_revenue,
    sum(amount) filter ( where payment_group = 'net' )      as net_revenue
from payments_groups;

