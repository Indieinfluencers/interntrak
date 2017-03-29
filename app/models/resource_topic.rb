class ResourceTopic < ApplicationRecord
  belongs_to :topic
  belongs_to :resource
end
