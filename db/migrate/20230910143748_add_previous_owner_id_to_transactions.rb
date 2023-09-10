class AddPreviousOwnerIdToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :previous_owner_id, :integer
  end
end
