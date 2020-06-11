class ConsorciosController < ApplicationController
  before_action :set_consorcio, only: [:show, :update, :destroy]

  # GET /consorcios
  # GET /consorcios.json
  def index
    @consorcios = Consorcio.all
  end

  # GET /consorcios/1
  # GET /consorcios/1.json
  def show
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
        format.html { redirect_to consorcios_url, notice: 'Consorcio was successfully created.' }
        format.json { head :no_content }
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
        format.html { redirect_to consorcios_url, notice: 'Consorcio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
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
      params.require(:consorcio).permit(:nombre, :direccion)
    end
end