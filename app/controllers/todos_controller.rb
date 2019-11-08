require 'pry'
class TodosController < ApplicationController

  # CRUD - Create
  get '/todos/new' do
    redirect_logged_in
    erb :'/todos/new'
  end

  post '/todos' do
    redirect_logged_in
    if params[:title].empty?
      redirect '/todos/new'
    else
      current_user
      @todo = Todo.new
      @todo.title = params[:title]
      @todo.user_id = @user.id
      @todo.save
      redirect '/todos'
    end
  end

  # CRUD - Read
  get '/todos' do
    users_todos
    erb :'/todos/index'
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
    @user = current_user
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

