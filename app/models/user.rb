class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :journal_entries, foreign_key: :author_id, dependent: :destroy
  has_many :surveys,          foreign_key: :author_id
  has_many :survey_responses, foreign_key: :respondent_id

  def admin?
    role == "admin"
  end
end
