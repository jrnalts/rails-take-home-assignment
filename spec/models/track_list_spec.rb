require 'rails_helper'

RSpec.describe TrackList, type: :model do
  describe '#create' do
    context 'create track list is valid' do
      let(:track_list) { build(:track_list) }
      it { expect(track_list).to be_valid }
    end

    context 'create track list is not valid' do
      let(:invalid_track_list) { build(:track_list, title: nil) }
      it { expect(invalid_track_list).to be_invalid }
    end
  end

  describe 'user track lists order with serial' do
    let!(:first) { create(:track_list, serial: 3) }
    let!(:second) { create(:track_list, serial: 1) }
    let!(:third) { create(:track_list, serial: 2) }

    subject { described_class.order_with_serial }

    it { expect(subject).to eq [second, third, first] }
  end
end
