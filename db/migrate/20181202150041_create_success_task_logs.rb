class CreateSuccessTaskLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :success_task_logs do |t|
      t.references :task,  index: true, foreign_key: true, null: false
      t.string :title, index: true, null: false
      t.timestamps
    end
  end
end
