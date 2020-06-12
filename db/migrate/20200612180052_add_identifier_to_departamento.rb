class AddIdentifierToDepartamento < ActiveRecord::Migration[6.0]
  def change
    add_column :departamentos, :identificador, :string
  end
end
