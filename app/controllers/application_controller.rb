class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  def user_not_authorized
    redirect_to new_user_session_path, alert: "Данное действие доступно только для авторизованных пользователей."
  end
end
