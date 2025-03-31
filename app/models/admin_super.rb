class AdminSuper < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable
end
