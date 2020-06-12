class CreateDepartamentos < ActiveRecord::Migration[6.0]
  def change
    create_table :departamentos do |t|
      t.string :propietario
      t.string :inquilino
      t.decimal :coeficiente
      t.timestamps
    end
  end
end
