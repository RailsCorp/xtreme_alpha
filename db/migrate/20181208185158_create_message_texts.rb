class CreateMessageTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :message_texts do |t|
      t.references :message, index: true, foreign_key: true, null: false
      t.string :text, null: false

      t.timestamps
    end
  end
end
