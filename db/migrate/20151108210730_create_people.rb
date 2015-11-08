class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :profile
      t.string :name
      t.integer :personId
      t.string :day_of_birth
      t.text :biography

      t.timestamps null: false
    end
    add_index :people, :personId, unique: true
  end
end
