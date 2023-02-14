select count(1) as n from users;

select count(1) as n from ratings;

-- simple group by
select rating, count(distinct user_id) as num_users 
from ratings 
group by rating;

-- simple group by
select gender, count(distinct id) as num_users 
from users 
group by gender;
-- most participants are males

-- average rating by age group: join + group by
select u.age, avg(r.rating) as avg_rating
from users u join ratings r
on (u.id = r.user_id)
group by u.age;