class ReCreateUserInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :user_informations do |t|
      t.references :information,  index: true, foreign_key: true, null: false
      t.string :introduce
      t.integer :sex, default: 0
      t.string :phone_number

      t.timestamps
    end
  end
end
