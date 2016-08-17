class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :zip
      t.string :name
      t.string :age
      t.string :bio
      t.string :soundcloud

      t.timestamps
    end
  end
end
