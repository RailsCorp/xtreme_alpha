class AddColumnToTask < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :user, foreign_key: true, index: true, null: false
  end
end
