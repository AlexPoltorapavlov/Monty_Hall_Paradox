# frozen_string_literal: true

def monty_hall_simulation(num_trials)
  wins_switching = simulate_trials(num_trials, :switch)
  wins_staying = simulate_trials(num_trials, :stay)

  {
    wins_switching: wins_switching,
    wins_staying: wins_staying,
    total_trials: num_trials
  }
end

def simulate_trials(num_trials, strategy)
  wins = 0
  num_trials.times do
    wins += 1 if play_game(strategy)
  end
  wins
end

def play_game(strategy)
  car_door = rand(3)
  chosen_door = rand(3)

  revealed_door = (0..2).reject { |door| door == car_door || door == chosen_door }.sample

  chosen_door = (0..2).reject { |door| door == chosen_door || door == revealed_door }.first if strategy == :switch

  chosen_door == car_door
end

# Запускаем симуляцию
results = monty_hall_simulation(100_000)

puts "Wins switching: #{results[:wins_switching]}"
puts "Wins staying: #{results[:wins_staying]}"
puts "Total trials: #{results[:total_trials]}"
puts "Win percentage switching: #{results[:wins_switching].to_f / results[:total_trials] * 100}%"
puts "Win percentage staying: #{results[:wins_staying].to_f / results[:total_trials] * 100}%"
