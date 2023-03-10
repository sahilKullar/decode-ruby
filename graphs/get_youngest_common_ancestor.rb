class AncestralTree
  attr_accessor :name, :ancestor

  def initialize(name)
    self.name = name
    self.ancestor = nil
  end
end

# Time - O(d)
# Space - O(1)
def get_youngest_common_ancestor(top_ancestor, descendant_one, descendant_two)
  depth_one = get_descendant_depth(top_ancestor, descendant_one)
  depth_two = get_descendant_depth(top_ancestor, descendant_two)
  if depth_one > depth_two
    backtrack_ancestral_tree(descendant_one, descendant_two, depth_one - depth_two)
  else
    backtrack_ancestral_tree(descendant_two, descendant_one, depth_two - depth_one)
  end
end

def get_descendant_depth(top_ancestor, descendant)
  depth = 0
  while descendant != top_ancestor
    descendant = descendant.ancestor
    depth += 1
  end
  depth
end

def backtrack_ancestral_tree(lower_descendant, higher_descendant, diff)
  while diff > 0
    lower_descendant = lower_descendant.ancestor
    diff -= 1
  end

  while lower_descendant != higher_descendant
    lower_descendant = lower_descendant.ancestor
    higher_descendant = higher_descendant.ancestor
  end
  lower_descendant
end

class AncestralTrie < AncestralTree
  def initialize(name)
    super(name)
  end

  def add_as_ancestor(descendants)
    descendants.each do |descendant|
      descendant.ancestor = self
    end
  end
end

def get_trees
  trees = {}
  alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
  alphabet.each do |letter|
    trees[letter] = AncestralTrie.new(letter)
  end
  trees
end

trees = get_trees
trees["A"].add_as_ancestor([trees["B"], trees["C"]])
trees["B"].add_as_ancestor([trees["D"], trees["E"]])
trees["D"].add_as_ancestor([trees["H"], trees["I"]])
trees["C"].add_as_ancestor([trees["F"], trees["G"]])

yca = get_youngest_common_ancestor(trees['A'], trees['E'], trees['I'])
p trees['B']
p "*** Should Match ***"
p yca
