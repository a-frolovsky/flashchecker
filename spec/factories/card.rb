FactoryGirl.define do
  factory :card do
    original_text "House"
    translated_text "ДоМ"
    review_date Time.now
    # card_image
  end
end
