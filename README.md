# Netflix Movies and TV Shows Data Analysis using SQL

![](https://github.com/najirh/netflix_sql_project/blob/main/logo.png)

## Overview
This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to extract valuable insights and answer various business questions based on the dataset. The following README provides a detailed account of the project's objectives, business problems, solutions, findings, and conclusions.

## Objectives

- Analyze the distribution of content types (movies vs TV shows).
- Identify the most common ratings for movies and TV shows.
- List and analyze content based on release years, countries, and durations.
- Explore and categorize content based on specific criteria and keywords.

## Dataset

The data for this project is sourced from the Kaggle dataset:

- **Dataset Link:** [Movies Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

## Schema

```sql
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```

## Business Problems and Solutions

### 1. Count the Number of Movies vs TV Shows

```sql
SELECT type,count(*) AS Total_content
FROM netflix
GROUP BY Type;
```

**Objective:** Determine the distribution of content types on Netflix.

### 2. Find the Most Common Rating for Movies and TV Shows

```sql
SELECT rating, count(*) AS count_data
from netflix
group by rating
order by count_data desc
limit 1;
     
```

**Objective:** Identify the most frequently occurring rating for each type of content.

### 3. List All Movies Released in a Specific Year (e.g., 2020)

```sql
select title
from netflix
where type="movie" and release_year=2020;
```

**Objective:** Retrieve all movies released in a specific year.

### 4. Find the Top 5 Countries with the Most Content on Netflix

```sql
select country,count(*) as count
from netflix
group by country
order by count desc 
limit 5;
```

**Objective:** Identify the top 5 countries with the highest number of content items.

### 5. Identify the Longest Movie

```sql
select duration,title
from netflix
where type="movie"
order by duration desc
limit 1;
```

**Objective:** Find the movie with the longest duration.

### 6. Find Content Added in the Last 5 Years

```sql
select title,type,release_year
from netflix
where release_year>= year(curdate())-5;
```

**Objective:** Retrieve content added to Netflix in the last 5 years.

### 7. Find All Movies/TV Shows by Director 'Rajiv Chilaka'

```sql
select type, title
from netflix
where director="Rajiv Chilaka";
```

**Objective:** List all content directed by 'Rajiv Chilaka'.

### 8. List All TV Shows with More Than 5 Seasons

```sql
SELECT title
FROM netflix
WHERE type = 'TV Show' AND CAST(duration AS UNSIGNED) > 5;
```

**Objective:** Identify TV shows with more than 5 seasons.

### 9.Find each year and the average numbers of content release in India on netflix. 
return top 5 year with highest avg content release!

```sql
SELECT release_year, AVG(content_count) AS avg_content_count
FROM (
    SELECT release_year, COUNT(*) AS content_count
    FROM netflix
    WHERE country = 'India'
    GROUP BY release_year
) AS yearly_content
GROUP BY release_year
ORDER BY avg_content_count DESC
LIMIT 5;
```

**Objective:** Calculate and rank years by the average number of content releases by India.

### 10. List All Movies that are Documentaries

```sql
SELECT * 
FROM netflix
WHERE listed_in LIKE '%Documentaries';
```

**Objective:** Retrieve all movies classified as documentaries.

### 11. Find All Content Without a Director

```sql
SELECT * 
FROM netflix
WHERE director IS NULL;
```

**Objective:** List content that does not have a director.

### 12. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years

```sql
SELECT COUNT(*) AS count
FROM netflix
WHERE type = 'Movie' AND cast LIKE '%Salman Khan%' AND release_year >= YEAR(CURDATE()) - 10;
```

**Objective:** Count the number of movies featuring 'Salman Khan' in the last 10 years.

### 13. Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords

```sql
SELECT 
    CASE 
        WHEN description LIKE '%kill%' OR description LIKE '%violence%' THEN 'Bad'
        ELSE 'Good'
    END AS category,
    COUNT(*) AS count
FROM netflix
GROUP BY category;
```
- **LinkedIn**: [Connect with me professionally](https://www.linkedin.com/in/rahul-yadav-b16857205/)
Thank you for your support, and I look forward to connecting with you!
