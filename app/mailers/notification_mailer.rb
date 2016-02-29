class NotificationMailer < ApplicationMailer
  def pending_cards(user)
    @user = user
    mail from: 'sandbox68fabb31b2e0469b9c4c1cc3f9313366.mailgun.org', to: @user.email, subject: "Карточки на проверку!"
  end
end
