module Support
  module Authentication
    def login(email, pass)
      visit login_path

      within('form.simple_form.session') do
        fill_in('session_email', :with => email)
        fill_in('session_password', :with => pass)
        click_button 'Войти'
      end
    end
  end
end
