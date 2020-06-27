class FacturasController < ApplicationController
  before_action :set_factura, only: [:show, :update, :destroy, :pagar, :imprimir]

  # GET /facturas/1
  # GET /facturas/1.json
  def show
    @departamento = @factura.departamento
    @consorcio = @factura.departamento.consorcio
    @gasto_periodo = Gasto.para_consorcio(@consorcio.id).para_fecha(@factura.periodo.month, @factura.periodo.year).sum(&:importe)
  end

  def imprimir
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
    respond_to do |format|
      if @factura.update(factura_params)
        format.html { redirect_to @factura, notice: 'Factura Actualizada.' }
        format.json { render :show, status: :ok, location: @factura }
      else
        format.html { render :show }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  def pagar
    respond_to do |format|
      if @factura.update(estado: 'Pagada')
        format.html { redirect_to @factura, notice: 'Factura pagada.' }
        format.json { render :show, status: :ok, location: @factura }
      else
        format.html { render :show }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
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
      params.require(:factura).permit(:saldo_anterior, :intereses, :fecha, :importe_abonado, :nro_recibo)
    end
end
