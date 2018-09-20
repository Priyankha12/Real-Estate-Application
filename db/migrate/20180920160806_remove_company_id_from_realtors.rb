class RemoveCompanyIdFromRealtors < ActiveRecord::Migration[5.2]
  def change
    remove_column :realtors, :company_id, :integer
  end
end
