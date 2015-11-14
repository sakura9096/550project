class RenameForCasts < ActiveRecord::Migration
  def change
  	rename_column :casts, :movieid, :movie_id
  	rename_column :casts, :personid, :person_id
  end
end
