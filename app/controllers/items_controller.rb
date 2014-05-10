class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  #after_action  :add_to_category, only: [:category]
  # GET /items
  # GET /items.json

  def index
    if params[:search]
      @items = Item.tagged_with(params[:search])
      @items ||= Item.find_by_title(params[:search])
      @page_title = params[:search]

    elsif params[:category]
      @category = Category.where(:name => params[:category]).first
      @items = @category.items.order("created_at DESC").paginate(:per_page => 12, :page => params[:page])
      @page_title = params[:category]
    else
      @items = Item.all.limit(6).order("items.created_at DESC")
      @page_title = "محصولات"
    end
  end

  def favorite
    Favorite.create(:user => current_user, :item => @item)
  end

  def home
    @items = @items = Item.all.limit(6).order("items.created_at DESC")#.paginate(:per_page => 6, :page => params[:page])
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.limit(4).order("comments.created_at DESC")

    #fresh_when(@item)
  end

  # GET /items/new
  def new
    @item = Item.new
    5.times { @item.photos.build }
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.seller_id = current_user.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  def add_to_category
    @category = Category.find(@item.category_id)
    Category << @category
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:title, :price, :category_id, :user, :tag_list,
                                 :photos_attributes => [:_photo])
  end


end
