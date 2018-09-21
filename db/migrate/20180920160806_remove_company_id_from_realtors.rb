class RemoveCompanyIdFromRealtors < ActiveRecord::Migration[5.2]
  def change
    remove_column :realtors, :real_estate_company_id, :integer
  end
end
