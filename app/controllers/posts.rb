post '/new_post' do
  Post.find(params[:id]).delete if params[:id]

  # make a new post
  @new_post = Post.create(title: params[:title], content: params[:content])

  @tag_strings_array = params[:tags].split(',')

  @new_post.tags = @tag_strings_array.map do |word|
    Tag.find_or_create_by_word(word)
  end

  User.find(session[:current_user_id]).posts << @new_post

  # @new_post.user = User.find_by_id(session[:current_user_id])

  # @every_tag = Tag.all

  # show all posts on home page in reverse order
  @posts_array = Post.all.reverse

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

get '/user/:id' do
  @user = User.find(params[:id])
  @posts_array = @user.posts
  erb :user
end
