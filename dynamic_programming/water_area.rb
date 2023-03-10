# Time - O(n)
# Space - O(1)

def water_area(heights)
  return 0 if heights.length == 0
  left_idx = 0
  right_idx = heights.length - 1
  surface_area = 0
  left_max = heights[left_idx]
  right_max = heights[right_idx]
  while left_idx < right_idx
    if heights[left_idx] < heights[right_idx]
      left_idx += 1
      left_max = [left_max, heights[left_idx]].max
      surface_area += left_max - heights[left_idx]
    else
      right_idx -= 1
      right_max = [right_max, heights[right_idx]].max
      surface_area += right_max - heights[right_idx]
    end
  end
  surface_area
end

p water_area([0, 8, 0, 0, 5, 0, 0, 10, 0, 0, 1, 1, 0, 3])
