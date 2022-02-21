require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'columns' do
    it { should have_db_column(:name) }
  end
  
  describe 'associations' do
    it { should have_many(:words) }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it do 
      should validate_inclusion_of(:name)
        .in_array(LanguageList::COMMON_LANGUAGES.map(&:name))
    end  
  end
end
