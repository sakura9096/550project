class RenameCrewColumns < ActiveRecord::Migration
  def change
  	rename_column :crews, :movieid, :movie_id
  	rename_column :crews, :personid, :person_id
  end
end
