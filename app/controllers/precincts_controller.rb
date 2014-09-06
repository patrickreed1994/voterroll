class PrecinctsController < ApplicationController
  def index
  	@precincts = Precinct.all
  end

  def import
  	Precinct.import(params[:file])
  	redirect_to action: :index, notice: "Segments imported."
  end
end
