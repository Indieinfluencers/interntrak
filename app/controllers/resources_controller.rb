class ResourcesController < ApplicationController
  def index
    @topics = Topic.all
  end
end
