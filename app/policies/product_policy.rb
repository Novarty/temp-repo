class ProductPolicy
  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    user&.admin?
  end

  def update?
    user&.admin?
  end

  def delete?
    user&.admin?
  end
end
