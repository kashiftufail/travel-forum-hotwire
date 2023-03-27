# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  
  describe 'associations' do    
    it { is_expected.to belong_to(:user) }
  end
  
  describe "validation" do  
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:phone).on(:update) }
    it { is_expected.to validate_presence_of(:address).on(:update) }
  end
  
  describe 'creating profile' do
    let(:profile) {build(:profile)}
    let(:saved_profile) {create(:profile)}
      
    context 'success' do      
      it 'creates successfully with user' do
        expect(saved_profile).to be_truthy          
      end
      it 'updates successfully with valid params' do        
        res = saved_profile.update(first_name: 'Hamza' , last_name: 'joe')                     
        expect(res).to be_truthy          
      end

    end  
  end
end
