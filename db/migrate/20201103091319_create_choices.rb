class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|

      t.timestamps
    end
  end
end
