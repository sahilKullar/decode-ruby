# Time - O(nlog(n))
# Space - O(n)

def merge_overlapping_intervals(array)
  sorted_intervals = array.sort { |a, b| a[0] - b[0] }
  current_interval = sorted_intervals[0]
  merged_intervals = []
  merged_intervals << current_interval

  sorted_intervals.each do |next_interval|
    _, current_interval_end = current_interval
    next_interval_start, next_interval_end = next_interval

    if current_interval_end >= next_interval_start
      current_interval[1] = [current_interval_end, next_interval_end].max
    else
      current_interval = next_interval
      merged_intervals << current_interval
    end
  end

  merged_intervals
end

intervals = [
  [1, 2],
  [3, 5],
  [4, 7],
  [6, 8],
  [9, 10],
]

p merge_overlapping_intervals(intervals)