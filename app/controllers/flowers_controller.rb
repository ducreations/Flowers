class FlowersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flower, only: [:edit, :update, :destroy]

  def index
    @flowers = Flower.all
  end

  def new
    @flower = Flower.new
  end

  def edit
  end

  def update
    if @flower.update(flower_params)
      redirect_to flowers_path, notice: "#{@flower.name}'s info is successfully updated"
    end
  end

  def create
    @flower = Flower.new(flower_params)
    if @flower.save
      redirect_to flowers_path, notice: "#{@flower.name} successfully added"
    else
      render :new
    end
  end

  def destroy
    @flower.destroy
      redirect_to flowers_path, alert: "#{@flower.name} removed from the shop"
  end

  private

  def flower_params
    params.require(:flower).permit(:name, :qty, :price)
  end

  def set_flower
    @flower = Flower.find(params[:id])
  end
end
