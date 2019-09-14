
/*USE CASE 1:
Find the movies who’s IMDB movie rating is greater than 7.5*/
CREATE VIEW `usecase_1` AS
SELECT movies.movie_id,movies.movie_names,m_ratings.imdb_ratings, m_ratings.year_release
FROM (m_ratings
INNER JOIN movies ON m_ratings.movie_id=movies.movie_id)
where imdb_ratings > 7.5;

/*USE CASE 2:
Find the movies who’s Metascores are below 60*/
CREATE VIEW `usecase_2` AS
SELECT movies.movie_id,movies.movie_names,m_ratings.imdb_ratings, m_ratings.year_release
FROM (m_ratings
INNER JOIN movies ON m_ratings.movie_id=movies.movie_id)
where metscores < 60;

/*USE CASE 3:
Find the movies who’s vote count is greater than 20,000 limiting to 5 movies*/
CREATE VIEW `usecase_3` AS
SELECT movies.movie_id,movies.movie_names,m_ratings.imdb_ratings, m_ratings.year_release
FROM (m_ratings
INNER JOIN movies ON m_ratings.movie_id=movies.movie_id)
Where votes > 20000 limit 5;

/*USE CASE 4:
Find the star cast of movies “Green Book” and “A star is Born”*/
CREATE VIEW `usecase_4` AS
SELECT movies.movie_names,actor.star_cast 
FROM (m_actor
INNER JOIN movies ON m_actor.movie_id=movies.movie_id
INNER JOIN actor ON m_actor.actor_id=actor.actor_id)
where movie_names='Green Book' or movie_names='Gully Boy';

/*USE CASE 5:
Find the Genres of movies “Bohemian Rhapsody” and “The Favourite” */ 
CREATE VIEW `usecase_5` AS
SELECT movies.movie_names , genre.genre 
FROM ((m_genre
INNER JOIN movies ON m_genre.movie_id=movies.movie_id)
INNER JOIN genre ON m_genre.genre_id=genre.genre_id)
where movie_names='Bohemian Rhapsody' or movie_names='The Favourite';

/*USE CASE 6:
Find the movie names, imdb_ratings, Captions and User Ids using joins on Movies and Instagram (Consumers) table where Instagram likes for a user > 20 limit to 5:*/
CREATE VIEW `usecase_6` AS
SELECT movies.movie_names , m_ratings.imdb_ratings,user_insta.User_ID,user_insta.Caption,user_insta.likes
FROM (movies
INNER JOIN m_ratings ON m_ratings.movie_id=movies.movie_id
INNER JOIN insta_post ON insta_post.movie_id=movies.movie_id
INNER JOIN user_insta ON insta_post.User_ID=user_insta.User_ID)
where user_insta.likes > 20 limit 5;

/*USE CASE 7:
Find the all the User posts for a particular movie */
CREATE VIEW `usecase_7` AS
SELECT movies.movie_id, movies.movie_names , m_ratings.year_release,
m_ratings.runtime , user_insta.User_ID,user_insta.Caption, user_insta.likes, user_insta.Date,
user_insta.Time
FROM (movies
INNER JOIN m_ratings ON m_ratings.movie_id=movies.movie_id
INNER JOIN insta_post ON insta_post.movie_id=movies.movie_id
INNER JOIN user_insta ON insta_post.User_ID=user_insta.User_ID)
Where movies.movie_names='Green Book';

/*USE CASE 8:
Find the all the User posts for a particular movie where metascores > 60 and imdb ratings < 7.5*/
CREATE VIEW `usecase_8 ` AS
SELECT movies.movie_id,movies.movie_names , m_ratings.year_release,
m_ratings.runtime , user_insta.User_ID,user_insta.Caption, user_insta.likes, user_insta.Date,
user_insta.Time,director.director_name
FROM (m_ratings,insta_post,user_insta,m_director
INNER JOIN movies ON m_ratings.movie_id=movies.movie_id
INNER JOIN insta_post ON insta_post.movie_id=movies.movie_id
INNER JOIN user_insta ON user_insta.User_ID=user_insta.User_ID
INNER JOIN director ON m_director.director_id=director.director_id
)
where metscores > 60 and imdb_ratings < 7.5;

/*USE CASE 9:
Find the average of all ratings for Movies*/
CREATE VIEW `usecase_9` AS
SELECT avg(m_ratings.imdb_ratings), avg(m_ratings.votes),
avg(m_ratings.metscores), avg(m_ratings.runtime)
FROM (m_ratings
INNER JOIN movies ON m_ratings.movie_id=movies.movie_id);

/* USE CASE 10
Find all twitter post for the movies produced by 20th Century Fox*/
CREATE VIEW `usecase_9` AS
SELECT DISTINCT  movies.movie_id as movie_id, movies.movie_names as movie_names, 
twitter_movies.Producers AS Producers, movies.twitter_movies.User_id  AS Producer_user_id, user_twitter.User_id AS User_id, user_twitter.User_Name AS User_Name, user_twitter.User_post AS User_post, user_twitter.Date AS Date,user_twitterTime AS Time FROM ( movies
INNER JOIN twitter_movies on twitter_movies.movie_id=movies.movie_id
INNER JOIN tweet_movies on tweet_movies.movie_id=twitter_movies.movie_id
INNER JOIN user_twitter on user_twitter_movies.User_id=tweet_movies.User_id)
WHERE twitter_movies.Producers='20th Century Fox';


