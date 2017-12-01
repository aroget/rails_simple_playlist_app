class Album < ApplicationRecord
  validates :name, presence: true

  has_many :songs, dependent: :destroy
  belongs_to :genre
  belongs_to :artist
end
