class RenameCustomerToCustomerIdInTransactions < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :customer, :customer_id
  end
end
