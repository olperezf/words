require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:words) }
  end
  
  describe '#secret_email' do
    subject { user.secret_email }
    
    let(:user) { FactoryBot.build_stubbed(:user, email: 'john.test@example.com') } 

    it { is_expected.to eq('john.####@example.com') }
  end

end
