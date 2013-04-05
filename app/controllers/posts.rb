post '/new_post' do
  Post.find(params[:id]).delete if params[:id] && Post.exists?(params[:id])
  @new_post = Post.create(title: params[:title], content: params[:content])
  @posts_array = Post.all.reverse
  @tag_strings_array = params[:tags].split(',')
  @new_post.tags = @tag_strings_array.map do |word|
    Tag.find_or_create_by_word(word)
  end
  @new_post.user = User.find_by_id(session[:current_user_id])
  @every_tag = Tag.all

  erb :index
end

get '/post/:id' do
  @post = Post.find_by_id(params[:id])
  erb :post
end

get '/edit/:id' do
  @post = Post.find(params[:id])
  erb :edit
end

get '/delete/:id' do
    Post.find(params[:id]).delete
    @posts_array = Post.all.reverse
    clean_up_tags
    erb :index
end

