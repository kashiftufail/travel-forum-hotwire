# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Destination, type: :model do
  describe 'associations' do    
    it { is_expected.to belong_to(:tour) }
  end
  
  describe "validations" do  
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:detail) }
    it { is_expected.to validate_presence_of(:stay_days) }
    it { is_expected.to validate_presence_of(:avatars) }
  end
  
  describe 'creating destination' do
    let(:destination) {build(:destination)}
    let(:saved_destination) {create(:destination)}
      
    context 'success' do      
      it 'creates successfully with tour' do        
        expect(destination.save).to be_truthy          
      end
      it 'updates successfully with valid params' do                
        res = saved_destination.update(title: 'another bla bla with magic' , stay_days: 120)                     
        expect(res).to be_truthy          
      end
    end 
    context 'attachment' do
      it 'has attached many files' do
        expect(saved_destination).to have_many_attached(:avatars)  
      end
      it 'has attached files more than 1' do        
        expect(saved_destination.avatars.size).to be > 1
      end 
    end
    context 'slug creation callback' do
      it 'successfully creates slug before save' do
        expect(destination.slug).to be_nil 
        expect(saved_destination.slug).not_to be_nil 
      end
      it 'successfully updates slug before save' do
        old_slug = saved_destination.slug        
        saved_destination.title = 'New slug for rspec'
        saved_destination.save        
        expect(saved_destination.slug).not_to eq(old_slug) 
      end  
    end     
  end
end
