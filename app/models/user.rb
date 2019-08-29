class User < ApplicationRecord
  USERNAME_REGEX = /\A[a-z\d\-\_]+\z/i
  validates :username, presence: true, uniqueness: true, format: { with: USERNAME_REGEX }
  has_secure_password
  PASSWORD_REGEX = /\A(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*\W).+\z/
  validates :password, presence: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # User can have many items
  has_many :news, dependent: :destroy
  has_many :comments
end
