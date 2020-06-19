class AddFechaCobroToGastos < ActiveRecord::Migration[6.0]
  def change
    add_column :gastos, :fecha_cobro, :date
  end
end
