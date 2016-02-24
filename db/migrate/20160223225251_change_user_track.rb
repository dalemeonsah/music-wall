class ChangeUserTrack < ActiveRecord::Migration
  def change
    drop_table :user_track

    add_reference :tracks, :user, index: true, foreign_key: true
  end
end
