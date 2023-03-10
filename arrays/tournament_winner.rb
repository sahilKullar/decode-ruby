# Time - O(n) where n is the number of competitions
# Space - O(k) where k is the number of teams
HOME_TEAM_WON = 1

def tournament_winner(competitions, results)
  current_best_team = ""
  scores = { current_best_team => 0 }
  (0...competitions.length).each do |idx|
    result = results[idx]
    home_team, away_team = competitions[idx]
    winning_team = result == HOME_TEAM_WON ? home_team : away_team
    update_scores(winning_team, 3, scores)
    if scores[winning_team] > scores[current_best_team]
      current_best_team = winning_team
    end
  end
  current_best_team
end

def update_scores(winning_team, points, scores)
  scores[winning_team] = 0 unless scores.key? winning_team
  scores[winning_team] += points
end

competitions = [
  %w[HTML C#],
  %w[C# Python],
  %w[Python HTML],
]
results = [0, 0, 1]
#expected = 'Python';
p tournament_winner(competitions, results)