class CreateResourceModels < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :title, null: false
      t.text :description
      t.string :physical_location
      t.string :url
      t.integer :author_id

      t.timestamps
    end

    create_table :resource_topics do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end

    create_table :resource_types do |t|
      t.string :title, null: false
      t.string :icon, null: false
      t.string :hover_text, null: false

      t.timestamps
    end
  end
end
