class LikesController < ApplicationController
  def create
    current_user.likes.create!(gym_id: params[:gym_id])
    @gym = Gym.find(params [:gym_id])
  end

  def destroy
    current_user.likes.find_by(gym_id: params[:gym_id]).destroy!
    @gym = Gym.find(params [:gym_id])
  end
end
