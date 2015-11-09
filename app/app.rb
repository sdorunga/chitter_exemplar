ENV["RACK_ENV"] ||= "development"

require "sinatra/base"
require "sinatra/flash"
require_relative "data_mapper_setup"
require 'pry'

class Chitter < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride
  register Sinatra::Flash

  get "/" do
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
require_relative "controllers/users"
