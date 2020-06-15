class ConsorciosController < ApplicationController
  before_action :set_consorcio, only: [:show, :update, :destroy, :gastos, :liquidacion]

  # GET /consorcios
  # GET /consorcios.json
  def index
    @consorcios = Consorcio.all
  end

  # GET /consorcios/1
  # GET /consorcios/1.json
  def show
    @gastos = Gasto.para_consorcio(@consorcio.id).para_fecha(Date.today.month, Date.today.year)
  end

  def gastos
    @mes = params[:mes].present? ? params[:mes].to_i : Date.today.month
    @anio = params[:anio] ? params[:anio].to_i : Date.today.year
    @gastos = Gasto.para_consorcio(@consorcio.id).para_fecha(@mes, @anio)
  end

  def liquidacion
    @mes = params[:mes].present? ? params[:mes].to_i : Date.today.month
    @anio = params[:anio] ? params[:anio].to_i : Date.today.year
    @gastos_ordinarios = Gasto.para_consorcio(@consorcio.id).ordinario.para_fecha(@mes, @anio)
    @gastos_extraordinarios = Gasto.para_consorcio(@consorcio.id).extraordinario.para_fecha(@mes, @anio)
  end

  # GET /consorcios/new
  def new
    @consorcio = Consorcio.new
  end

  # POST /consorcios
  # POST /consorcios.json
  def create
    @consorcio = Consorcio.new(consorcio_params)

    respond_to do |format|
      if @consorcio.save
        format.html { redirect_to @consorcio, notice: 'Consorcio was successfully created.' }
        format.json { render :show, status: :created, location: @consorcio }
      else
        format.html { render :new }
        format.json { render json: @consorcio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consorcios/1
  # PATCH/PUT /consorcios/1.json
  def update
    respond_to do |format|
      if @consorcio.update(consorcio_params)
        format.html { redirect_to @consorcio, notice: 'Consorcio was successfully updated.' }
        format.json { render :show, status: :ok, location: @consorcio }
      else
        format.html { render :show }
        format.json { render json: @consorcio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consorcios/1
  # DELETE /consorcios/1.json
  def destroy
    @consorcio.destroy
    respond_to do |format|
      format.html { redirect_to consorcios_url, notice: 'Consorcio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consorcio
      @consorcio = Consorcio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consorcio_params
      params.require(:consorcio).permit(:nombre, :direccion, :mes)
    end
end
