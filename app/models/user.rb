class User < ActiveRecord::Base
  validates :username,
            presence: true,
            length: { minimum: 6, maximum: 20 }

  validates :email,
            presence: true,
            format: /\A.+@.+\..+\z/

  validates :age,
            presence: true,
            numericality: { greater_than: 15, only_integer: true }

  validates :city, presence: true

  has_many :products

  accepts_nested_attributes_for :products
end
