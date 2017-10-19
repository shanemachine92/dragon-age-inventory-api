module V2
  class InventoriesController < ApplicationController
    def index
      render :json => {message: 'This is me testing versioning!'}
    end
  end
end
