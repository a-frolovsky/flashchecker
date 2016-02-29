class NotificationMailer < ApplicationMailer
  def pending_cards(user)
    @user = user
    mail to: @user.email, subject: "Карточки на проверку!"
  end
end
