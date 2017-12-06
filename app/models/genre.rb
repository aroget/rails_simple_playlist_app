class Genre < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_save { self.name = name.capitalize }

  has_many :albums, dependent: :nullify
end
