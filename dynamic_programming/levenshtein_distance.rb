# Time - O(nm)
# Space - O(nm)

def levenshtein_distance(str1, str2)
  edits = []
  (0...str2.length + 1).each do |i|
    row = []
    (0...str1.length + 1).each do |j|
      row << j
    end
    row[0] = i
    edits << row
  end

  (1...str2.length + 1).each do |i|
    (1...str1.length + 1).each do |j|
      edits[i][j] = if str2[i - 1] == str1[j - 1]
        edits[i - 1][j - 1]
      else
        [edits[i - 1][j], edits[i][j - 1], edits[i - 1][j - 1]].min + 1
      end
    end
  end

  edits[str2.length][str1.length]
end

p levenshtein_distance("abc", "yabd")
p levenshtein_distance("abc", "yadb")
p levenshtein_distance("abc", "abc")
