user_1 = User.create(email: 'op@test.com', password: 'password', password_confirmation: 'password')
user_2 = User.create(email: 'op2@test.com', password: 'password', password_confirmation: 'password')

language_1 = Language.create(name: 'English')
language_2 = Language.create(name: 'Spanish')

5.times do
  word = Word.create(content: Faker::Lorem.word, language: language_1, user: user_1)
  translation_1 = Word.create(content: Faker::Lorem.word, language: language_2, user: user_1) 
  translation_2 = Word.create(content: Faker::Lorem.word, language: language_2, user: user_1) 
  word.translations << [translation_1, translation_2]
end

5.times do
  word = Word.create(content: Faker::Lorem.word, language: language_1, user: user_2)
  word = Word.create(content: Faker::Lorem.word, language: language_2, user: user_2)
end
