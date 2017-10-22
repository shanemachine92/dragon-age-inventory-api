module V1
  class ItemsController < ApplicationController
    before_action :set_inventory
    before_action :set_inventory_item, only: [:show, :update, :destroy]

    def index
      if @inventory
        render :json => @inventory.items, :status => :ok
      else
        render :status => :not_found
      end
    end

    def show
      if @item
        render :json => @item, :status => :ok
      else
        render :xml=> {}, :status => :not_found
      end
    end

    def create
      render :json => @inventory.items.create!(item_params), :status => :created if @inventory
    end

    def update
      @item.update(item_params)
      head :no_content
    end

    def destroy
      @item.destroy
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
end
