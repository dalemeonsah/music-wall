class User < ActiveRecord::Base
  has_many :tracks
  has_many :votes

  def has_voted?(track_id)
    self.votes.where(track_id: track_id).exists?
  end
end