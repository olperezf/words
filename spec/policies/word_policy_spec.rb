require 'rails_helper'

describe WordPolicy do
  subject { described_class }

  permissions :update?, :edit?, :destroy? do
    context 'when words does not belongs to user' do
      let(:word){ FactoryBot.build_stubbed(:word) }
      let(:user){ FactoryBot.build_stubbed(:user) }
      
      it 'denies access' do
        expect(subject).not_to permit(user, word)
      end
    end
    
    context 'when words belongs to user' do
      let(:word){ FactoryBot.build_stubbed(:word, user: user) }
      let(:user){ FactoryBot.build_stubbed(:user) }
      
      it 'grants access' do
        expect(subject).to permit(user, word)
      end
    end
  end
end
