require 'rails_helper'

describe Words::RandomWord do
  subject { described_class }
 
  describe '#call' do
    subject { described_class.new.call }

    context 'when word does not have any translation' do
      let!(:word) { FactoryBot.create(:word) }

      it do
        expect(subject).to eq(nil)
      end
    end
    context 'when word has some translation' do
      let!(:word) { FactoryBot.create(:word) }

      before do
        word.translations << FactoryBot.create(:word)
      end

      it do
        expect(subject).to eq(word)
      end
    end
  end
end
