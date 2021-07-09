class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.date :tdate
      t.string :description
      t.bigint :amount
      t.references :category, foreign_key: true
      t.references :subcategory, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
