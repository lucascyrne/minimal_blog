class User < ApplicationRecord
  # Associações
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :posts

  # Adicionar segurança de senha (assumindo que o gem 'bcrypt' está no Gemfile)
  has_secure_password
end
