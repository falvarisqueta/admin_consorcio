class FacturasController < ApplicationController
  before_action :set_factura, only: [:show, :update, :destroy]

  # GET /facturas/1
  # GET /facturas/1.json
  def show
    @departamento = @factura.departamento
    @consorcio = @factura.departamento.consorcio
    @gasto_periodo = Gasto.para_consorcio(@consorcio.id).para_fecha(@factura.periodo.month, @factura.periodo.year).sum(&:importe)
  end

  # GET /facturas/new
  def new
    @factura = Factura.new
  end


  # PATCH/PUT /facturas/1
  # PATCH/PUT /facturas/1.json
  def update
    if @factura.update(estado: 'Pagado')
      redirect_back(fallback_location: root_path, notice: "Factura Pagada")
    else
      format.html { render :show }
      format.json { render json: @factura.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /facturas/1
  # DELETE /facturas/1.json
  def destroy
    if @factura.destroy
      redirect_back(fallback_location: root_path)
    else
      format.html { render :show }
      format.json { render json: @factura.errors, status: :unprocessable_entity }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factura
      @factura = Factura.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def factura_params
      params.fetch(:factura, {})
    end
end
