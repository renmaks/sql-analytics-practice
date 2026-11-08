-- Назовём шоу хитом в стране, если одновременно выполняются условия:
-- суммарно у шоу набралось не меньше 1 часа просмотра в этой стране;
-- суммарное время просмотра этого шоу в стране строго больше
-- среднего суммарного времени просмотра по всем шоу в этой стране.
with show_totals as (
    select
        u.country_code,
        s.show_id,
        s.title,
        sum(v.minutes_watched) as total_minutes
    from sf.shows s
    join sf.viewings v on v.show_id = s.show_id
    join sf.users u on u.user_id = v.user_id
    group by u.country_code, s.show_id, s.title
),
hits as (
    select
        country_code,
        show_id,
        title,
        total_minutes,
        floor(total_minutes / 60.0) as total_hours
    from show_totals
    where total_minutes >= 60
      and total_minutes > (
          select avg(country_show.total_minutes)
          from show_totals as country_show
          where country_show.country_code = show_totals.country_code
      )
)
select
    country_code,
    show_id,
    title,
    total_hours,
    rank() over (
        partition by country_code
        order by total_hours desc
    ) as hit_rank_in_country
from hits
order by country_code, hit_rank_in_country, show_id
;