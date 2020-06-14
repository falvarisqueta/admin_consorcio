class UpdateGastosDescripcionColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :gastos, :decripcion, :descripcion
  end
end
