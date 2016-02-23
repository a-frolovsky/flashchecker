require 'rails_helper'

RSpec.describe Card, type: :model do
  let!(:user) { create :user }
  let(:deck) { create :deck, user: user }
  let(:card) { create :card, original_text: "House", translated_text: "Дом", review_date: Time.now, user: user, deck: deck }

  describe '#check_answer' do
    context 'when right answer' do
      it {
        expect(card.check_answer 'HoUsE').to be true
      }

      it 'review_date updated' do
        if card.check_answer 'HoUsE'
          expect(card.review_date.to_s).to eq((Time.now + 3.day).strftime("%Y-%m-%d"))
        end
      end
    end

    context 'when wrong answer' do
      it {
        expect(card.check_answer 'wrong').to be_nil
      }
    end
  end
end
