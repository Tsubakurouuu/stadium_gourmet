class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :store_id, null: false
      t.integer :category_id, null: false
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :without_tax, null: false
      t.boolean :is_active, null: false, default: true
      t.integer :stock, null: false, default: 500
      t.integer :earning, null: false, default: 0

      t.timestamps
    end
  end
end
