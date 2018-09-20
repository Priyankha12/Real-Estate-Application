class ForeignKeyAssocs < ActiveRecord::Migration[5.2]
  def change
    add_reference :realtors, :real_estate_company, index: true
    add_foreign_key :realtors, :real_estate_companies

   add_reference :houses, :real_estate_company, index: true
    add_foreign_key :houses, :real_estate_companies

    add_reference :houses, :realtor, index: true
    add_foreign_key :houses, :realtors

    add_reference :inquiries, :house, index: true
    add_foreign_key :inquiries, :houses

    add_reference :inquiries, :hunter, index: true
    add_foreign_key :inquiries, :hunters

  end
end
