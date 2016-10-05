class YaksController < ApplicationController
  def index
    @yaks = Yak.all
    render json: @yaks
  end

  def update
    @yak = Yak.find(params[:id])
    @yak.update(yak_params)
    render json: @yak
  end

  def create
    Yak.create(
      name: yak_name,
      hair_length: random_number,
      age: random_number
    )
  end

  def destroy
    @yak = Yak.find(params[:id])
    @yak.destroy
  end

  private

  def random_number
    rand(35).floor
  end

  def yak_name
    names = ["Biff", "Kurt", "Bob", "Smith", "Yak", "Doug", "Lumpy"]
    "#{names.sample}-#{names.sample}"
  end

  def yak_params
    params.require(:yak).permit(:name, :hair_length, :age)
  end
end
