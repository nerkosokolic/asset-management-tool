require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'database_config'

require_relative 'models/user'
require_relative 'models/business_unit'
require_relative 'models/asset'
require_relative 'models/maintenance_log'
require_relative 'models/maintenance_type'
require_relative 'models/utilisation_log'
require_relative 'models/revenue_type'

enable :sessions

# make methods also be available in templates
helpers do
  def logged_in? # predicate method returns true or false
    if current_user
      return true
    else 
      return false
    end
    #alternative is !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end

get '/' do
  @assets = Asset.all
  erb :index
end

get '/my_assets' do
  @assets = Asset.where(bu_id: current_user.bu_id) #more than one find gives back only one
  erb :my_assets
end

require_relative 'routes/sessions'
require_relative 'routes/registrations'



after do
  ActiveRecord::Base.connection.close
end





