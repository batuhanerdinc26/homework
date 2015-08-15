class AddVatIncludedPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :vat_included_price, :decimal
  end
end
