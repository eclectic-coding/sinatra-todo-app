require 'pry'
require 'sinatra/flash'

class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect '/todos'
    else
      redirect '/signup'
    end
  end

end