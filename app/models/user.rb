# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :service_requests
  has_many :booking
  accepts_nested_attributes_for :profile
  validates :profile, presence: true

  enum :role_type, { customer: 0, admin: 1 }, suffix: true
  enum :member_type, { gold: 0, diamond: 1, platinum: 2 }, suffix: true

  scope :admins, -> { where(role_type: 1) } # for avo

  
  def with_profile    
    build_profile if profile.nil?

    self
  end

  def full_name
    "#{profile.first_name} #{profile.last_name}"
  end
  
end
