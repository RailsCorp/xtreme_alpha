class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.integer :info_type, default: 0, index: true, null: false

      t.timestamps
    end
  end
end
