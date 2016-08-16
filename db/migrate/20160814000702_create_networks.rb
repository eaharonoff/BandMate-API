class CreateNetworks < ActiveRecord::Migration[5.0]
  def change
    create_table :networks do |t|
      t.integer :friend_id

      t.timestamps
    end
  end
end
