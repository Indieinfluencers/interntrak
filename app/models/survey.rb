class Survey < ApplicationRecord
  belongs_to :author, class: User
  has_many :questions, dependent: :destroy
  has_many :question_groups, dependent: :destroy

  validates :author, :name, presence: true
end
