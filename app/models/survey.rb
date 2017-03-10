class Survey < ApplicationRecord
  belongs_to :author, class: User
  has_many :questions
  has_many :question_groups

  validates :author, :name, presence: true
end
