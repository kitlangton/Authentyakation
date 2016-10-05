class Yaks::ShavingsController < ApplicationController
  def create
    @yak = Yak.find(params[:yak_id])
    @yak.update(hair_length: 0)
    render json: @yak
  end
end
