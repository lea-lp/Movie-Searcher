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

      @result[movie.id] = {name: name, release_date: release}
      puts @result[movie.id]
    end
    return @result
  end
end