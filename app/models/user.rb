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

  # For cron/mailer
  def self.pending_cards
    User.joins(:cards).where('cards.review_date <= ?', Time.zone.now).each do |user|
      NotificationMailer.pending_cards(user).deliver_now
    end
  end
end
