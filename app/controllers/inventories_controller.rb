class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :update, :destroy]

  def index
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    render :json => @inventories = current_user.inventories, :status => :ok
  end

  def create
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    @inventory = current_user.inventories.create!(inventory_params)
    render :json => @inventory, :status => :created
  end

  def show
    render :json => @inventory, :status => :ok
  end

  def update
    render :json => @inventory.update(inventory_params), :status => :ok
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
