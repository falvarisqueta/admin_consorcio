class GastosController < ApplicationController
  before_action :set_gasto, only: [:show, :update, :destroy]

  # GET /gastos
  # GET /gastos.json
  def index
    @mes = params[:mes].present? ? params[:mes].to_i : Date.today.month
    @anio = params[:anio] ? params[:anio].to_i : Date.today.year
    @consorcio = Consorcio.find(params[:consorcio_id])
    @gastos = Gasto.para_consorcio(params[:consorcio_id]).para_fecha(@mes, @anio)
  end

  # GET /gastos/1
  # GET /gastos/1.json
  def show
  end

  # GET /gastos/new
  def new
    @gasto = Gasto.new
    @gasto.consorcio_id = params[:consorcio_id]
  end

  # GET /gastos/1/edit
  def edit
  end

  # POST /gastos
  # POST /gastos.json
  def create
    @gasto = Gasto.new(gasto_params)

    respond_to do |format|
      if @gasto.save
        format.html { redirect_to @gasto, notice: 'Gasto was successfully created.' }
        format.json { render :show, status: :created, location: @gasto }
      else
        format.html { render :new }
        format.json { render json: @gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gastos/1
  # PATCH/PUT /gastos/1.json
  def update
    respond_to do |format|
      if @gasto.update(gasto_params)
        format.html { redirect_to @gasto, notice: 'Gasto was successfully updated.' }
        format.json { render :show, status: :ok, location: @gasto }
      else
        format.html { render :show }
        format.json { render json: @gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gastos/1
  # DELETE /gastos/1.json
  def destroy
    @gasto.destroy
    respond_to do |format|
      format.html { redirect_to consorcios_path, notice: 'Gasto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gasto
      @gasto = Gasto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gasto_params
      #params.fetch(:gasto, {})
      params.require(:gasto).permit(:tipo, :fecha, :importe, :descripcion, :consorcio_id)
    end
end
