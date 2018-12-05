class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, index: true, null: false
      t.integer :group_type, default: 0, null: false

      t.timestamps
    end
  end
end
