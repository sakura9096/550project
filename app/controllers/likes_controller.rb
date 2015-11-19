class LikesController < ApplicationController

  def create
    movie = Movie.find(params[:movie_id])
    current_user.like(movie)
    flash[:success] = "Liked the movie successfully!"
    redirect_to movie
  end

  def destroy
    movie = Like.find(params[:id]).movie
    current_user.unlike(movie)
    flash[:success] = "Unliked successfully!"
    redirect_to movie
  end
end
