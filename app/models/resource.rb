class Resource < ApplicationRecord
  has_many :resource_topics
  belongs_to :resource_type

  validates :title, presence: true
end
