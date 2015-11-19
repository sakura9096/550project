class Like < ActiveRecord::Base
	belongs_to :user, class_name: "User"
	belongs_to :movie, class_name: "Movie"
	default_scope -> { order(created_at: :desc) }
end
