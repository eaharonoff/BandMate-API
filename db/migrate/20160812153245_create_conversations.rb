class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :user_1_id
      t.integer :user_2_id

      t.timestamps
    end
  end
end
