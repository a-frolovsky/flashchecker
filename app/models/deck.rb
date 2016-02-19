class Deck < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true

  before_save :update_current_status

  private
  def update_current_status
    user.decks.update_all(current: false)
  end
end
