class Link < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_many :comments

  attr_accessible :description, :url, :user_id, :rating

  validates :description, :url, :presence => true
  validates_uniqueness_of :url

  scope :rating_sort, order('rating DESC')
end
