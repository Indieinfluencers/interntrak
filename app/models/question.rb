class Question < ApplicationRecord
  belongs_to :survey
  belongs_to :question_type
  belongs_to :question_group
  has_many :answer_options

  validates :survey, :text, :question_type, presence: true
end
