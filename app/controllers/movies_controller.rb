class MoviesController < ApplicationController
  def search

  end

  def find
    @movies = SearchMovie.new(params[:movie_name]).perform
    render 'search'
  end
end
