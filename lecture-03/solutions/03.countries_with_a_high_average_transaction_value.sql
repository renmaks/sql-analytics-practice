-- Для каждой страны посчитайте средний размер платежа avg_payment по успешным оплатам:
-- учитывать только строки из sf.payments, где is_refund = false и amount > 0;
-- страну определять по пользователю, связанному с платежом через цепочку payments -> subscriptions
-- Нужно вывести только те страны, у которых:
-- avg_payment больше или равно максимальной цены любого плана.
-- Выведите:
-- country_code
-- avg_payment
select
    u.country_code,
    avg(p.amount) as avg_payment
from sf.payments p
join sf.subscriptions s on p.subscription_id = s.subscription_id
join sf.users u on s.user_id = u.user_id
where 1=1
    and p.amount > 0
    and p.is_refund = false
group by u.country_code
having avg(p.amount) >= (select max(monthly_price)
                        from sf.plans);
