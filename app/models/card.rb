class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true

  before_validation :original_not_equal_translated

  private
  def original_not_equal_translated
    return false if original_text.downcase == translated_text.downcase
  end
end
