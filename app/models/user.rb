class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  has_many :cards
  has_many :decks

  validates :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 3 }

  accepts_nested_attributes_for :authentications
end
