require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'columns' do
    it { should have_db_column(:content) }
  end
  
  describe 'nested_attributes' do
    it { should accept_nested_attributes_for(:translations).allow_destroy(true) }
  end
  
  describe 'associations' do
    it { should belong_to(:language) }
    it { should belong_to(:user) }
    it do 
      should have_many(:translations_association)
        .class_name('Translation')
        .dependent(:destroy)
    end  
    it do 
      should have_many(:translations)
        .through(:translations_association)
        .source(:translated_word)
        # .class_name('Translation')
    end
    it do 
      should have_many(:inverse_translations_association)
        .class_name('Translation')
        .with_foreign_key('translated_word_id')
        .dependent(:destroy)
    end  
    it do 
      should have_many(:inverse_translations)
        .through(:inverse_translations_association)
        .source(:word)
        # .class_name('Translation')
    end
  end
  
  describe 'validations' do
    it { should validate_presence_of(:content) }

    describe 'translations_cannot_be_in_the_same_language_as_word' do
      let(:language_1) { FactoryBot.create(:language) }
      let(:word_1) { FactoryBot.build(:word, language: language_1) }


      context 'when translations is in the same language' do
        let(:word_2) { FactoryBot.build(:word, language: language_1) }
        before do
          word_1.translations = [word_2]
        end
        it do
          expect(word_1).to be_invalid
        end
      end

      context 'when translations is NOT in the same language' do
        let(:language_2) { FactoryBot.create(:language, :spanish) }
        let(:word_2) { FactoryBot.build(:word, language: language_2) }
        before do
          word_1.translations = [word_2]
        end
        it do
          expect(word_1).to be_valid
        end
      end

    end

  end
end
