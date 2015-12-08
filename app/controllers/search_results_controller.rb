class SearchResultsController < ApplicationController
  def index
  	if params[:keywords].present?
  		@keywords = params[:keywords]
  		@res_m = Movie.where('lower(title) = ?', @keywords.downcase)
  		@res_p = Person.where('lower(name) = ?', @keywords.downcase)
  		@res_u = User.where('lower(name) = ?', @keywords.downcase)
  	else
  		@res_u = []
  		@res_p = []
  		@res_m = []
  	end
  end
end
