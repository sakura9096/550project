class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]
  before_action :set_mongo, only: [:show]


  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all.paginate(page: params[:page])
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    tmdb_id = @movie.tmdb_id
    mongo_movie = @cli[:TMDBmovieinfo].find(:id => tmdb_id).first
    @posters = mongo_movie["posters"].uniq
    videos = mongo_movie["youtube_trailers"]
    @urls = videos.map {|v| v["urL"]}
    @crews = @movie.crew_relations.includes(:person).to_a
    #@workers = @movie.crews
    @crews.sort_by! {|crew| crew.job} 
    @casts = @movie.cast_relations.includes(:person).to_a
    @casts.reject! {|cast| cast.character.size == 0}
    @casts.sort_by! {|cast| cast.order}
    num = @movie.genres.size
    if num > 0
      rnd = Random.new
      offset = rnd.rand(num)
      @genre = @movie.genres[offset]
      @related_movies = @genre.movies.take 6
      @related_movies = @related_movies- [@movie]
      if @related_movies.size > 5
        @related_movies = @related_movies.take 5
      end
    else 
      @related_movies = []
    end 
    #@actors = @movie.casts
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :poster, :rating, :overview)
    end

    def set_mongo
      @cli = Mongo::Client.new("mongodb://550project:550project@ds057204.mongolab.com:57204/project550")
    end
end
