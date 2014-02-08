class Styleguide
  include Mongoid::Document
  include Mongoid::Slug

  field :title, type: String
  field :user_id, type: String
  field :is_public, type: Integer
  field :css_path, type: String
  #field :tags, type: String
  field :description, type: String
  field :url, type: String
  field :categories, type: String

  belongs_to :user

  slug :title
end
