require './config/environment'
require 'dotenv'
Dotenv.load
require 'securerandom'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_secret, ENV['SESSION_SECRET'] { SecureRandom.hex(64) }
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def redirect_logged_in
      if logged_in?
        @user = current_user
      else
        redirect '/login'
      end
    end

    def users_todos
      @user = redirect_logged_in
      @todos = Todo.where(user_id: current_user)
      if @todo && @user == current_user
        redirect '/todos'
      end
    end

  end
end