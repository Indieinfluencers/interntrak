class CreateSurveyModels < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string  :name,                null: false
      t.string  :description,         null: false
      t.integer :author_id,           null: false
      t.boolean :active,              null: false, default: true

      t.timestamps
    end

    create_table :questions do |t|
      t.integer :survey_id,           null: false
      t.text    :text,                null: false
      t.integer :question_type_id,    null: false
      t.boolean :mandatory,           null: false, default: true
      t.integer :question_group_id
      t.integer :order

      t.timestamps
    end

    create_table :question_types do |t|
      t.string  :name,                null: false

      t.timestamps
    end

    create_table :question_groups do |t|
      t.string  :title
      t.text    :description,         null: false
      t.integer :survey_id,           null: false
      t.integer :order

      t.timestamps
    end

    create_table :answer_options do |t|
      t.integer :question_id
      t.integer :question_group_id
      t.string  :text,                null: false
      t.integer :order

      t.timestamps
    end

    create_table :survey_responses do |t|
      t.integer :respondent_id,       null: false
      t.integer :survey_id,           null: false

      t.timestamps
    end

    create_table :answers do |t|
      t.integer :question_id,         null: false
      t.integer :survey_response_id,  null: false
      t.text    :response,            null: false

      t.timestamps
    end
  end
end
