class ResetAllGymCacheCounters < ActiveRecord::Migration[6.1]
  def up
    Gym.find_each { |gym| Gym.reset_counters(gym.id, :likes_count) }
  end

  def down
  end
end
