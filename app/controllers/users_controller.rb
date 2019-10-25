require 'pry'

class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    if params[:name].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    else
      User.create(name: params[:name], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/todos'
    end
  end

end