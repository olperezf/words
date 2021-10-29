class Word < ApplicationRecord
  belongs_to :language
  belongs_to :user
  
  has_many :translations_association, class_name: 'Translation'
  has_many :translations, through: :translations_association, source: :translated_word
  has_many :inverse_translations_association, class_name: 'Translation', foreign_key: 'translated_word_id'
  has_many :inverse_translations, through: :inverse_translations_association, source: :word
  
  accepts_nested_attributes_for :translations, reject_if: :all_blank, allow_destroy: true 
  validates :content , :language, presence: true

  paginates_per 10
end 
