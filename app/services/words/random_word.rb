module Words
  class RandomWord

    def call
      get_random_word
    end

    private

    def get_random_word
      Word.joins(:translations).order(Arel.sql('RANDOM()')).first
    end
  end
end
