require 'digest/sha1'

get '/' do
  @posts_array = Post.all.reverse
  erb :index
end
