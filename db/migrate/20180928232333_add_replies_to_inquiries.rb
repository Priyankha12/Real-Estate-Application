class AddRepliesToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :replies, :text
  end
end
