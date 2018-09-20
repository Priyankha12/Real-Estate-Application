class RemoveCompanyIdFromHouses < ActiveRecord::Migration[5.2]
  def change
    remove_column :houses, :company_id, :integer
  end
end
