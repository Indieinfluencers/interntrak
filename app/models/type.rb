class Type < ApplicationRecord
  has_many :resources

  validates :title, :icon, :hover_text, presence: true
end
