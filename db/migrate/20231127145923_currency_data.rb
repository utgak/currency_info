class CurrencyData < ActiveRecord::Migration[7.1]
  def change
    create_table :currency_data do |t|
      t.decimal :rate, null: false
      t.date :date, null: false, index: true
      t.belongs_to :currency, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
