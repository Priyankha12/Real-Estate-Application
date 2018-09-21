class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.integer :real_estate_company_id
      t.string :location
      t.integer :square_footage
      t.date :year
      t.string :style
      t.float :price
      t.integer :floors
      t.boolean :basement
      t.string :current_owner
      t.integer :realtor_id
      t.string :hunter_ids

      t.timestamps
    end
  end
end
