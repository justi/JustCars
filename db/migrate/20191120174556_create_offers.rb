class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :content
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
