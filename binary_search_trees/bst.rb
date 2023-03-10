# frozen_string_literal: true

class BST
  attr_accessor :value, :left, :right

  def initialize(value)
    self.value = value
    self.left = nil
    self.right = nil
  end
end
