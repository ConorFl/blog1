post '/new_post' do
  @new_post = Post.create(title: params[:title], content: params[:content])
  @posts_array = Post.all.reverse
  @tag_strings_array = params[:tags].split(',')
  @new_post.tags = @tag_strings_array.map do |word|
    Tag.find_or_create_by_word(word)
  end
  @every_tag = Tag.all
  erb :index
end

get '/post/:id' do
  @post = Post.find_by_id(params[:id])
  erb :post
end
