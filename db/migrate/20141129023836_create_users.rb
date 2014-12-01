class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick
      t.string :pass
      t.string :email
      t.date :birth
      t.integer :lang, limit: 1

      t.timestamps
    end
  end
end
