-- Нужно найти шоу, которые одновременно удовлетворяют условиям:
-- шоу хотя бы один раз было просмотрено платным пользователем: пользователь
-- считается платным, если у него есть хотя бы одна подписка на план, где monthly_price > 0;
-- шоу ни разу не было просмотрено пользователем, который полностью бесплатный:
-- у него либо нет подписок вообще, либо все его подписки только на бесплатные планы
with paid_users as (
    select distinct
        s.user_id
    from sf.subscriptions s
    join sf.plans p on p.plan_id = s.plan_id
    where p.monthly_price > 0
      and p.is_active = true
      and s.cancelled_at is null
)
select
    sh.show_id,
    sh.title
from sf.shows sh
where exists (
    select 1
    from sf.viewings v
    join paid_users pu on pu.user_id = v.user_id
    where v.show_id = sh.show_id
)
and not exists (
    select 1
    from sf.viewings v
    where v.show_id = sh.show_id
      and not exists (
          select 1
          from paid_users pu
          where pu.user_id = v.user_id
      )
);
