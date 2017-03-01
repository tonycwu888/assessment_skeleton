get '/sessions' do
  erb :'/sessions/login.html'
end

post '/sessions'  do
  @user = User.authenticate(params[:user][:email], params[:user][:password])

  if @user
    login
    # session[:user_id] = user.id
    redirect "/users/#{@user.id}"
  else
    422
    @errors = ['login fail']
    erb :'sessions/login.html'
  end
end

# get '/sessions/:id' do
#   # @session = Session.find(params[:id])
#   # p '==' * 100
#   # p @session
#   current_user
#   erb :'sessions/show.html'
# end

delete '/sessions/logout' do  #  need to change this to delete instead of get.... 
  # change the nav in the layout .... into buttons or link with input tag....
  logout
  redirect '/'
end
