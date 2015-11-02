class ChangeColumnTypesForMovies < ActiveRecord::Migration
  def change
  	change_column :movies, :rating, :decimal
  	change_column :movies, :overview, :text
  end
end
