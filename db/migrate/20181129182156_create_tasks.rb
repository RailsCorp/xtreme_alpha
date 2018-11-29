class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, index: true, null: false
      t.text :content
      t.boolean :is_finished, null: false, default: false
      t.datetime :deadline

      t.timestamps
    end
  end
end
