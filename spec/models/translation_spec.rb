require 'rails_helper'

RSpec.describe Translation, type: :model do

  describe 'associations' do
    it { should belong_to(:word) }
    it { should belong_to(:translated_word).class_name('Word') }
  end

end
