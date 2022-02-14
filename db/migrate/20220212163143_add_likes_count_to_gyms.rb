class AddLikesCountToGyms < ActiveRecord::Migration[6.1]
  def change
    add_column :gyms, :likes_count, :integer, default: 0
  end
end
