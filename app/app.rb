require 'sinatra/base'
require './app/app'
require 'data_mapper'


class AppWeb < Sinatra::Base
  run! if app_file == $0
  set :views, proc { File.join(root, '..', 'views') }


   get '/links' do
     @links = Link.all
     erb :'links/index'
   end


end
