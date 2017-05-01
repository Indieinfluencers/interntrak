class TypesController < ApplicationController
  def show
    @type = Type.find(params[:id])
    @resources = @type.resources
  end
end
