class CreateTaskGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :task_groups do |t|
      t.references :task, index: true, foreign_key: true, null: false
      t.references :group, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
