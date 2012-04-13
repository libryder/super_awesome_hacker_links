class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  attr_accessible :body, :user_id, :link_id
end
