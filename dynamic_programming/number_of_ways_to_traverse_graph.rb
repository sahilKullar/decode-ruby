# Time - O(2^(n + m))
# Space - O(n + m)
# def number_of_ways_to_traverse_graph(width, height)
#   return 1 if width == 1 || height == 1
#   number_of_ways_to_traverse_graph(height - 1, width) + number_of_ways_to_traverse_graph(height, width - 1)
# end

# Time - O(n * m)
# Space - O(n * m)
def number_of_ways_to_traverse_graph(width, height)
  no_of_ways = []
  (0...height + 1).each do |i|
    no_of_ways << []
    (0...width + 1).each do |j|
      no_of_ways[i] << 0
    end
  end

  (1...width + 1).each do |width_idx|
    (1...height + 1).each do |height_idx|
      if width_idx == 1 || height_idx == 1
        no_of_ways[height_idx][width_idx] = 1
      else
        no_of_ways[height_idx][width_idx] = no_of_ways[height_idx - 1][width_idx] + no_of_ways[height_idx][width_idx - 1]
      end
    end
  end
  no_of_ways[height][width]
end

p number_of_ways_to_traverse_graph(4, 3)
