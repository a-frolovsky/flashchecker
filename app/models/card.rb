class Card < ActiveRecord::Base
  include Concerns::WordsEq

  validates :original_text, :translated_text, :review_date, presence: true
  before_validation :original_equal_translated

  scope :random, -> { order("RANDOM()").limit(1) }
  scope :revision, -> { where("review_date <= ?", Time.now) }

  def check_answer(answer)
    if words_eq(self.original_text, answer)
      update_review_date
    end
  end

  private
  def original_equal_translated
    if words_eq(original_text, translated_text)
      errors.add(:translated_text, "translated text needs not be equal to original text")
    end
  end

  def update_review_date
    update_attribute(:review_date, Time.now + 3.day)
  end
end
