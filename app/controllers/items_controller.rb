class ItemsController < ApplicationController
  before_action :set_inventory
  before_action :set_inventory_item, only: [:show, :update, :destroy]

  def index
    json_response(@inventory.items)
  end

  def show
    json_response(@items)
  end

  def create
    json_response(@inventory.items.create!(item_params), :created)
  end

  def update
    json_response(@item.update(item_params))
    head :no_content
  end

  def destroy
    json_response(@item.destroy)
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :description, :wielder, :level)
  end

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def set_inventory_item
    @item = @inventory.items.find_by!(id: params[:id]) if @inventory
  end
end
