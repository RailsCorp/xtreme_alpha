class CreateInfoGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :info_groups do |t|
      t.references :group, index: true, foreign_key: true, null: false
      t.references :information, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
