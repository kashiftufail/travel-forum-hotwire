# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :service_requests
  has_many :booking
  has_many :tours
  has_many :destinations , through: :tours
  
  has_one :shipping_address, 
    -> { where(addressable_scope: :shipping_address) }, 
    as: :addressable, 
    class_name: 'Address', 
    dependent: :destroy   

  has_one :billing_address, 
    -> { where(addressable_scope: :billing_address) }, 
    as: :addressable, 
    class_name: 'Address', 
    dependent: :destroy   
  
  accepts_nested_attributes_for :profile
  validates :profile, presence: true

  enum :role_type, { customer: 0, admin: 1 }, suffix: true
  enum :member_type, { gold: 0, diamond: 1, platinum: 2 }, suffix: true

  scope :admins, -> { where(role_type: 1) } # for avo

  after_create :send_welcome_email

  delegate :first_name, :last_name, :phone, :address , to: :profile , allow_nil: true #for reports
  
  def with_profile    
    build_profile if profile.nil?

    self
  end

  def full_name
    "#{profile.first_name} #{profile.last_name}"
  end

  def send_welcome_email
    WelcomeEmailJob.perform_in(2.minutes, self.id)
  end  
  
end
