# Time - O(n^2)
# Space - O(n)

def max_sum_increasing_subsequence(array)
  sequences = Array.new(array.length, nil)
  sums = array.map{ |num| num }
  max_sum_idx = 0
  (0...array.length).each do |i|
    current_num = array[i]
    (0...i).each do |j| # (0).upto(i)
      other_num = array[j]
      if other_num < current_num && current_num + sums[j] >= sums[i]
        sums[i] = current_num + sums[j]
        sequences[i] = j
      end
    end
    max_sum_idx = i if sums[i] >= sums[max_sum_idx]
  end
  [sums[max_sum_idx], build_sequences(array, sequences, max_sum_idx)]
end

def build_sequences(array, sequences, current_idx)
  sequence = []
  while current_idx != nil
    sequence.unshift(array[current_idx])
    current_idx = sequences[current_idx]
  end
  sequence
end

p max_sum_increasing_subsequence([10, 70, 20, 30, 50, 11, 30])
