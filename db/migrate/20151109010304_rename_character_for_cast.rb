class RenameCharacterForCast < ActiveRecord::Migration
  def change
  	remove_index :casts, :column => [:movieid, :personid, :character, :order]
  	change_column :casts, :character, :text
  end
end
