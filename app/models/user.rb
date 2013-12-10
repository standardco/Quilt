class User
  include Mongoid::Document
  field :FirstName, type: String
  field :LastName, type: String
  field :Email, type: String
end
