class ResourceType < ApplicationRecord
  belongs_to :type
  belongs_to :resource
end
