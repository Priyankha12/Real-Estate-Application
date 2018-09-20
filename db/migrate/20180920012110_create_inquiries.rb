class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.integer :hunter_id
      t.integer :house_id
      t.string :subject
      t.text :message


      t.timestamps
    end
  end
end
