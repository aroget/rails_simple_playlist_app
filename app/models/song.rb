class Song < ApplicationRecord
  belongs_to :artist, dependent: :destroy
  belongs_to :album, dependent: :destroy
  has_and_belongs_to_many :playlists
end
