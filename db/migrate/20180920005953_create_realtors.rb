class CreateRealtors < ActiveRecord::Migration[5.2]
  def change
    create_table :realtors do |t|
      t.string :email
      t.string :name
      t.string :password
      t.integer :company_id
      t.string :phone

      t.timestamps
    end
  end
end
