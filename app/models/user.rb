class User < ApplicationRecord
  has_many :track_lists

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  before_create :encrypt_password

  def self.login(*args)
    arg = args.first
    if arg[:email] && arg[:password]
      find_by(
        email: arg[:email],
        password: arg[:password]
      )
    end
  end

  def encrypt_password
    self.password = EncryptionService.encrypt(password)
  end
end
