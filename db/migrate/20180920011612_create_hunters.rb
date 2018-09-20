class CreateHunters < ActiveRecord::Migration[5.2]
  def change
    create_table :hunters do |t|
      t.string :email
      t.string :password
      t.string :full_name
      t.string :phone
      t.string :contact_method

      t.timestamps
    end
  end
end
