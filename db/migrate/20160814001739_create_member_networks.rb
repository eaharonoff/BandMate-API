class CreateMemberNetworks < ActiveRecord::Migration[5.0]
  def change
    create_table :member_networks do |t|
      t.integer :member_id
      t.integer :network_id

      t.timestamps
    end
  end
end
