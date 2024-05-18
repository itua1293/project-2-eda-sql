
-- Question 8.	Which video game platform has generated the highest sales globally?
USE video_games_db;
SELECT platform, SUM(global_sales) AS total_sales
FROM sales
JOIN games ON sales.game_id = games.game_id
GROUP BY platform
ORDER BY total_sales DESC
LIMIT 1;


-- Question 9: Which publishers have the highest-selling video game titles across different platforms and regions?
USE video_games_db;
SELECT p.publisher_name, SUM(s.global_sales) AS total_sales
FROM video_games_db.sales s
JOIN video_games_db.games g ON s.game_id = g.game_id
JOIN video_games_db.publishers p ON g.game_id = p.publisher_id
GROUP BY p.publisher_name
ORDER BY total_sales DESC
LIMIT 5;

-- Question 10: Do older video game releases (e.g., before 2000) still generate significant sales, or are recent releases 
-- dominating the market?


USE video_games_db;
SELECT 
    g.game_name,
    SUM(s.na_sales) AS na_sales,
    SUM(s.eu_sales) AS eu_sales,
    SUM(s.jp_sales) AS jp_sales,
    SUM(s.other_sales) AS other_sales,
    SUM(s.global_sales) AS global_sales
FROM 
    games g
JOIN 
    sales s ON g.game_id = s.game_id
WHERE 
    `year_of_release,` < 2000
GROUP BY 
    g.game_name
ORDER BY 
    global_sales DESC;