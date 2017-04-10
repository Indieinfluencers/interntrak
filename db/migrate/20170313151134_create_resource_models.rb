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

    create_table :topics do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end

    create_table :types do |t|
      t.string :title, null: false
      t.string :icon
      t.string :hover_text

      t.timestamps
    end

    create_table :resource_topics do |t|
      t.references :resource
      t.references :topic
    end
  end
end
