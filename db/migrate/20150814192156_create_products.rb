class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps null: false
    end
  end
end
