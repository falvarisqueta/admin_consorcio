class CreateGastos < ActiveRecord::Migration[6.0]
  def change
    create_table :gastos do |t|
      t.date :fecha
      t.string :decripcion
      t.decimal :importe
      t.integer :consorcio_id
      t.string :tipo
      t.timestamps
    end
  end
end
