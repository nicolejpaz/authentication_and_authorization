get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
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
