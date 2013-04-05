class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user
  validates :content, :presence => true
  validates :title, :presence => true
end
