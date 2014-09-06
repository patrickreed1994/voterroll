class NamesController < ApplicationController
  def index
  	@names = Name.all
  end

  def import
  	Name.import(params[:file])
  	redirect_to action: :index, notice: "Names imported."
  end
end
