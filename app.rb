require 'sinatra'
require_relative 'models/yo_user' 

Mongoid.load!(File.join(File.dirname(__FILE__), "mongoid.yml"))

get '/' do
  users = YoUser.all.order_by(:yo_count.desc).take(30)

  erb :yo_user_global_highs, locals: {users: users}, layout: :index
end

get '/yo' do 

  return if request.host == "yoyolowest.mpgarate.com"
                                    
  username = params[:username]

  return if username == nil or username == ""
 
  username = username.upcase
 
  @user = YoUser.find_or_create_by(username: username)
  @user.yo_count += 1
  @user.save
end

