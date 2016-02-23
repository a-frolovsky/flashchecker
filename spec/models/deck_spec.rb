require 'rails_helper'

RSpec.describe Deck, type: :model do
  let!(:user) { create :user }
  let(:deck) { create :deck, user: user }

  describe '#deck' do
    it 'current status = false to default' do
      expect(deck.current).to be false
    end

    it 'only one deck is current' do
      create(:deck, title: 'first', user: user)
      create(:deck, title: 'second', user: user)

      user.decks.first.update_attribute(:current, true)
      user.decks.second.update_attribute(:current, true)

      expect(user.decks.first.current).to be false
    end
  end
end
