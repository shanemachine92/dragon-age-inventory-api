class ItemsController < ApplicationController
  before_action :set_inventory
  before_action :set_inventory_item, only: [:show, :update, :destroy]

  def index
    if @inventory
      render :json => @inventory.items, :status => :ok
    else
      render json: {}, :status => :not_found
    end
  end

  def show
    if @items
      render :xml => @items, :status => :ok
    else
      render json: {}, :status => :not_found
    end
  end

  def create
    @item = @inventory.items.new(item_params)
    if @item.save
      render :json => @item, :status => :created
    else
      render json: {}, :status => :unprocessable_entity
    end
  end

  def update
    @item.update(item_params) if @item
    render json: {}, :status => :no_content
  end

  def destroy
    @item.destroy if @item
    render json: {}, :status => :no_content
  end

  private

  def item_params
    params.permit(:name, :description, :wielder, :level)
  end

  def set_inventory
    if @inventory
    @inventory = Inventory.find_by(id: params[:inventory_id])
    else
      render json: {}, :status => :not_found
    end
  end

  def set_inventory_item
    @item = @inventory.items.find_by(inventory_id: params[:id]) if @item
  end
end
