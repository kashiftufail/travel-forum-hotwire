require 'rails_helper'

RSpec.describe User, type: :model do  
  
  describe '#when creating user' do 
    
    let(:user)  { build(:user) }
    
    let(:saved_user) { create(:user) }

    let(:profile_count) { Profile.count }

    context "success" do
      
      it { expect(user).to respond_to :save!}

      it { expect(saved_user).to be_an_instance_of User}
      
      
      it 'has a default role type' do        
        expect(saved_user.role_type).to eq("customer")        
      end
          
      it 'has a default member type' do        
        expect(saved_user.member_type).to eq("gold")
      end
    
      it 'accepts nested attributes for profile' do   
        
      end

    end

    context "failure" do
      
    
    end   
  end

  describe 'validations' do 
  end  

end  
  
  



