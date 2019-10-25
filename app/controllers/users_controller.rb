class UsersController < Sinatra::Base

  get '/users' do
    if signed_in?
      @user = User.find(session[:user_id])
      erb :'/users/show'
    else
      redirect to '/login'
    end
  end

  # get /users/:id
  get '/users/:id' do
    if signed_in?
      @user = User.find(params[:id])
      erb :'/users/show'
    else
      redirect to '/login'
    end
  end

  # get /signin
  # if signed in
  # erb :/users/show




end