require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'crud_app'
}

ActiveRecord::Base.establish_connection(options)