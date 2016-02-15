class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :cards

  validates :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 3 }
end
