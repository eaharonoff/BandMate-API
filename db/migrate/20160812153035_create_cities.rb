class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :lat
      t.integer :lng

      t.timestamps
    end
  end
end
