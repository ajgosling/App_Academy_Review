require 'singleton'
require 'sqlite3'
# CREATE TABLE movies (
#   id INTEGER PRIMARY KEY,
#   title VARCHAR(255) NOT NULL,
#   yr INTEGER NOT NULL,
#   director INTEGER NOT NULL
# );
# CREATE TABLE actors (
#   id INTEGER PRIMARY KEY,
#   name VARCHAR(255) NOT NULL
# );
# CREATE TABLE castings (
#   movie_id INTEGER NOT NULL,
#   actor_id INTEGER NOT NULL,
#   ord INTEGER NOT NULL,

#   FOREIGN KEY(movie_id) REFERENCES movies(id),
#   FOREIGN KEY(actor_id) REFERENCES actors(id)
class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# 1. Obtain the cast list for the movie "Zoolander"; order by the
# actor's name.
def zoolander_cast
  MovieDatabase.execute(<<-SQL)
    SELECT
      actors.name
    FROM
      movies
    JOIN castings ON movies.id = castings.movie_id
    JOIN actors ON actors.id = castings.actor_id
    WHERE
      movies.title = 'Zoolander'
    ORDER BY
      actors.name ASC
SQL
end

# 2. List the films in which 'Harrison Ford' has appeared; order by
# movie title.
def harrison_ford_films
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.title
    FROM
      movies
    JOIN castings ON movies.id = castings.movie_id
    JOIN actors ON actors.id = castings.actor_id
    WHERE
      actors.name = 'Harrison Ford'
    ORDER BY
      movies.title ASC
SQL
end

# 3. List the films where 'Harrison Ford' has appeared, but not in the
# star role. Order by movie title.
def harrison_ford_supporting_actor_films
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.title
    FROM
      movies
    JOIN castings ON movies.id = castings.movie_id
    JOIN actors ON actors.id = castings.actor_id
    WHERE
      actors.name = 'Harrison Ford'
    AND
      castings.ord != 1
    ORDER BY
      movies.title ASC
SQL
end

# 4. List the films together with the leading star for all films
# produced in 1910. Order by movie title.
def leading_star_for_1910_films
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.title, actors.name
    FROM
      movies
    JOIN castings ON movies.id = castings.movie_id
    JOIN actors ON actors.id = castings.actor_id
    WHERE
      movies.yr = 1910
    AND
      castings.ord = 1
    ORDER BY
      movies.title ASC
SQL
end

# 5. There is a movie from 1920 in our database for which there is no
#    associated casting information. Give the title of this movie.
def no_casting_info
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.title
    FROM
      movies
    WHERE
      movies.yr = 1920
    AND
      movies.id NOT IN (
        SELECT
          movie_id
        FROM
          castings
      )

SQL
end

# 6. Which films have more than 60 roles? List the movie title and
# number of roles. Order by movie title.
def big_movies
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.title, COUNT(*) AS roles
    FROM
      movies
    JOIN castings ON movies.id = castings.movie_id
    JOIN actors ON actors.id = castings.actor_id
    GROUP BY
      movies.id
    HAVING
      COUNT(*) > 60
    ORDER BY
      movies.title
SQL
end

# 7. List the film title and the leading actor for all of the films
# 'Julie Andrews' played in. Order by movie title name. Be careful!
# There is a movie (Pink Panther) in which Julie Andrews appears in
# two roles; do not double count the star of that film (Peter
# Sellers).
def julie_andrews_stars
  MovieDatabase.execute(<<-SQL)
    SELECT
      DISTINCT movies.title, actors.name
    FROM
      movies
    JOIN castings ON movies.id = castings.movie_id
    JOIN actors ON actors.id = castings.actor_id
    WHERE
      castings.ord = 1
    AND
      movies.title IN (
      SELECT
        movies.title
      FROM
        movies
      JOIN castings ON movies.id = castings.movie_id
      JOIN actors ON actors.id = castings.actor_id
      WHERE
        actors.name = 'Julie Andrews'
    )
SQL
end

# 8. Which were the busiest years for 'John Travolta'? List the year
# and the number of movies he made each year, for any year in which he
# made >2 movies. Order by year.
def busiest_john_travolta_years
  MovieDatabase.execute(<<-SQL)
    SELECT
      movies.yr, COUNT(*) AS count
    FROM
      movies
    JOIN castings ON movies.id = castings.movie_id
    JOIN actors ON actors.id = castings.actor_id
    WHERE
      actors.name = 'John Travolta'
    GROUP BY
      movies.yr
    HAVING
      count(*) > 2
    ORDER BY
      movies.yr
SQL
end

