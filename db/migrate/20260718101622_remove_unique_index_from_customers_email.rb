class RemoveUniqueIndexFromCustomersEmail < ActiveRecord::Migration[8.1]
  def change
    remove_index :customers, :email
  end
end