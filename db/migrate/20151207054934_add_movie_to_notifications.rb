class AddMovieToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :movie_id, :integer
  end
end
