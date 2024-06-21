class Membership < ApplicationRecord
  # Associações
  belongs_to :user
  belongs_to :team

  # Validações
  validates :role, inclusion: { in: %w[admin member] }
end
