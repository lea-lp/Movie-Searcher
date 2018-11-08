class SearchMovie

  def initialize(string)
    @string = string
    @result = Hash.new

  end

  def perform
    Tmdb::Api.key(ENV['API_KEY'])

    @movies = Tmdb::Movie.find(@string)

    @movies.each_with_index do |movie, index|
      if index == 20
        break
      end

      name = movie.title
      release = movie.release_date

      crew = Tmdb::Movie.credits(movie.id)["crew"]
      director = ""
      crew.each do |person|
        if person["job"]=="Director"
          director = person["name"]
        end
      end
      if director == ""
        director = "...non trouvé..."
      end

      url_poster = movie.poster_path

      @result[movie.id] = {name: name, release_date: release, director: director, url_poster: url_poster}
    end
    return @result
  end
end