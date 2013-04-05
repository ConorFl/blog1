get '/tags' do
  clean_up_tags
  @tags = Tag.all.map{|x| x[:word]}
  erb :tags
end

get '/tag/:word' do
  #show all posts with tag :word
  @tag = Tag.find_by_word(params[:word])
  @posts = @tag.posts
  # @tag_id = Tag.find_by_word(@tag).id
  # @related_post_ids = PostTag.where('tag_id = ?', @tag_id).map{|x| x[:post_id]}
  # @posts = Post.find(@related_post_ids)
  erb :tag
end
