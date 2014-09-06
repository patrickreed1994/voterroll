class SegmentsController < ApplicationController
  def index
  	@segments = Segment.all
  end

  def import
  	Segment.import(params[:file])
  	redirect_to action: :index, notice: "Segments imported."
  end
end
