require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:card) { create :card, original_text: "House", translated_text: "Дом" }

  describe '#check_answer' do
    context 'when right answer' do
      it {
        expect(card.check_answer 'HoUsE').to be true
      }
    end

    context 'when wrong answer' do
      it {
        expect(card.check_answer 'wrong').to be_nil
      }
    end
  end
end
