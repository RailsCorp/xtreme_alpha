class CreateMessageFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :message_files do |t|
      t.references :message, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
