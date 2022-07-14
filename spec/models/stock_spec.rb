# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stock, type: :model do
  describe '#available' do
    subject(:available) { described_class.available }

    context 'stock is available.' do
      let(:stock) { create(:stock) }
      it { expect(available).to include(stock) }
    end

    context 'stock has been deleted.' do
      before { create(:stock, :unavailable_stock) }
      it { expect(available).to be_empty }
    end
  end
end
