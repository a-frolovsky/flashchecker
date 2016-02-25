FactoryGirl.define do
  factory :card do
    original_text "House"
    translated_text "ДоМ"
    review_date Time.zone.now
    # card_image
    # user
    # deck
  end
end
