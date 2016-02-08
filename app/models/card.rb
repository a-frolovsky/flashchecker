class Card < ActiveRecord::Base
  validates :original_text, :translated_text, :review_date, presence: true
  before_validation :original_equal_translated

  scope :random, -> { order("RANDOM()").limit(1) }
  scope :revision, -> { where("review_date <= ?", Time.now) }

  private
  def original_equal_translated
    if original_text.downcase == translated_text.downcase
      errors.add(:translated_text, "translated text needs not be equal to original text")
    end
  end
end
