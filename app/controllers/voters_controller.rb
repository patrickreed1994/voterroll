class VotersController < ApplicationController
  def index
  	@voters = Voter.all
  end

  def generate
  	Voter.generate
  	redirect_to action: :index, notice: "Voters created."
  end
end
