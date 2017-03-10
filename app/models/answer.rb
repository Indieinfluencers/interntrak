class Answer < ApplicationRecord
  belongs_to :survey_response
  belongs_to :question

  validates :question, :survey_response, :response, presence: true
end
