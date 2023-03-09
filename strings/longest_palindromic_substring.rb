# Time - O(n ^ 3)
# Space - O(n)

def longest_palindromic_substring(string)
  longest = ""
  (0...string.length).each do |i|
    (i...string.length).each do |j|
      substring = string.slice(i, j + 1)
      if substring.length > longest.length && is_palindrome(substring)
        longest = substring
      end
    end
  end
  longest
end

def is_palindrome(string)
  left_idx = 0
  right_idx = string.length - 1
  while left_idx < right_idx
    return false if string[left_idx] != string[right_idx]
    left_idx += 1
    right_idx -= 1
  end
  true
end

p longest_palindromic_substring("abaxyzzyxf")
