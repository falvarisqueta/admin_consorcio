class CreateConsorcios < ActiveRecord::Migration[6.0]
  def change
    create_table :consorcios do |t|
      t.string :nombre
      t.string :direccion
      t.timestamps
    end
  end
end
