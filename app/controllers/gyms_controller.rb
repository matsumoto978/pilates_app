class GymsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @gyms = Gym.order(id: asc)
  end

  def show
  end

  def new
    @gym = Gym.new
  end

  def create
    gym = Gym.create!(params)
    redirect_to gym, notice: "投稿しました"
  end

  def edit
  end

  def update
    @gym.update!(gym_params)
    redirect_to @gym, notice: "更新しました"
  end

  def destroy
    @gym.destroy!
    redirect_to root_path, alert: "削除しました"
  end

　private

  def set_gym
    @gym = Gym.find(params[:id])
  end
  

  def gym_params
    params.require(:gym).permit(:name, :URL, :TEL, :address, :ward, :img, :user_id)
  end
end
