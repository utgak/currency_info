class CreateCurrency < ActiveRecord::Migration[7.1]
  def change
    create_table :currencies do |t|
      t.string :name, null: false
      t.string :char_code, null: false, index: true
      t.string :cbr_id, null: false, index: true

      t.timestamps
    end
  end
end
