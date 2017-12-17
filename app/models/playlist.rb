class Playlist < ApplicationRecord
  validates :name, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :tag
  has_and_belongs_to_many :songs

  has_many :likes

  def self.search(search)
    where("name like ?", "%#{search}%")
  end
end
