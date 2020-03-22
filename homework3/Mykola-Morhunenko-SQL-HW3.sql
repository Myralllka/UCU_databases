е-- 1. Вивести імена замовників в лексикографічному порядку(без повторів).
--                   *** Your code here ***
SELECT DISTINCT first_name FROM customer ORDER BY first_name;
-- 2. Вивести імена замовників(first_name), які повторюються(ті, що зустрічаються в тадлиці більше 1 разу)та відповідні кількості повторів(repeat).
--                   *** Your code here ***
SELECT first_name, count(first_name) as repeat FROM customer group by first_name having count(first_name) > 1;
-- 3. Вивести назви(city_name) 5-ти міст та кількості магазинів в цих містах(num_stores), впорядковані за спаданням кількісті магазинів.
-- 	  (Якщо кількість магазинів в містах однакова, то ці міста мають бути в оберненому до лексикографічного порядку). 
-- 	  (Вважайте що поле city унікально визначає рядочок в таблиці)
-- 	  Чи вийде отримати 5 міст? 
--                   *** Your code here ***
select city as city_name, count(city) as num_stores from (select * from store inner join address on store.address_id = address.address_id) as V inner join city on city.city_id = V.city_id group by city order by city desc;
-- No because there is only two stores

-- 4. Вивести 10 найнепопулярніших назв категорій фільмів(name), та кількості фільмів(num_films), знятих в цих категоріях в порядку зростання кількості фільмів(num_films).
--    (якщо є дві категорії з однаковою тількістю фільмів, то вони мають бути впорядковані за лексикографічним порядком)
--    (Важайте що назва категорії name є унікальною)
--                   *** Your code here ***
select name, count(name) as num_films from (select film_id, category.category_id, name from film_category inner join category on category.category_id = film_category.category_id) as V inner join film on film.film_id = V.film_id group by V.name order by num_films, name limit 10;
-- 5. Знайти 3 мови(name), такі, що фільми, озвучені цими мовами, орендуються найчастіше.
--   (Вважайте що назва мови name є унікальною)
--    Чи вийде отримати 3 мови? 
--                   *** Your code here ***

create view something as
select count, film_id from (select inventory_id, count(inventory_id) from rental group by inventory_id) as V inner join inventory on inventory.inventory_id = V.inventory_id order by film_id;
create view films_with_sums as
select language_id, sum from (select film_id, sum(count) from something group by film_id) as V inner join film on film.film_id = V.film_id;
select * from films_with_sums
select name, sum(sum) from films_with_sums inner join language on films_with_sums.language_id = language.language_id group by name;

-- No because there are only English films

-- 6. Створити предствавлення(actor_num_film) яке містить наступні колонки: 
--    * actor_id - унікальний ідентифікатор актора, 
--    * num_films - кількість фільмів у яких він знявся.
--   (представлення = view)
--                   *** Your code here ***
create view actor_num_film as
select actor.actor_id, count(film.film_id) as num_films from film_actor inner join film on film.film_id = film_actor.film_id inner join actor on film_actor.actor_id = actor.actor_id group by actor.actor_id;

-- 7. Вивести інформацію(full_name) про 10 найбільш популярних акторів(ті, хто знялися в найбільшій кількості фільмів) 
--    та відповідні кількості фільмів(num_films) використовуючи представлення actor_num_film.
--    (full_name = first_name + ' ' + last_name).
--                   *** Your code here ***
select first_name || ' ' ||last_name as full_name, num_films from actor_num_film inner join actor on actor_num_film.actor_id = actor.actor_id order by num_films desc limit 10
-- 8. Створіть представлення(film_num_rental), яке міститиме наступні колонки:
-- 	* film_id - унікальний ідентифікатор фільму,
-- 	* num_rental - кількість оренд відповідного фільму.
--                   *** Your code here ***

create view something as
select count, film_id from (select inventory_id, count(inventory_id) from rental group by inventory_id) as V inner join inventory on inventory.inventory_id = V.inventory_id order by film_id;
create view film_num_rental as
select film_id, sum(count) as num_rental from something group by film_id;
-- 9. Вивести інформацію про 15 фільмів(title), які орендують найчастіше і опис(description) яких містить слово "amazing", та відповідні кількості оренд(num_rental).
--    (якщо фільми мають однакову кількість оренд, впорядкуйте їх лексикографіно за назвою). Використовуйте представлення film_num_rental.
--                   *** Your code here ***
select film.*, num_rental from film_num_rental inner join film on film.film_id = film_num_rental.film_id where description ~ 'Amazing' order by num_rental desc, title limit 15