# frozen_string_literal: true

class BST
  attr_accessor :value, :left, :right

  def initialize(value)
    self.value = value
    self.left = nil
    self.right = nil
  end

  # Time - O(log(n)) -> Average, O(n) -> Worst
  # Space - O(1) -> Average, O(n) -> Worst
  def insert(value)
    current_node = self
    while true
      if value < current_node.value
        if current_node.left == nil
          current_node.left = BST.new(value)
          break
        else
          current_node = current_node.left
        end
      else
        if current_node.right == nil
          current_node.right = BST.new(value)
          break
        else
          current_node = current_node.right
        end
      end
    end
    self
  end

  # Time - O(log(n)) -> Average, O(n) -> Worst
  # Space - O(1) -> Average, O(n) -> Worst
  def contains(value)
    current_node = self
    while current_node != nil
      if value < current_node.value
        current_node = current_node.left
      elsif value > current_node.value
        current_node = current_node.right
      else
        return true
      end
    end
    false
  end

  # Time - O(log(n)) -> Average, O(n) -> Worst
  # Space - O(1) -> Average, O(n) -> Worst
  def remove(value, parent_node = nil)
    current_node = self
    while current_node != nil
      if value < current_node.value
        parent_node = current_node
        current_node = current_node.left
      elsif value > current_node.value
        parent_node = current_node
        current_node = current_node.right
      else
        if current_node.left != nil && current_node.right != nil
          current_node.value = current_node.right.get_min_value
          current_node.right.remove(current_node.value, current_node)
        elsif parent_node == nil
          if current_node.left != nil
            current_node.value = current_node.left.value
            current_node.right = current_node.left.right
            current_node.left = current_node.left.left
          elsif current_node.right != nil
            current_node.value = current_node.right.value
            current_node.left = current_node.right.left
            current_node.right = current_node.right.right
          else
            # this is a single node tree do nothing
          end
        elsif parent_node.left == current_node
          parent_node.left = current_node.left != nil ? current_node.left : current_node.right
        elsif parent_node.right == current_node
          parent_node.right = current_node.right != nil ? current_node.right : current_node.left
        end
        break
      end
    end
    self
  end

  def get_min_value
    current_node = self
    while current_node.left != nil
      current_node = current_node.left
    end
    current_node.value
  end
end

root = BST.new(10)
root.left = BST.new(5)
root.left.left = BST.new(2)
root.left.left.left = BST.new(1)
root.left.right = BST.new(5)
root.right = BST.new(15)
root.right.left = BST.new(13)
root.right.left.right = BST.new(14)
root.right.right = BST.new(22)

p "**** Insert ****"
p root.insert(12)

p "**** Remove ****"
p root.remove(10)

p "**** Contains ****"
p root.contains(10)