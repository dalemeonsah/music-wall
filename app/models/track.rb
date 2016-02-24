class Track < ActiveRecord::Base
  validates :song_title, presence: true
  validates :author, presence: true

  has_many :votes
  has_many :users, through: :votes
  belongs_to :user
  # , class_name: User

end