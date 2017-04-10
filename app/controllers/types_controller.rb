class TypesController < ApplicationController

  def show
    @type = Type.find(params[:id])
  end

  def index
  end
end
