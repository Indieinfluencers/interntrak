class RequireQuestionIdForAnswerOptions < ActiveRecord::Migration[5.0]
  def change
    change_column :answer_options, :question_id, :integer, null: false
  end
end
