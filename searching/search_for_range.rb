# Time = O(log(n))
# space = O(1)

def search_for_range(array, target)
  final_range = [-1, -1]
  altered_binary_search(array, target, 0, array.length - 1, final_range, true)
  altered_binary_search(array, target, 0, array.length - 1, final_range, false)
  final_range
end

def altered_binary_search(array, target, left, right, final_range, go_left)
  while left <= right
    mid = ((left + right) / 2).floor
    if array[mid] < target
      left = mid + 1
    elsif array[mid] > target
      right = mid - 1
    else
      if go_left
        if mid == 0 || array[mid - 1] != target
          final_range[0] = mid
          return
        else
          right = mid - 1
        end
      else
        if mid == array.length - 1 || array[mid + 1] != target
          final_range[1] = mid
          return
        else
          left = mid + 1
        end
      end
    end
  end
end

p search_for_range([0, 1, 21, 33, 45, 45, 45, 45, 45, 45, 61, 71, 73], 45)