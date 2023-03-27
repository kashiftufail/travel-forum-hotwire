# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'associations' do    
    it { is_expected.to have_one(:profile) }
  end
  
  describe 'validations' do    
    it { is_expected.to validate_presence_of(:profile) }
  end

  describe 'when creating user' do
    
    let(:user) { build(:user) }

    let(:saved_user) { create(:user) }    

    context 'success' do
      it { expect(user).to respond_to :save! }

      it { expect(saved_user).to be_an_instance_of User }

      it { expect(user).to accept_nested_attributes_for(:profile) }

      it 'has a default role type' do
        expect(saved_user.role_type).to eq('customer')
      end

      it 'has a default member type' do
        expect(saved_user.member_type).to eq('gold')
      end

      it 'build profile with user and should not be nil' do        
        expect(saved_user.profile).not_to be_nil        
      end
    end

    context 'failure' do
      it 'has a invalid email' do        
        # duplicate
        user = create(:user)
        expect { create(:user, :email => user.email) }.to raise_error(ActiveRecord::RecordInvalid)
        # bad address
        expect { create(:user, :email => "user@") }.to raise_error(ActiveRecord::RecordInvalid)        
      end      
      it 'has a invalid password' do        
        expect { create(:user, :password => 'a*5', :password_confirmation => 'a*5') }.to raise_error(ActiveRecord::RecordInvalid)        
        expect { create(:user, :password => 'a*6', :password_confirmation => 'g*6') }.to raise_error(ActiveRecord::RecordInvalid)        
      end    
    end
  end
end

