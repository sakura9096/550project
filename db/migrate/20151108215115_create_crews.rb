class CreateCrews < ActiveRecord::Migration
  def change
    create_table :crews do |t|
      t.integer :movie_id
      t.integer :person_id
      t.string :job
      t.string :department

      t.timestamps null: false
    end
    add_index :crews, :movie_id
    add_index :crews, :person_id
    add_index :crews, [:movie_id, :person_id, :job, :department], unique: true
  end
end
