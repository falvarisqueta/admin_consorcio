class AddInformacionPagoAFactura < ActiveRecord::Migration[6.0]
  def change
    add_column :facturas, :saldo_anterior, :decimal, default: 0
    add_column :facturas, :intereses, :decimal, default: 0
    add_column :facturas, :fecha, :date
    add_column :facturas, :importe_abonado, :decimal
    add_column :facturas, :nro_recibo, :integer
  end
end
