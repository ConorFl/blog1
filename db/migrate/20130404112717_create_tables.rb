class CreateTables < ActiveRecord::Migration
  def change
    create_table :posts do |post|
      post.string :title, :content
    end 
    create_table :tags do |tag|
      tag.string :word
    end
    create_table :posts_tags do |pt|
      pt.references :post, :tag
    end
  end
end
