class ChangeUserIdToCreatedByIdForTracks < ActiveRecord::Migration
  def change
    rename_column :tracks, :user_id, :created_by_id
  end
end