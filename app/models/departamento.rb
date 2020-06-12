class Departamento < ApplicationRecord
  belongs_to :consorcio

  validates :propietario, :identificador, :coeficiente, presence: true
  validates :coeficiente, numericality: true
end
