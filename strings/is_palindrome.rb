# Time = O(n)
# Space = O(1)

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

p is_palindrome('abcdcba')