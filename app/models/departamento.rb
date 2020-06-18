class Departamento < ApplicationRecord
  belongs_to :consorcio
  has_many :facturas

  validates :propietario, :identificador, :coeficiente, :consorcio_id, presence: true
  validates :coeficiente, numericality: true
end
