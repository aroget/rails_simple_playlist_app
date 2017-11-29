class Genre < ApplicationRecord
  has_many :albums, dependent: :nullify
end
