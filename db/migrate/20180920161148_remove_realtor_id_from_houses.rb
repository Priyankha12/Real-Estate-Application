class RemoveRealtorIdFromHouses < ActiveRecord::Migration[5.2]
  def change
    remove_column :houses, :realtor_id, :integer
  end
end
