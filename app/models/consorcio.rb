class Consorcio < ActiveRecord::Base

  validates :nombre, :direccion, presence: true
  
end
