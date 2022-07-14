# frozen_string_literal: true

class EncryptionService
  delegate :encrypt_and_sign, :decrypt_and_verify, to: :encryptor

  def self.encrypt(value)
    new.encrypt_and_sign(value)
  end

  def self.decrypt(value)
    new.decrypt_and_verify(value)
  end

  private

  def encryptor
    # TODO: Rails.application.secrets.encryptor
    key = "\x89\xC8\xA2&~j>\xED\x8C\xA8#\xD9P\x17a\xEFR\xC7\x8E\xC9\xF9,*\xC3\xDE\x1C\xB6\xE0\x11\xB5}$"
    ActiveSupport::MessageEncryptor.new(key)
  end
end