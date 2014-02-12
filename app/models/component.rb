class Component
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  field :title, type: String
  field :description, type: String
  field :notes, type: String
  field :dependencies, type: String
  field :code, type: String
  field :user_id, type: String
  field :styleguide_id, type: String
  field :tags, type: String

  slug :title
  belongs_to :styleguide
end
