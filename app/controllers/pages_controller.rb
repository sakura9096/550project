class PagesController < ApplicationController
	def home
	  @genres = Genre.all.order("name DESC").paginate(page: params[:page])
      @movies = []
	  @genres.each do |g|
	    @movies << g.movies.first
	  end
	  if current_user
	  	@likes = current_user.feed
	  else
	  	@likes = []
	  end
	end
end
