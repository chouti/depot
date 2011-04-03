class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  
  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader :password
  
  validate :password_must_be_present
  
  private
  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end
end
