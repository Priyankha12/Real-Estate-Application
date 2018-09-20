class RemoveHunterIdFromInquiries < ActiveRecord::Migration[5.2]
  def change
    remove_column :inquiries, :hunter_id, :integer
  end
end
