class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.integer :customer
      t.string :transaction_type
      t.date :date
      t.time :time
      t.integer :amount

      t.timestamps
    end
  end
end
