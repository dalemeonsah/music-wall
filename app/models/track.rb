class Track < ActiveRecord::Base

  validates :song_title, presence: true
  validates :author, presence: true
  validates :user_id, presence: true
  belongs_to :user
end