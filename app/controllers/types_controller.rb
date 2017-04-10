class TypesController < ApplicationController

  def show
  end

  def index
    @type = Type.all
  end
end
