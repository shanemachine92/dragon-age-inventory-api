class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :update, :destroy]
  before_action :authenticate_request!

  def index
    @inventories = Inventory.all
    render :json => @inventories, :status => :ok
  end

  def create
    @inventory = Inventory.create!(inventory_params)
    if @inventory.save!
      render :json => @inventory, :status => :created
    else
     render :status => :unprocessable_entity
    end
  end

  def show
    if @inventory
      render :json => @inventory, :status => :ok
    else
      render :status => :not_found
    end
  end

  def update
    @inventory.update(inventory_params)
    head :no_content
  end

  def destroy
    @inventory.destroy
    head :no_content
  end

  private

  def inventory_params
    params.permit(:title, :created_by)
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end
end
