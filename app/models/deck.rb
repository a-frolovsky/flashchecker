class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards

  validates :title, presence: true

  scope :current, -> { where("current = ?", true) }

  before_save :update_current_status

  private
  def update_current_status
    user.decks.update_all(current: false)
  end
end
