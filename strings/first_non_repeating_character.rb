# Time - O(n)
# Space - O(1)

def first_non_repeating_character(string)
  character_count = {}
  string.each_char do |character|
    character_count[character] = 0 unless character_count.key? character
    character_count[character] += 1
  end

  (0...string.length).each do |i|
    return i if character_count[string[i]] == 1
  end
  -1
end

p first_non_repeating_character("abcdcaf")
p first_non_repeating_character("abc")
