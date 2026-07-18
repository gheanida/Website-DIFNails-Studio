class CreateServices < ActiveRecord::Migration[8.1]
  def change
    create_table :services do |t|
      t.references :service_category, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image_url
      t.boolean :is_active

      t.timestamps
    end
  end
end
