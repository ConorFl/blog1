class PostTag < ActiveRecord::Base
  validates :post_id, :presence => true
  validates :tag_id, :presence => true
end
