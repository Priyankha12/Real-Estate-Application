class RemoveIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :houses , column: :real_estate_company_id
    remove_index :houses , column: :realtor_id
    #remove_index :houses , column:  :realtors_id
    remove_index :inquiries , column: :house_id
    remove_index :inquiries , column: :hunter_id
    remove_index :realtors , column: :real_estate_company_id

  end
end
