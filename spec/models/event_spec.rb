require 'rails_helper'

describe Event, type: :model do
  describe 'validations' do
    let(:user) { create :user }
    let(:valid_params) do
      attributes_for(:event).merge(
        user: user,
        name: 'test event',
        location_id: 1,
        start_time: DateTime.now,
        description: 'test drescription',
        image_url: './test_image.jpg'
      )
    end

    let(:event) { Event.new(event_params) }

    context 'when name is not given' do
      let(:event_params) { valid_params.merge(name: nil) }

      it 'is invalid' do
        expect(event).to be_invalid
      end
    end

    context 'When location is not given' do
      let(:event_params) { valid_params.merge(location_id: nil) }

      it 'is invalid' do
        expect(event).to be_invalid
      end
    end

    context 'When start date is nil' do
      let(:event_params) { valid_params.merge(start_time: nil) }

      it 'is invalid' do
        expect(event).to be_invalid
      end
    end
  end
end
