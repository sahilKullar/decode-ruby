# time = O(log(n))
# space = O(1)

def binary_search(array, target)
  binary_search_helper(array, 0 , array.length - 1, target)
end

def binary_search_helper(array, left, right, target)
  while left <= right
    middle = ((left + right) / 2).floor
    potential_match = array[middle]
    if potential_match == target
      return middle
    elsif potential_match < target
      left = middle + 1
    else
      right = middle - 1
    end
  end
end

p binary_search([0, 1, 21, 33, 45, 45, 61, 71, 72, 73], 33)