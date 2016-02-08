module Concerns::WordsEq
  def words_eq(first, last)
    first.downcase.strip == last.downcase.strip
  end
end
