class User < ActiveRecord::Base
  has_many :posts
  EMAIL_REGEX = /[\w-]+@([\w-]+\.)+[\w-]+/
  validates :email, :presence => true, :uniqueness => true, :format => {:with => EMAIL_REGEX}
  validates :password, :presence => true
end
