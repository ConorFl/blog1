post '/new_post' do
  @new_post = Post.create(title: params[:title], content: params[:content])
  @posts_array = Post.all.reverse
  @tag_strings_array = params[:tags].split(',')
  @tag_strings_array.each do |tag|
    tag = Tag.find_or_create_by_word(tag)
    @new_post.tags << tag
    # @tag_id = Tag.find_by_word(tag).id
    # PostTag.create(post_id: @new_post.id, tag_id: @tag_id)
  end
  # @all_tags = []
  # Tag.all.each do |tag|
  #   @all_tags << tag[:word]
  # end
  @every_tag = Tag.all
  erb :index
end

get '/post/:id' do
  @post = Post.find_by_id(params[:id])
  # @associated_post_tags = @post.tags
  # @tag_ids = @associated_post_tags.map{|p| p[:tag_id]}
  # @associated_tags = Tag.find(@tag_ids).map{|x| x[:word]}
  erb :post
end
