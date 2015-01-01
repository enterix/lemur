class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :age_min, limit: 1
      t.integer :and_max, limit: 1
      t.integer :age, limit: 1
      t.references :user, index: true

      t.timestamps
    end
  end
end
