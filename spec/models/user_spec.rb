require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:words) }
    it { should have_many(:games) }
  end
  
  describe '#secret_email' do
    subject { user.secret_email }
    
    let(:user) { FactoryBot.build_stubbed(:user, email: 'john.test@example.com') } 

    it { should eq('john.####@example.com') }
  end

end
