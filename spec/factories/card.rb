FactoryGirl.define do
  factory :card do
    original_text "House"
    translated_text "ДоМ"
    review_date Time.zone.today
    # card_image
    # user_id
    # deck_id
  end
end
