class LikesController < ApplicationController

  def create
    movie = Movie.find(params[:movie_id])
    current_user.like(movie)
    current_user.followers.each do |user|
      Notification.create(user_id: user.id, read:false, followed_id: current_user.id, movie_id: movie.id)
    end
    #Notification.create(user_id: current_user.id, read:false, followed_id: current_user.id)
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
