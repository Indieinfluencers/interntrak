class Resource < ApplicationRecord
  has_many :resource_topics
  has_many :topics, through: :resource_topics
  has_many :resource_types
  has_many :types, through: :resource_types

  validates :title, presence: true
end
