class RemovePostImageIdFromFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :post_image_id, :integer
    remove_column :favorites, :PostImageId, :integer
  end
end
