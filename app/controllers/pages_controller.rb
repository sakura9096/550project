class PagesController < ApplicationController
	def home
	  if current_user
	  	@likes = current_user.feed
	  else
	  	@likes = []
	  end
	end
end
