class PinsController < ApplicationController
before_filter :authenticate_user!, except: [:index]

  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  # GET /pins
  def index
    @pins = Pin.all
  end

  # GET /pins/1
  def show
  end

  # GET /pins/new
  def new
    @pin = current_user.pins.new
  end

  # GET /pins/1/edit
  def edit
    @pin = current_user.pins.find(params[:id])
  end

  # POST /pins
  def create
    @pin = current_user.pins.new(pin_params)

    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /pins/1
  def update
    @pin = current_user.pins.find(params[:id])
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /pins/1
  def destroy
    @pin = current_user.pins.find(params[:id])
    @pin.destroy
    redirect_to pins_url, notice: 'Pin was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pin_params
      params.require(:pin).permit(:description)
    end
end
