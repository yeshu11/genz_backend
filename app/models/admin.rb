class ::Admin < ApplicationRecord  # 👈 Force Rails to treat this as a model
  has_secure_password

  validates :name, :email, :phone, presence: true
  validates :email, uniqueness: true
end
