class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :reference, null: false
      t.string :purchase_channel, null: false
      t.string :client_name, null: false
      t.text :address, null: false
      t.string :delivery_service, null: false
      t.decimal :total_value, null: false
      t.jsonb :line_items, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
    add_index :orders, :reference, unique: true
    add_reference :orders, :batch, foreign_key: true
  end
end
