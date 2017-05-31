class QuestionGroup < ApplicationRecord
  belongs_to :survey
  has_many :questions, dependent: :destroy
  has_many :answer_options, dependent: :destroy

  validates :description, :survey, presence: true
end
