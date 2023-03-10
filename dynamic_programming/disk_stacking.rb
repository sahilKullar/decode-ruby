# Time - O(n^2)
# Space - O(n)

def disk_stacking(disks)
  disks.sort! { |a, b| a[2] - b[2] }
  heights = disks.map { |disk| disk[2] }
  sequences = Array.new(disks.length, nil)
  max_height_index = 0

  (1...disks.length).each do |i|
    current_disk = disks[i]
    (0...i).each do |j|
      other_disk = disks[j]
      if are_valid_dimensions?(other_disk, current_disk)
        if heights[i] <= current_disk[2] + heights[j]
          heights[i] = current_disk[2] + heights[j]
          sequences[i] = j
        end
      end
    end
    max_height_index = i if heights[i] >= heights[max_height_index]
  end
  build_sequences(disks, sequences, max_height_index)
end

def are_valid_dimensions?(o, c)
  o[0] < c[0] && o[1] < c[1] && o[2] < c[2]
end

def build_sequences(disks, sequences, current_idx)
  sequence = []
  while current_idx != nil
    sequence.unshift(disks[current_idx])
    current_idx = sequences[current_idx]
  end
  sequence
end

p disk_stacking([[2, 1, 2], [3, 2, 3], [2, 2, 8], [2, 3, 4], [1, 3, 1], [4, 4, 5]])