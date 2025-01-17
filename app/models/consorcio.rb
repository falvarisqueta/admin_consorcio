class Consorcio < ActiveRecord::Base

  has_many :departamentos, dependent: :restrict_with_error
  has_many :gastos, dependent: :restrict_with_error

  validates :nombre, :direccion, presence: true

end
