class User < ApplicationRecord
  has_many :track_lists

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  before_create :encrypt_password

  def self.login(params)
    return if params.nil?

    if params[:email] && params[:password]
      user = find_by(email: params[:email])

      user if user && params[:password] == EncryptionService.decrypt(user.password)
    end
  end

  def encrypt_password
    self.password = EncryptionService.encrypt(password)
  end
end
