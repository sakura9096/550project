class SitemapsController < ApplicationController
  def index
  	@static_pages = [root_url]

    @movies = Movie.all
    @people = Person.all
    @genres = Genre.all
    respond_to do |format|
      format.xml
    end
  end
end
