class Departamento < ApplicationRecord
  belongs_to :consorcio

  validates :propietario, :identificador, :coeficiente, :consorcio_id, presence: true
  validates :coeficiente, numericality: true
end
