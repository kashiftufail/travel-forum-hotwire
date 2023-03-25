# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#when creating user' do
    let(:user) { build(:user) }

    let(:saved_user) { create(:user) }

    let(:profile_count) { Profile.count }

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
        create(:user) do |user|
          user.build_profile(attributes_for(:profile)).save
          expect(user.profile).not_to be_nil
        end
      end
    end

    context 'failure' do
    end
  end

  describe 'validations' do
  end
end

# duplicate
# expect { create(:user, :email => "user@example.com") }.to raise_error

# bad address
# expect { create(:user, :email => "user@") }.to raise_error

# address too long
# expect(build(:user, :email => "a" * 95 + "@example.com")).to_not be_valid
