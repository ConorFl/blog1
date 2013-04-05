class CreateTables < ActiveRecord::Migration
  def change
    create_table :posts do |post|
      post.string :title, :content
      post.references :user
    end 
    create_table :tags do |tag|
      tag.string :word
    end
    create_table :posts_tags do |pt|
      pt.references :post, :tag
    end
    create_table :users do |user|
      user.string :email, :password 
    end
    # create_table :users_posts do |user_post|
    #   user_post.references :user, :post
    # end
  end
end
