require 'data_mapper'
require './app/models/tag'
require_relative './models/link'
require './app/models/user'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")


DataMapper.finalize

DataMapper.auto_upgrade!
