class ResourcesController < ApplicationController

  def show
  end

  def index
    @resources = Resource.all

  end
end
