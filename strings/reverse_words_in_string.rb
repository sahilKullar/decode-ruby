# Time - O(n)
# Space - O(n)

def reverse_words_in_string(string)
  words = []
  start_of_word = 0
  (0...string.length).each do |i|
    if string[i] == " "
      words << string.slice(start_of_word, i)
      start_of_word = i
    elsif string[start_of_word] == " "
      words << " "
      start_of_word = i
    end
  end
  words << string.slice(start_of_word, string.length)
  reverse_list(words)
  words.join
end

def reverse_list(words)
  left_idx = 0
  right_idx = words.length - 1
  while left_idx <= right_idx
    words[left_idx], words[right_idx] = words[right_idx], words[left_idx]
    left_idx += 1
    right_idx -= 1
  end
end

p reverse_words_in_string("Kullar Sahil")
