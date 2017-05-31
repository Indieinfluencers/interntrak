class AnswerOption < ApplicationRecord
  belongs_to :question
  belongs_to :question_group

  validates :text, presence: true
end
