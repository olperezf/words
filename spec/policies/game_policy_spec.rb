require 'rails_helper'

describe GamePolicy do
  subject { described_class }

  permissions :show? do
    context 'when games does not belongs to user' do
      let(:game){ FactoryBot.build_stubbed(:game) }
      let(:user){ FactoryBot.build_stubbed(:user) }
      
      it 'denies access' do
        expect(subject).not_to permit(user, game)
      end
    end
    
    context 'when games belongs to user' do
      let(:game){ FactoryBot.build_stubbed(:game, user: user) }
      let(:user){ FactoryBot.build_stubbed(:user) }
      
      it 'grants access' do
        expect(subject).to permit(user, game)
      end
    end
  end
end
