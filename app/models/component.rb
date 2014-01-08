class Component
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :notes, type: String
  field :dependencies, type: String
  field :code, type: String
  field :user_id, type: String

  belongs_to :user
end
