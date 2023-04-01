# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:category) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:detail) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:avatar) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:quantity_in_hand) }
    it { is_expected.to validate_presence_of(:size) }
  end

  describe 'creating products' do
    let(:product) { build(:product) }
    let(:saved_product) { create(:product) }

    context 'success' do
      it 'creates successfully with category' do
        expect(product.save).to be_truthy
      end
      it 'updates successfully with valid params' do
        res = saved_product.update(title: 'half salevee t-shirt', price: 1110)
        expect(res).to be_truthy
      end
    end
    context 'attachment' do
      it 'has attached file' do
        expect(saved_product.avatar.attached?).to be_truthy
      end
      it 'has attached one file' do
        expect(saved_product).to have_one_attached(:avatar)
      end
    end
    context 'slug creation callback' do
      it 'successfully creates slug before save' do
        expect(product.slug).to be_nil
        expect(saved_product.slug).not_to be_nil
      end
      it 'successfully updates slug before save' do
        old_slug = saved_product.slug
        saved_product.title = 'new super honey'
        saved_product.save
        expect(saved_product.slug).not_to eq(old_slug)
      end
    end
  end
end
