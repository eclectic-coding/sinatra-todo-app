ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require

configure :development do
  ENV['SINATRA_ENV'] ||= 'development'

  require 'bundler/setup'
  Bundler.require(:default, ENV['SINATRA_ENV'])

  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    database: 'sinatra_todo'
  )
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

  ActiveRecord::Base.establish_connection(
    adapter: db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    host: db.host,
    username: db.user,
    password: db.password,
    database: db.path[1..-1],
    encoding: 'utf8'
  )
end

require './app/controllers/application_controller'

require_all 'app'
