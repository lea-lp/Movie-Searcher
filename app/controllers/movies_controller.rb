class MoviesController < ApplicationController
  def search

  end

  def find
    puts "***************"
    puts params[:movie_name]
    if params[:movie_name] == ""
      flash[:danger] = "Merci de remplir le champ"
      redirect_to '/'
    else 
      puts "coucou************"
      @movies = SearchMovie.new(params[:movie_name]).perform
      if @movies == {}
        @movies = "empty"
      end

      render 'search'
    end
  end
end
