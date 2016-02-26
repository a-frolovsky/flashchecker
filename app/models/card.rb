class Card < ActiveRecord::Base
  mount_uploader :card_image, CardImageUploader

  belongs_to :user
  belongs_to :deck

  validates :original_text, :translated_text, :review_date, :deck_id, presence: true
  before_validation :original_equal_translated
  before_validation :set_review_date, on: [:create]

  scope :random, -> { order("RANDOM()").limit(1) }
  scope :revision, -> { where("review_date <= ?", Time.zone.now) }

  def check_answer(answer)
    words_eq(original_text, answer).tap do |success|
      update_review_date(success ? attempt : 0)
    end
  end

  private
  def original_equal_translated
    if words_eq(original_text, translated_text)
      errors.add(:translated_text, "translated text needs not be equal to original text")
    end
  end

  def update_review_date(attempt)
    review_date = Time.zone.now + add_time(attempt)
    update_attributes(review_date: review_date, attempt: attempt + 1)
  end

  def add_time(attempt)
    case attempt
      when 0..1
        12.hour
      when 2
        3.day
      when 3
        7.day
      when 4
        2.week
      else
        1.month
    end
  end

  def words_eq(first, last)
    first.downcase.strip == last.downcase.strip
  end

  def set_review_date
    self.review_date = Time.zone.now
  end
end
