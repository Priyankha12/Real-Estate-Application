class ForeignKeyAssocs < ActiveRecord::Migration[5.2]
  def self.up

    change_table :realtors do |t|
      t.references :real_estate_company
    end
    change_table :houses do |t|
      t.references :real_estate_company
    end

    change_table :houses do |t|
      t.references :realtor
    end
    change_table :inquiries do |t|
      t.references :house
    end
    change_table :inquiries do |t|
      t.references :hunter
    end


    #add_reference :realtors, :real_estate_company
    #add_foreign_key :realtors, :real_estate_companies

   #add_reference :houses, :real_estate_company, index: true
    #add_foreign_key :houses, :real_estate_companies

    #add_reference :houses, :realtor, index: true
    #add_foreign_key :houses, :realtors

    #add_reference :inquiries, :house, index: true
    #add_foreign_key :inquiries, :houses

 #   add_reference :inquiries, :hunter, index: true
#    add_foreign_key :inquiries, :hunters

  end
  def self.down
    remove_column :realtors, :real_estate_company_id
    remove_column :houses, :real_estate_company_id
    remove_column :houses, :realtor_id
    remove_column :inquiries, :house_id
    remove_column :inquiries, :hunter_id
  end
end
