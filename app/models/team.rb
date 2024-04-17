class Team < ApplicationRecord
  # Associações
  has_many :memberships
  has_many :users, through: :memberships
end
