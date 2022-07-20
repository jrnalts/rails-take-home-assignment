require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe '#login' do
    let!(:user) { FactoryBot.create(:user) }
    
    context 'success' do
      let!(:params) { {email: 'user1@test.com', password: '123456'} }

      subject(:login) { User.login(params) }

      it { is_expected.to have_attributes(email: user.email) }
      it { is_expected { login.password }.to be_nil }
      it { expect(params[:password]).to eq EncryptionService.decrypt(user.password) }
    end

    context "user not exist" do
      let!(:params) { {email: 'user2@test.com', password: '123456'} }

      subject(:login) { User.login(params) }

      it { is_expected.to be_nil }
    end

    context 'params not passing arguments' do
      let!(:params) { nil }

      subject(:login) { User.login(params) }

      it { is_expected.to be_nil }
    end
  end
end
