class TodosController < ApplicationController

  get '/todos' do
    erb :'todos/index'
  end
end