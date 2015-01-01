class AddNumberToOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.integer :number, limit: 1
    end
  end
end
