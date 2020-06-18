class CreateFacturas < ActiveRecord::Migration[6.0]
  def change
    create_table :facturas do |t|
      t.integer :departamento_id
      t.decimal :importe
      t.string :estado
      t.date :periodo
      t.timestamps
    end
  end
end
