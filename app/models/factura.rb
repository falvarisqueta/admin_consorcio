class Factura < ApplicationRecord
  belongs_to :departamento

  scope :para_fecha, -> (mes, anio) { where("periodo >= ? AND periodo <= ?", Date.new(anio, mes, 01).beginning_of_month, Date.new(anio, mes, 01).end_of_month).order(:estado) }
  scope :para_consorcio, -> (consorcio_id) { joins(:departamento).where("departamentos.consorcio_id = ?", consorcio_id) }

  def fecha_periodo
    "#{periodo.month} - #{periodo.year}"
  end

  def imprimir?
    importe_abonado.present?
  end

  def pendiente?
    estado == 'Pendiente'
  end
end
