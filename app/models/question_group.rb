class QuestionGroup < ApplicationRecord
  belongs_to :survey
  has_many :questions
  has_many :answer_options

  validates :description, :survey, presence: true
end
