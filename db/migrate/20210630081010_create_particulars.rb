class CreateParticulars < ActiveRecord::Migration[5.2]
  def change
    create_table :particulars do |t|
      t.string :major_category
      t.string :minor_category

      t.timestamps
    end
  end
end
