class Type < ApplicationRecord
  has_many :resource_types
  has_many :resources, through: :resource_types

  validates :title, presence: true
end
