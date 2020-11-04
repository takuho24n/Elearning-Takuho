class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.text :content
      t.boolean :correct
      t.references :word, foreign_key: true

      t.timestamps
    end
    add_index :choices, [:word_id, :created_at]
  end
end
