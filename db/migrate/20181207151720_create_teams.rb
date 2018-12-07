class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.references :group, index: true, foreign_key: true, null: false
      t.string :name, index: true, null: false
      t.string :introduce

      t.timestamps
    end
  end
end
