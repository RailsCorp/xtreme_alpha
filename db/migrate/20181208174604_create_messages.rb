class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :message_type, index: true, default: 0, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.references :team, index: true, foreign_key: true, null: false

      t.timestamps
    end
    add_index :messages, %i[user_id team_id message_type], name: "message_in_teams_index"
  end
end