class CreateInfoUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :info_users do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :information, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
