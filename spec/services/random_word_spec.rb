require 'rails_helper'

describe Words::RandomWord do
  subject { described_class }
 
  describe '#call' do
    subject { described_class.new.call }

    let!(:word) { FactoryBot.create(:word) }

    it do
      expect(subject).to eq(word)
    end
  end
end
