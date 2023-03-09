# Time - O(w * n * log(n))
# Space - O(wn)
# where w is the number of words and n is the length of the longest word

def group_anagrams(words)
  anagrams = {}
  words.each do |word|
    sorted_word = word.split("").sort.join
    if anagrams.key? sorted_word
      anagrams[sorted_word] << word
    else
      anagrams[sorted_word] = [word]
    end
  end
  anagrams.values
end

p group_anagrams(%w[yo act flop tac foo cat oy olfp])
