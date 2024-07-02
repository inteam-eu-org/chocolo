# frozen_string_literal: true

# User model with magic link authentication
class User < ApplicationRecord
  devise :magic_link_authenticatable, :rememberable, :registerable,
         :validatable, :timeoutable, :trackable, :confirmable

  validates :username, uniqueness: true
end
