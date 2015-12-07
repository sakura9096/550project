class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  default_scope -> { order(created_at: :desc)}

  scope :unread, ->{where(read: false)}



  after_create :real_time_push_to_client

  def real_time_push_to_client
  	if self.user
  		hash = {}
  		hash[:count] = self.user.notifications.unread.count
        MessageBus.publish "/notifications_count/#{self.user.temp_access_token}", hash
  	end
  end
end
