class TodosController < ApplicationController

  # /todos
  get '/todos' do
    if logged_in?
      @todos = Todo.all
      erb :'todos/index'
    else
      redirect '/login'
    end
  end

  post '/todos' do
    todo = Todo.new(params)
    if todo.save
      redirect "/todos/#{todo.id}"
    else
      redirect '/todos/new'
    end
  end

  # /todos/new
  get '/todos/new' do
    @users = User.all
    erb :'/todos/new'
  end

  # edit todos
  get '/todos/:id/edit' do
    @users = User.all
    @todos = Todo.find_by_id(params[:id])
    if @todo.user.id == current_user.id
      erb :'/todos/edit'
    else
      redirect '/todos'
    end
  end

  patch '/todos/:id' do
    @todo = Todo.find_by_id(params[:id])
    params.delete('_method')
    if @todo.update(params)
      redirect "/todos/#{@todo.id}"
    else
      redirect "/todos/#{@todo.id}/edit"
    end
  end

  # delete todos
  delete '/todos/:id' do
    @todo = Todo.find_by_id(params[:id])
    if @todo.user.id == current_user.id
      @todo.delete
      redirect '/todos'
    else
      redirect '/todos'
    end
  end
end