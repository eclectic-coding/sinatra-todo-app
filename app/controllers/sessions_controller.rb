require './config/environment'

class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login"
  end

  post '/login' do
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/todos'
    else

      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

end
