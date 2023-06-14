# Credit Cards Data analysis and Insights

-- 1.which city has spent the highest amount over the year?

select city, years, amount from creditcards 
where ( select max(amount) from creditcards )
order by amount desc
limit 3;


-- 2.which card type has the highest amount over the year?--   
select card_type, amount,years from creditcards where ( select max(amount) from creditcards )
order by amount desc
limit 3;

-- 3.which expense type has the highest amount over the year?-- 
select exp_type, years, amount from creditcards 
where (select max(amount) from creditcards)
order by amount desc
limit 1 ;


-- 4.What is the total amount spent between males and females in numbers and percentage?

select gender,
sum(amount) t_amount,
sum(amount)*100/(select sum(amount) from creditcards) percentage 
from creditcards
group by gender
order by percentage;

-- 5.What is the total amount of spend by females vis a vis Card_Type?


select sum(amount) amount, Card_Type from creditcards 
where Gender = 'f' group by Card_Type
order by sum(amount) desc;


-- 6. Which are the top 5 cities which has the highest spend for men? -- 
select city, amount from creditcards where gender = 'M'
order by amount desc
limit 5;

-- 7. List the top 5 cities with the maximum transactions? 
select city, count(*) as 'no. of transactions' from creditcards group by city
order by count(city) desc
limit 5 ;

-- 8.Show the month wise spend across the years in the descending order? 
select months, sum(amount) T_amount
 from creditcards group by months
 order by sum(amount) desc;
 
 -- 9. Show the total amount spent by men via expense type
 
select sum(amount)Total_amount, (exp_type) from creditcards 
where Gender= 'm' group by Exp_Type
order by sum(amount) desc ;

-- 10. which city use what type of card the most?
select city,
Card_Type,
count(Card_Type) card_use from creditcards 
group by City, Card_Type having count(Card_Type)>= 500
order by Card_Type desc, card_use desc ;


