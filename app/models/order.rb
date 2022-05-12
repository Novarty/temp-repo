class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  before_save :set_subtotal
  accepts_nested_attributes_for :order_items, allow_destroy: true

  # unpublished - неоформленный заказ. в корзине пользователя (виден только юзеру в корзине)
  # claimed - сформированный заказ
  # in_progress - заказ в работе
  # done - завершенный заказ
  # rejected - отклоненный заказ
  enum status: [:unpublished, :claimed, :in_progress, :done, :rejected]

  def subtotal
    order_items.collect{ |order_item| order_item.valid? ? order_item.unit_price * order_item.quantity : 0 }.sum
  end

  def amount
    order_items.collect{ |order_item| order_item.valid? ? order_item.quantity : 0 }.sum
  end

  private

  def set_subtotal
    self.subtotal = subtotal
  end
end
