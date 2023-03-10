# frozen_string_literal: true
class BinaryTree
  attr_accessor :value, :left, :right, :parent

  def initialize(value)
    self.value = value
    self.left = nil
    self.right = nil
    self.parent = nil
  end

  def insert(values, i = 0)
    return if i >= values.length
    queue = [self]
    while queue.length > 0
      current = queue.shift
      if current.left == nil
        current.left = BinaryTree.new(values[i])
        break
      end
      queue << current.left
      if current.right == nil
        current.right = BinaryTree.new(values[i])
        break
      end
      queue << current.right
    end
    self.insert(values, i + 1)
    self
  end

  def inverted_insert(values, i = 0)
    return if i >= values.length
    queue = [self]
    while queue.length > 0
      current = queue.shift
      if current.right == nil
        current.right = BinaryTree.new(values[i])
        break
      end
      queue << current.right
      if current.left == nil
        current.left = BinaryTree.new(values[i])
        break
      end
      queue << current.left
    end
    self.inverted_insert(values, i + 1)
    self
  end
end
