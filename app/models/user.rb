class User < ApplicationRecord
  has_many :track_lists

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  before_create :encrypt_password

  def self.login(*args)
    if args[:email] && args[:password]
      find_by(
        email: args[:email],
        password: EncryptionService.decrypt(args[:password])
      )
    end
  end

  def encrypt_password
    self.password = EncryptionService.encrypt(password)
  end
end
