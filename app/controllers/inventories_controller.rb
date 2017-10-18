class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :update, :destroy]
  before_action :authenticate_request!

  def index
    @inventories = Inventory.all
    json_response(@inventories)
  end

  def create
    @inventory = Inventory.create!(inventory_params)
    json_response(@inventory, :created)
  end

  def show
    json_response(@inventory)
  end

  def update
    json_response(@inventory.update(inventory_params))
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
