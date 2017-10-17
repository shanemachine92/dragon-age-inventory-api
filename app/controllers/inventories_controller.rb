class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :update, :destroy]

  def index
    render :json => @inventories = Inventory.all
  end

  def create
    render :json => @inventory = Inventory.create!(inventory_params)
  end

  def show
    render :json => @inventory
  end

  def update
    render :json => @inventory.update(inventory_params)
  end

  def destroy
    @inventory.destroy
  end

  private

  def inventory_params
    params.permit(:title, :created_by)
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end
end
