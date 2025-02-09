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
    let!(:first_track_list) { create(:track_list, serial: 3) }
    let!(:second_track_list) { create(:track_list, serial: 1) }
    let!(:third_track_list) { create(:track_list, serial: 2) }

    subject { described_class.order_with_serial }

    it { expect(subject).to eq [second_track_list, third_track_list, first_track_list] }
  end

  describe '#up' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:first_track_list) { create(:track_list, user: user, serial: 0) }
    let!(:second_track_list) { create(:track_list, user: user, serial: 1) }

    context 'up the serial of track list' do
      before { second_track_list.serial_up }

      it { expect(first_track_list.reload.serial).to eq 1 }
      it { expect(second_track_list.reload.serial).to eq 0 }
    end
  end

  describe '#down' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:first_track_list) { create(:track_list, user: user, serial: 0) }
    let!(:second_track_list) { create(:track_list, user: user, serial: 1) }

    context 'down the serial of track list' do
      before { first_track_list.serial_down }

      it { expect(first_track_list.reload.serial).to eq 1 }
      it { expect(second_track_list.reload.serial).to eq 0 }
    end
  end
end
