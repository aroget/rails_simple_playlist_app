class Artist < ApplicationRecord
  validates :name, presence: true

  has_many :albums, dependent: :destroy
  has_many :songs, dependent: :nullify
  has_many :genres, -> { distinct }, through: :albums, dependent: :nullify
end
