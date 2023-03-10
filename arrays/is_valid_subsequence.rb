# Time = O(n)
# Space = O(1)

def is_valid_subsequence(array, sequence)
  array_idx = 0
  sequence_idx = 0
  while array_idx < array.length && sequence_idx < sequence.length
    sequence_idx += 1 if array[array_idx] == sequence[sequence_idx]
    array_idx += 1
  end
  sequence_idx == sequence.length
end

p is_valid_subsequence([5, 1, 22, 25, 6, -1, 8, 10], [1, 6, -1, 10])