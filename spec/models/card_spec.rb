require 'rails_helper'

RSpec.describe Card, type: :model do
  let!(:user) { create :user }
  let(:deck) { create :deck, user: user }

  before :each do
    @card = create(:card, original_text: "House", translated_text: "Дом", review_date: Time.zone.now, user: user, deck: deck)
  end


  describe '#check_answer' do
    context 'when right answer' do
      it {
        expect(@card.check_answer 'HoUsE').to be true
      }

      it 'increment attemp' do
        if @card.check_answer 'HoUsE'
          expect(@card.attempt).to eq 2
        end
      end

      it 'review_date updated from first attempt' do
        if @card.check_answer 'HoUsE'
          expect(@card.review_date.rfc2822).to eq( (Time.zone.now + 12.hour).rfc2822 )
        end
      end


      it 'review_date updated from third attempt' do
        @card.attempt = 3

        if @card.check_answer 'HoUsE'
          expect(@card.review_date.rfc2822).to eq( (Time.zone.now + 7.day).rfc2822 )
        end
      end
    end

    context 'when wrong answer' do
      it {
        expect(@card.check_answer 'wrong').to be false
      }

      it 'review_date reseted' do
        if @card.check_answer 'House'
          expect(@card.review_date.rfc2822).to eq( (Time.zone.now + 12.hour).rfc2822 )
        end
      end
    end
  end
end
