class ResourcesController < ApplicationController

  def show
  end

  def index
    @resource = Resource.all
  end
end
