class Resource < ApplicationRecord
  has_many :resource_topics
  has_many :resource_types

  validates :title, presence: true
end
