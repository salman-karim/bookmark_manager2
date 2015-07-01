require 'sinatra/base'
require 'data_mapper'
require './app/data_mapper_setup'



class AppWeb < Sinatra::Base

enable :sessions
set :session_secret, 'super_secret'

  run! if app_file == $0

  set :views, proc { File.join(root, '..', 'views') }

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tag].split.each {|tag| link.tags << Tag.create(name: tag)}
    link.save
    redirect to('/links')
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = @user.id
    redirect to('/')
  end

  get '/' do
    erb :layout
  end


  def current_user
    @user ||= User.get(session[:user_id])
  end


end
