class AddPreviousCloseToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :previous_close, :decimal
  end
end
