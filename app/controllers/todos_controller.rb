class TodosController < ApplicationController
  
  get '/todos' do
    if signed_in?
      @user = User.find(session[:user_id])
      @todos = Todo.where(user_id: current_user)
      erb :"todos/index.html"
    else
      redirect '/login'
    end
  end
end