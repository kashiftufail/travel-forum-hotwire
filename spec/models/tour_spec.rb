# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tour, type: :model do
  
  describe 'associations' do    
    it { is_expected.to belong_to(:user) }
  end
  
  describe "validation" do  
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:slug) }
    it { is_expected.to validate_presence_of(:detail) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:avatars) }
  end
  
  describe 'creating profile' do
    let(:tour) {build(:tour)}
    let(:saved_tour) {create(:tour)}
      
    context 'success' do      
      it 'creates successfully with user' do
        expect(saved_profile).to be_truthy          
      end
      it 'updates successfully with valid params' do        
        res = saved_profile.update(first_name: 'Hamza' , last_name: 'joe')                     
        expect(res).to be_truthy          
      end

    end 
    context 'attachment' do
      it 'has attached file' do
        expect(saved_profile).to have_one_attached(:avatar)  
      end 
    end   
  end
end
