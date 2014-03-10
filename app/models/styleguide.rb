class Styleguide
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :title, type: String
  field :user_id, type: String
  field :is_public, type: String
  field :css_paths, type: String
  #field :tags, type: String
  field :description, type: String
  field :categories, type: String
  field :num_components, type: Integer
  field :image_url, type: String

  slug :title
  validates_uniqueness_of :title
  embedded_in :user
  embeds_many :components
end
