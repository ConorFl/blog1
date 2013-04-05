enable :sessions

get '/sign_up' do
  erb :sign_up
end

post '/register_user' do
  @encrypted = Digest::SHA1.hexdigest(params[:password])
  User.create(email: params[:email], password: @encrypted)
  @posts_array = []
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  @email = params[:email]
  @encrypted = Digest::SHA1.hexdigest(params[:password])
  @user = User.find_by_email_and_password(@email, @encrypted)
  if @user
    login! @user
    @message = " back #{@user.email}"
    session[:current_user_id] = @user.id
  end
  @posts_array = []
  erb :index
end

get '/logout' do
  logout!
  @posts_array = []
  erb :index
end

helpers do

  def login! user
    session[:current_user_id] = user.id
  end

  def logout!
    session.clear
  end

  def logged_in?
    session[:current_user_id].present?
  end

  def current_user
    return nil unless logged_in?
    @current_user ||= User.find(session[:current_user_id])
  end
end
