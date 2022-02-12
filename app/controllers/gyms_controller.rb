class GymsController < ApplicationController
  before_action :set_gym, only: %i[show edit update destroy]
  before_action :authenticate_user!, { only: [:new, :create] }
  def index
    @gyms = Gym.all
  end

  def show
  end

  def new
    @gym = Gym.new
  end

  def create
    @gym = current_user.gyms.new(gym_params)
    if @gym.save
      redirect_to gyms_path, notice: "投稿しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
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
