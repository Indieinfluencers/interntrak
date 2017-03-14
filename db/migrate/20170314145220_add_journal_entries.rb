class AddJournalEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :journal_entries do |t|
      t.text    :content,   null: false
      t.integer :author_id, null: false
      t.date    :date_for,  null: false
    end
  end
end
