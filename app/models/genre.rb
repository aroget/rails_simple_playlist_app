class Genre < ApplicationRecord
  validates :name, presence: true

  has_many :albums, dependent: :nullify
end
