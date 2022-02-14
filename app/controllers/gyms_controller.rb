class GymsController < ApplicationController
  before_action :set_gym, only: %i[edit update destroy]
  before_action :authenticate_user!
  def index
    @gyms = Gym.includes(:user, :likes).order(:created_at)
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

  def show
    @gym = Gym.find(params[:id])
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
  
  def gym_params
    params.require(:gym).permit(:name, :URL, :TEL, :address, :ward, :img, :user_id)
  end
  
  def set_gym
    @gym = current_user.gyms.find(params[:id])
  end
  
end
