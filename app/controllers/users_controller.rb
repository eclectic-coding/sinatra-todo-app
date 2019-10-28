require 'pry'

class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.new(params)
    binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect '/todos'
    else
      redirect '/signup'
    end
  end

end