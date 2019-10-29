require 'pry'

class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Successfully created user account.'
      redirect '/todos'
    else
      flash[:danger] = 'Please enter valid registration data!'
      redirect '/signup'
    end
  end

end