require 'sinatra'
require_relative 'models/yo_user' 

Mongoid.load!(File.join(File.dirname(__FILE__), "mongoid.yml"))

get '/yo' do 
  @user = YoUser.find_or_create_by(username: params[:username])
  @user.yo_count += 1 
  @user.save

  names = ""
  YoUser.all.each do |user|
    names << user.username
    names << " | #{user.yo_count}"
    names << "<br />"  
  end
    
  names
end

