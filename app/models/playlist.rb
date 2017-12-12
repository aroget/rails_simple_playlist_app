class Playlist < ApplicationRecord
  validates :name, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_and_belongs_to_many :songs

  has_many :likes, through: :playlists_likes
end
