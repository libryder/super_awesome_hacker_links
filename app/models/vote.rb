class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates :user, :link, :presence => true

  attr_accessible :link_id, :user_id
end
