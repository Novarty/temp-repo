class Product < ApplicationRecord
  belongs_to :user

  before_save :set_current_user

  def set_current_user
    self.user = current_user
  end

end
