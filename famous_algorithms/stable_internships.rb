# Time - O(n^2)
# Space - O(n^2)
def stable_internships(interns, teams)
  chosen_interns = {}
  free_interns = interns.map { |_, i| i }
  current_intern_choices = Array.new(interns.length, 0)

  teams_map = []
  teams.each do |team|
    rank = {}
    team.each_with_index do |intern_num, i|
      rank[intern_num] = i
    end
    teams_map << rank
  end

  while free_interns.length > 0
    intern_num = free_interns.pop
    intern = interns[intern_num]
    team_preference = intern[current_intern_choices[intern_num]]
    current_intern_choices[intern_num] += 1

    unless chosen_interns.has_key?(team_preference)
      chosen_interns[team_preference] = intern_num
      next
    end

    previous_intern = chosen_interns[team_preference]
    previous_intern_rank = teams_map[team_preference][previous_intern]
    current_intern_rank = teams_map[team_preference][intern_num]

    if current_intern_rank < previous_intern_rank
      free_interns.push(previous_intern)
      chosen_interns[team_preference] = intern_num
    else
      free_interns.push(intern_num)
    end
  end
  chosen_interns.map { |team, inter| [inter, team] }
end

interns = [
  [0, 1, 2],
  [1, 0, 2],
  [1, 2, 0]
]
teams = [
  [2, 1, 0],
  [1, 2, 0],
  [0, 2, 1]
]
# result = [[0, 0], [1, 1], [2, 2]]
p stable_internships(interns, teams)
