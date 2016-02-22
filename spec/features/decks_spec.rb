require 'rails_helper'

RSpec.feature "Decks", type: :feature do
  let!(:user) { create :user }

  describe '#deck' do
    it 'create new' do
      login('guess@who.me', 'qwerty')
      visit new_deck_path

      within('form.simple_form.new_deck') do
        fill_in('deck_title', :with => 'First deck')
      end
      click_button 'Create Deck'

      expect(page).to have_content('Колода создана')
    end
  end
end
