class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :cnic
      t.string :phone_no
      t.integer :shop_keeper

      t.timestamps
    end
  end
end
