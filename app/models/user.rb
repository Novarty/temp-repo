class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :admin]

  has_many :products
  has_many :orders

  def full_name
    [last_name, middle_name, first_name].compact.join(' ').chomp
  end
end
