# frozen_string_literal: true

# User model
class User < ApplicationRecord
  petergate(roles: %i[site_admin], multiple: false)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :name
  has_many :comments, dependent: :destroy
  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end
end
