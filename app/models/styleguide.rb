class Styleguide
  include Mongoid::Document
  field :title, type: String
  field :user_id, type: String
  field :is_public, type: Integer

  belongs_to :user
end
