class User < ApplicationRecord
  has_secure_password

  has_one :profile, dependent: :destroy

  has_many :playlists, dependent: :destroy

  has_many :likes

  before_save { self.email = email.downcase }

  validates :first_name, presence: true, length: { maximum: 50 }

  validates :last_name, presence: true, length: { maximum: 50 }

  validates :user_name, presence: true, length: { maximum: 50 },
            uniqueness: { case_sensitive: false }

            VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 3 }

end
