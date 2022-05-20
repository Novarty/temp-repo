class OrderMailer < ApplicationMailer
  def new_order_email
    @order = params[:order]

    mail(to: Rails.application.credentials.mailer[:receiver], subject: "У вас новый заказ!")
  end

  def new_order_email_user
    @order = params[:order]

    mail(to: Rails.application.credentials.mailer[:receiver], subject: "Подтверждение оформления заказа")
  end
end
