class AddLikesCountToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :likes_count, :integer
  end
end
