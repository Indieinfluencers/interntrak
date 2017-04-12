class TypesController < ApplicationController

  def show
    @type = Type.all.includes(:id)
  end
end
