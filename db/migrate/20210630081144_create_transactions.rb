class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.date :t_date
      t.string :description
      t.bigint :amount
      t.references :user, foreign_key: true
      t.references :particular, foreign_key: true

      t.timestamps
    end
  end
end
