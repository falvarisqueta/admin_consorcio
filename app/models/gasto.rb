class Gasto < ApplicationRecord
  belongs_to :consorcio

  validates :descripcion, :fecha, :importe, :tipo, presence: true
  validates :importe, numericality: true

  scope :para_fecha, -> (mes, anio) { where("fecha >= ? AND fecha <= ?", Date.new(anio, mes, 01).beginning_of_month, Date.new(anio, mes, 01).end_of_month).order(:fecha) }
  scope :para_consorcio, -> (consorcio_id) { where(consorcio_id: consorcio_id)}
end
