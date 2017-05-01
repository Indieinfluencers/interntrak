class TypesController < ApplicationController
  def show
    @type = Type.find(params[:id]).includes(:resources)
  end
end
