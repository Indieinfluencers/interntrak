class CreateResourceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :resource_types do |t|
      t.references :resource
      t.references :type
    end
  end
end
