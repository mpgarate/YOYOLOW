require 'sinatra'
require_relative 'models/yo_user' 

Mongoid.load!(File.join(File.dirname(__FILE__), "mongoid.yml"))

get '/' do
  users = YoUser.all.order_by(:yo_count.desc)
  erb :yo_user_global_highs, locals: {users: users}
end

get '/yo' do 
  @user = YoUser.find_or_create_by(username: params[:username])
  @user.yo_count += 1 
  @user.save

end

