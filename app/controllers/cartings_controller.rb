class CartingsController < ApplicationController
  before_action :set_carting, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #before_action :set_status, only: [:create]
  # GET /cartings
  # GET /cartings.json
  def finalize_purchase
    @cartings = Carting.where(user: current_user, status: "order")
    total_price = 0
    @cartings.each do |carting|
      total_price = total_price + carting.item.price
      carting.status = "purchased"
      carting.save
    end
    @purchase = Purchase.create(:total_price => total_price, :user_id => current_user)
  end



  def index
    @cartings = Carting.where(user: current_user, status: "order")
  end

  # GET /cartings/1
  # GET /cartings/1.json
  def show
  end

  # GET /cartings/new
  def new
    @carting = Carting.new
  end

  # GET /cartings/1/edit
  def edit
  end

  # POST /cartings
  # POST /cartings.json
  def create
    @carting = current_user.cartings.build(:item_id => params[:item_id], :quantity => params[:quantity])
    if @carting.save
      @carting.status = "order"
      flash[:notice] = "Item added to cart."
    else
      flash[:error] = "Unable to add to cart."
    end

    respond_to do |format|
      if @carting.save
        format.html { redirect_to @carting, notice: 'Carting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @carting }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @carting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cartings/1
  # PATCH/PUT /cartings/1.json
  def update
    respond_to do |format|
      if @carting.update(carting_params)

        format.html { redirect_to @carting, notice: 'Carting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @carting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cartings/1
  # DELETE /cartings/1.json
  def destroy
    @carting = Carting.find(params[:id])
    @carting.destroy
    flash[:notice] = "Item removed from cart."
    respond_to do |format|
      format.html { redirect_to cartings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carting
      @carting = Carting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carting_params
      params.require(:carting).permit(:item_id, :user_id, :quantity, :status, :purchase_id)
    end
end
