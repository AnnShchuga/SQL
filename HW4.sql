-- 1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
SELECT COUNT(*) as 'Likes' FROM profiles WHERE (YEAR(NOW())-YEAR(birthday)) < 12;

-- 2. Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT 
    CASE(gender)
        WHEN 'm' THEN 'мужской'
        WHEN 'f' THEN 'женский'
        ELSE 'нет'
    END as gender,
    COUNT(*) as 'Количество:' FROM profiles GROUP BY gender;
    
-- 3. Вывести всех пользователей, которые не отправляли сообщения.
SELECT DISTINCT id
FROM users
WHERE NOT EXISTS (
SELECT users.id
FROM messages
WHERE users.id = messages.from_user_id);

-- 4. (по желанию)* Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений.
SELECT
    from_user_id,
    COUNT(*) as send 
FROM messages 
WHERE to_user_id=1
GROUP BY from_user_id
ORDER BY send DESC
LIMIT 1;