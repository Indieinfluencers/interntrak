class ResourceTopic < ApplicationRecord
  has_many :resources, dependent: :destroy

  validates :title, presence: true
end
