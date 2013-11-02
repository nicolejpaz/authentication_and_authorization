get '/' do
  @all_users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    session[:id] = @user[:id]
    redirect '/'
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
end

#----------- USERS -----------

get '/users/new' do
  
  erb :sign_up
end

post '/users' do
  User.create(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
  session[:id] = User.where(name: params[:user][:name])[0][:id]
  redirect '/'
end
