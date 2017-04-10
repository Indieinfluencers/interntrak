class Type < ApplicationRecord
  has_many :resources_types
  has_many :types, through: :resource_types

  validates :title, :icon, :hover_text, presence: true
end
