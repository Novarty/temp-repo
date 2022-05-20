class CardsController < ApplicationController
  def show
    @order = current_order
    @order_items = current_order.order_items
  end

  def submit
    order = current_order
    order.comment = card_params[:comment].presence
    order.status = :claimed
    if order.save
      flash[:notice] = 'Заказ был успешно сформирован!'
      session.delete(:order_id)

      OrderMailer.with(order: order).new_order_email.deliver_now
      OrderMailer.with(order: order).new_order_email_user.deliver_now
      redirect_to root_path
    else
      flash[:alert] = "Произошла ошибка. Попробуйте позднее."
      redirect_to card_path
    end
  end

  private

  def card_params
    params.require(:order).permit(:comment)
  end
end
