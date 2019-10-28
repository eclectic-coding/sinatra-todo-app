require 'pry'
class TodosController < ApplicationController

  # CRUD - Create
  get '/todos/new' do
    if logged_in?
      @user = User.find_by(id: session[:user_id])
      erb :'/todos/new'
    else
      redirect '/login'
    end
  end

  post '/todos' do
    if logged_in?
      @user = User.find(session[:user_id])
      # binding.pry

      if params[:title].empty?
        redirect '/todos/new'
      else
        @user = User.find_by(id: session[:user_id])
        @todo = Todo.new
        @todo.title = params[:title]
        @todo.user_id = @user.id
        @todo.save
        redirect '/todos'
      end
    else
      redirect '/login'
    end
  end

  # CRUD - Read
  get '/todos' do
    if logged_in?
      @user = User.find(session[:user_id])
      @todos = Todo.where(user_id: current_user)
      # binding.pry
      erb :'/todos/index'
    else
      redirect '/login'
    end
  end

  get '/todos/:id' do
    @todo = Todo.find_by_id(params['id'])
    erb :"todos/show"
  end

  # CRUD - update
  patch '/todos/:id' do
    @todo = Todo.find_by_id(params[:id])
    params.delete('_method')
    if @todo.update(params)
      redirect '/todos'
    else
      redirect "/todos/#{@todo.id}/edit"
    end
  end

  get '/todos/:id/edit' do
    @user = User.find_by(id: session[:user_id])
    @todo = Todo.find_by_id(params[:id])
    if @todo && @user == current_user
      erb :'/todos/edit'
    else
      redirect '/todos'
    end
  end

  # CRUD - delete
  delete '/todos/:id' do
    @todo = Todo.find_by_id(params[:id])
    if @todo.user.id == current_user.id
      @todo.delete
      redirect '/todos'
    else
      redirect '/login'
    end
  end

end

