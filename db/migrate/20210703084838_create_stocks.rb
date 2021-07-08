class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.decimal :previous_close

      t.timestamps
    end
  end
end
