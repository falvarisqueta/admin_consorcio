class AddConsorcioIdToDepartamento < ActiveRecord::Migration[6.0]
  def change
    add_column :departamentos, :consorcio_id, :integer
  end
end
