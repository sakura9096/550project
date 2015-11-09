class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
      t.integer :movieid
      t.integer :personid
      t.string :character
      t.integer :order

      t.timestamps null: false
    end
    add_index :casts, :movieid
    add_index :casts, :personid
    add_index :casts, [:movieid, :personid, :character, :order], unique: true
  end
end
