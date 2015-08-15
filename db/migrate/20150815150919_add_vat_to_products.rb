class AddVatToProducts < ActiveRecord::Migration
  def change
    add_column :products, :vat, :decimal
  end
end
