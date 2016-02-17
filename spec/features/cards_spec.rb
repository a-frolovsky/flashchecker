require 'rails_helper'

RSpec.feature "Cards", type: :feature do
  let!(:user) { create :user }
  let!(:card) { create :card, original_text: "House", translated_text: "Дом", user: user }

  before :each do
    login('guess@who.me', 'qwerty')
  end

  describe 'card' do
    context 'check answer' do
      it 'right answer' do
        visit root_path
        within('form.simple_form.edit_card') do
          fill_in('answer', :with => 'House')
        end
        click_button 'Проверить'

        expect(page).to have_content('Правильно')
      end

      it 'wrong answer' do
        visit root_path
        within('form.simple_form.edit_card') do
          fill_in('answer', :with => 'Wrong')
        end
        click_button 'Проверить'

        expect(page).to have_content('Не правильно')
      end
    end
  end
end
