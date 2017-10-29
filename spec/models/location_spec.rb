require 'rails_helper'

describe Location, type: :model do
  describe 'validations' do
    let!(:user) { create :user }
    let(:valid_params) { attributes_for(:location).merge(user: user, name: 'test location', description: 'test drescription', latitude: 123_213.123123, longitude: 123_123.23, image_url: './test_image.jpg') }

    let(:location) { Location.new(location_params) }

    context 'Name is missing' do
      let(:location_params) { valid_params.merge(name: nil) }

      it 'is invalid' do
        expect(location).to be_invalid
        expect(location.errors.keys).to eq %i[name]
      end
    end

    context 'Missing latitude' do
      let(:location_params) { valid_params.merge(latitude: nil) }

      it 'is invalid' do
        expect(location).to be_invalid
        expect(location.errors.keys).to eq %i[latitude]
      end
    end

    context 'Missing longitude' do
      let(:location_params) { valid_params.merge(longitude: nil) }

      it 'is invalid' do
        expect(location).to be_invalid
        expect(location.errors.keys).to eq %i[longitude]
      end
    end

    context 'Missing user' do
      let(:location_params) { valid_params.merge(user: nil) }

      it 'is invalid' do
        expect(location).to be_invalid
        expect(location.errors.keys).to eq %i[user]
      end
    end

    context 'Missing image_path' do
      let(:location_params) { valid_params.merge(image_url: nil) }

      it 'is invalid' do
        expect(location).to be_invalid
        expect(location.errors.keys).to eq %i[image_url]
      end
    end
  end
end
