/* Stored Procedure 1 */
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_1`()
BEGIN
  
  SELECT i.TABLE_NAME, i.COLUMN_NAME, i.IS_NULLABLE, i.DATA_TYPE, i.PRIVILEGES
  FROM information_schema.columns i
  WHERE table_schema = 'Movies';

END

/* Stored Procedure 2 */

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_2`()
BEGIN
SELECT movies.movie_id,movies.movie_names , user_insta.User_ID, user_insta.Caption, user_insta.likes, user_insta.Date,
user_insta.Time
FROM (movies
INNER JOIN insta_post ON insta_post.movie_id=movies.movie_id
INNER JOIN user_insta ON insta_post.User_ID=user_insta.User_ID
)
where user_insta.User_ID like 't%';
END

/* Stored Procedure 3 */
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_3`()
BEGIN
SELECT distinct movies.movie_id,movies.movie_names, m_ratings.imdb_ratings, m_ratings.year_release,m_ratings.votes, actor.star_cast, director.director_name
FROM (movies
INNER JOIN m_ratings ON m_ratings.movie_id=movies.movie_id
INNER JOIN m_actor ON m_actor.movie_id=movies.movie_id
INNER JOIN actor ON actor.actor_id=m_actor.actor_id
INNER JOIN m_director ON m_director.movie_id=movies.movie_id
INNER JOIN director ON director.director_id=m_director.director_id
)
where m_ratings.votes>50000;
END

/* Stored Procedure 4 */
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_4`()
BEGIN
SELECT movies.movie_names ,user_insta.User_ID,user_insta.Caption,user_insta.likes,user_insta.Date,user_insta.Time
FROM (movies
INNER JOIN intsa_post ON intsa_post.movie_id=movies.movie_id
INNER JOIN user_insta ON intsa_post.User_ID=user_insta.User_ID)
where user_insta.likes > 40;
END

/* Stored Procedure 5 */
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_5`()
BEGIN
SELECT movies.movie_names , m_ratings.imdb_ratings,m_ratings.metscores, m_ratings.votes,m_ratings.runtime,
user_twitter.User_id, user_twitter.User_Name, user_twitter.User_post, user_twitter.Date, user_twitter.Time
FROM (movies
INNER JOIN m_ratings ON m_ratings.movie_id=movies.movie_id
INNER JOIN tweet_movies ON tweet_movies.movie_id=movies.movie_id
INNER JOIN user_twitter ON user_twitter.User_id=tweet_movies.User_id
)
where m_ratings.imdb_ratings > 7.2 ;

END

/* Stored Procedure 6 */
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_6`()
BEGIN
SELECT movies.movie_names ,twitter_movies.Producers,twitter_movies.User_id,twitter_movies.Followers,twitter_movies.Post,twitter_movies.Posted_time,twitter_movies.Post_id
FROM (movies
INNER JOIN twitter_movies ON twitter_movies.movie_id=movies.movie_id)
where twitter_movies.Posted_time like '%Feb%';
END

/* Stored Procedure 7 */
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_7`()
BEGIN
SELECT distinct movies.movie_names,m_ratings.imdb_ratings,m_ratings.year_release,m_ratings.votes,
	user_twitter.User_id,user_twitter.User_Name,user_twitter.User_post,user_twitter.Date,user_twitter.Time
	FROM (movies
	INNER JOIN m_ratings ON m_ratings.movie_id=movies.movie_id
	INNER JOIN tweet_movies ON tweet_movies.movie_id=movies.movie_id
	INNER JOIN user_twitter ON tweet_movies.User_iD=user_twitter.User_ID)
	where user_twitter.User_post like '%GullyBoy%';
END

/* Stored Procedure 8 */
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_8`()
BEGIN

SELECT distinct movies.movie_id, movies.movie_names, m_ratings.imdb_ratings, director.director_name, actor.star_cast, user_insta.Date
FROM (movies
INNER JOIN m_ratings ON m_ratings.movie_id=movies.movie_id
INNER JOIN m_director ON m_director.movie_id=movies.movie_id
INNER JOIN director ON director.director_id=m_director.director_id
INNER JOIN m_actor ON m_actor.movie_id=movies.movie_id
INNER JOIN actor ON actor.actor_id=m_actor.actor_id
INNER JOIN insta_post ON insta_post.movie_id=movies.movie_id
INNER JOIN user_insta ON user_insta.User_ID=insta_post.User_ID)
where user_insta.Date>3/21/19
;

END

/* Stored Procedure 9 */
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_9`()
BEGIN
SELECT movies.movie_id,movies.movie_names,m_ratings.imdb_ratings,director.director_name 
FROM (movies
INNER JOIN m_ratings ON m_ratings.movie_id=movies.movie_id
INNER JOIN m_director ON m_director.movie_id=movies.movie_id
INNER JOIN director ON director.director_id=m_director.director_id)
where m_ratings.imdb_ratings > 8 limit 5;
END

/* Stored Procedure 10 */
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_10`()
BEGIN
SELECT movies.movie_names, twitter_movies.Producers, m_ratings.year_release
from (movies
INNER JOIN twitter_movies ON twitter_movies.movie_id=movies.movie_id
INNER JOIN m_ratings ON m_ratings.movie_id=movies.movie_id
) 
where m_ratings.year_release=2018;

END
