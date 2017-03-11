class SurveyResponse < ApplicationRecord
  belongs_to :survey
  belongs_to :respondent, class: User
  has_many :answers, dependent: :destroy

  validates :respondent, :survey, presence: true
end
