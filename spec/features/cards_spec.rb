require 'rails_helper'

RSpec.feature "Cards", type: :feature do
  let!(:card) { create :card, original_text: "House", translated_text: "Дом", review_date: Time.now }

  describe 'Check card answer' do
    it 'right answer' do
      visit root_path
      within('form.simple_form.edit_card') do
        fill_in('answer', :with => 'House')
      end
      click_button 'Проверить'

      expect(page).to have_content('Правильно')
    end
  end
end
