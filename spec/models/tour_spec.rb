# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tour, type: :model do
  
  describe 'associations' do    
    it { is_expected.to belong_to(:user) }
  end
  
  describe "validations" do  
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:detail) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:avatars) }
  end
  
  describe 'creating tour' do
    let(:tour) {build(:tour)}
    let(:saved_tour) {create(:tour)}
      
    context 'success' do      
      it 'creates successfully with user' do        
        expect(saved_tour).to be_truthy          
      end
      it 'updates successfully with valid params' do        
        
        res = saved_tour.update(title: 'another way to go with ruby' , price: 123)                     
        expect(res).to be_truthy          
      end

    end 
    context 'attachment' do
      it 'has attached many files' do
        expect(saved_tour).to have_many_attached(:avatars)  
      end
      it 'has attached files more than 1' do
        expect(saved_tour.avatars.size).to be > 1
      end 
    end
    context 'slug creation callback' do
      it 'successfully creates slug before save' do
        expect(tour.slug).to be_nil 
        expect(saved_tour.slug).not_to be_nil 
      end
      it 'successfully updates slug before save' do
        old_slug = saved_tour.slug        
        saved_tour.title = 'New slug for testing'
        saved_tour.save        
        expect(saved_tour.slug).not_to eq(old_slug) 
      end  
    end     
  end
end
