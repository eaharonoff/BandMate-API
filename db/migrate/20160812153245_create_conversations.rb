class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :user1_id
      t.string :user1_name
      t.integer :user2_id
      t.string :user2_name
      t.timestamps
    end
  end
end
