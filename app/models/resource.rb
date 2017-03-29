class Resource < ApplicationRecord
  has_many :resource_topics
  has_many :topics, through: :resource_topics
  has_many :types

  validates :title, presence: true
end
