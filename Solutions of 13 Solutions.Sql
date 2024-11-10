-- Netflix Data Analysis using SQL
-- Solutions of 15 business problems
-- 1. Count the Number of Movies vs TV Shows

SELECT type,count(*) AS Total_content
FROM netflix
GROUP BY Type

-- 2. Find the Most Common Rating for Movies and TV Shows

SELECT rating, count(*) AS count_data
from netflix
group by rating
order by count_data desc
limit 1

-- 3. List All Movies Released in a Specific Year (e.g., 2020)

select title
from netflix
where type="movie" and release_year=2020


-- 4. Find the Top 5 Countries with the Most Content on Netflix

select country,count(*) as count
from netflix
group by country
order by count desc 
limit 5


-- 5. Identify the Longest Movie

select duration,title
from netflix
where type="movie"
order by duration desc
limit 1


--  6. Find Content Added in the Last 5 Years

select title,type,release_year
from netflix
where release_year>= year(curdate())-5


-- 7. Find All Movies/TV Shows by Director 'Rajiv Chilaka'

select type, title
from netflix
where director="Rajiv Chilaka"

-- 8. List All TV Shows with More Than 5 Seasons

SELECT title
FROM netflix
WHERE type = 'TV Show' AND CAST(duration AS UNSIGNED) > 5

--  9.Find each year and the average numbers of content release in India on netflix. 
return top 5 year with highest avg content release!

SELECT release_year, AVG(content_count) AS avg_content_count
FROM (
    SELECT release_year, COUNT(*) AS content_count
    FROM netflix
    WHERE country = 'India'
    GROUP BY release_year
) AS yearly_content
GROUP BY release_year
ORDER BY avg_content_count DESC
LIMIT 5


-- 10. List All Movies that are Documentaries

SELECT * 
FROM netflix
WHERE listed_in LIKE '%Documentaries'

--  11. Find All Content Without a Director

SELECT * 
FROM netflix
WHERE director IS NULL;

-- 12. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years

SELECT COUNT(*) AS count
FROM netflix
WHERE type = 'Movie' AND cast LIKE '%Salman Khan%' AND release_year >= YEAR(CURDATE()) - 10

-- 13. Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords

SELECT 
    CASE 
        WHEN description LIKE '%kill%' OR description LIKE '%violence%' THEN 'Bad'
        ELSE 'Good'
    END AS category,
    COUNT(*) AS count
FROM netflix
GROUP BY category

-- End of reports
