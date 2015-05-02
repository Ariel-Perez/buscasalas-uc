class HomeController < ApplicationController
  def index
    @blocks = Block.all.order(id: :asc)
    @campuses = Campus.all.order(id: :asc)
  end
end
