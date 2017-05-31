class Survey < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :question_groups, dependent: :destroy

  validates :author, :name, :description, presence: true
end
