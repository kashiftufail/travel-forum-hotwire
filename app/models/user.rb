class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile  
  validates :profile, :presence => true
  
  enum :role_type, { customer: 0, admin: 1 }, suffix: true
  enum :member_type, { gold: 0, diamond: 1, platinum: 2 }, suffix: true

  def with_profile   
    build_profile if profile.nil?
	  self
  end  

  def full_name
    "#{self.profile.first_name} #{self.profile.last_name}"
  end



end
    