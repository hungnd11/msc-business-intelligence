select count(1) as n from users;

select count(1) as n from ratings;

select rating, count(distinct user_id) as num_users 
from ratings 
group by rating;

select gender, count(distinct id) as num_users 
from users 
group by gender;
-- most participants are males

-- average rating by age group
select u.age, avg(r.rating) as avg_rating
from users u join ratings r
on (u.id = r.user_id)
group by u.age;