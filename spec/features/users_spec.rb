require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe '#registration' do
    let(:user) { build :user }

    it 'success' do
      visit new_user_path

      within('form.simple_form.new_user') do
        fill_in('user_email', :with => user.email)
        fill_in('user_password', :with => user.password)
        fill_in('user_password_confirmation', :with => user.password_confirmation)
        click_button 'Create User'
      end

      expect(page).to have_content('User was successfully created')
    end
  end

  describe '#login' do
    let!(:user) { create :user }

    it 'successful' do
      login('guess@who.me', 'qwerty')

      expect(page).to have_content('Login successful')
    end

    it 'failed' do
      login('guess@who.me', 'wrong_password')

      expect(page).to have_content('Login failed')
    end
  end

  describe '#logout' do
    let!(:user) { create :user }

    it 'successful' do
      login('guess@who.me', 'qwerty')

      click_link 'Выход'

      expect(page).to have_content('Logged out!')
    end
  end
end
