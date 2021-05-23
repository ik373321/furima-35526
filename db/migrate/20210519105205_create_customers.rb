class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string  :postal_code , null: false 
      t.integer :prefecture_id , null: false
      t.string  :city , null: false
      t.string :block, null: false
      t.string :builing 
      t.string :mobile , null: false
      t.references :record,  foreign_key: true
      t.timestamps
    end
  end
end
