require('mongoid')

class YoUser
    include Mongoid::Document
    
    field :username, type: String
    field :yo_count, type: Integer, default: 0 
end
