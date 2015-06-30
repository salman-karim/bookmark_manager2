require 'sinatra/base'
require './app/app'
require 'data_mapper'
require_relative './models/link'


class AppWeb < Sinatra::Base

  run! if app_file == $0

  set :views, proc { File.join(root, '..', 'views') }

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect('/links')
  end


  get '/links' do
    @links = Link.all
    erb :'links/index'
  end


end
