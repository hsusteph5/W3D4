# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer

def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.

  Movie
    .select(:id, :title, :yr, :score)
    .where(yr: 1980..1989, score: 3..5)
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie
    .select(:yr)
    .group(:yr)
    .having('MAX(score) < 8.0')
    .pluck(:yr)
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor
    .select(:id, :name)
    .joins(:movies)
    .where('movies.title = ?', title)
    .order('castings.ord')
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  # Movie
  #   .select(:id, :title, 'actors.name')
  #   .joins(:director, :castings)
  Movie
    .joins(:actors)
    .where('movies.director_id = actors.id AND castings.ord = 1')
    .select('movies.id, movies.title, actors.name')
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  Actor
    .select('actors.id, actors.name, COUNT(*) AS roles')
    .joins(:castings)
    .where('castings.ord != 1')
    .group('actors.id')
    .order('COUNT(*) DESC')
    .limit(2)
end
