def longest_path(s, a)
  max_lengths = Array.new(a.size + 1) { { 'a' => 0, 'b' => 0 } }
  a.size.downto(0) do |i|
    letter = s[i - 1]
    parent = a[i - 1]
    if parent != -1
      max_lengths[parent][letter] = [max_lengths[parent][letter], max_lengths[i - 1].values.max + 1].max
    end
  end
  max_lengths[0].values.max + 1
end

p longest_path("ab", [-1, 0])
p longest_path("abbab", [-1, 0, 0, 0, 2])
p longest_path('abab', [-1, 2, 0, 1])
