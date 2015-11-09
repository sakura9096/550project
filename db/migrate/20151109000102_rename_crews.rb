class RenameCrews < ActiveRecord::Migration
  def change
  	rename_column :crews, :movie_id, :movieid
  	rename_column :crews, :person_id, :personid
  end
end
