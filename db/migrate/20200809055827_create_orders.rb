class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :reference
      t.string :purchase_channel
      t.string :client_name
      t.text :address
      t.string :delivery_service
      t.decimal :total_value
      t.jsonb :line_items
      t.integer :status, null: false, default: 0

      t.timestamps
    end
    add_index :orders, :reference, unique: true
    add_reference :orders, :batch, foreign_key: true
  end
end
