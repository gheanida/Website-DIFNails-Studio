class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.references :booking, null: false, foreign_key: true
      t.string :transaction_type
      t.string :category
      t.text :description
      t.decimal :amount
      t.date :transaction_date

      t.timestamps
    end
  end
end
