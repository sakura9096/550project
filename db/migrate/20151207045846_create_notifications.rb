class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :read
      t.integer :user_id
      t.integer :followed_id

      t.timestamps null: false
    end
  end
end
