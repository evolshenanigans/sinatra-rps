require "sinatra"
require "sinatra/reloader"

def choose_rps
  ["rock", "paper", "scissors"].sample
end

def determine_winner(player_choice, computer_choice)
  outcomes = {
    'rock' => 'scissors',
    'scissors' => 'paper',
    'paper' => 'rock'
  }

  if player_choice == computer_choice
    'We tied!'
  elsif outcomes[player_choice] == computer_choice
    'We won!'
  else
    'We lose!'
  end
end

get("/") do
  "
  <ul>
    <li><a href=\"/rock\">Play Rock</a></li>
    <li><a href=\"/paper\">Play Paper</a></li>
    <li><a href=\"/scissors\">Play Scissors</a></li>
  </ul>
  "
erb(:home)
end


get "/rock" do
  player_choice = 'rock'
  computer_choice = choose_rps
  outcome = determine_winner(player_choice, computer_choice)

  erb :rock, locals: { player_choice: "We played #{player_choice}!", 
                       computer_choice: "They played #{computer_choice}!", 
                       outcome: outcome }
end
get "/paper" do
  player_choice = 'paper'
  computer_choice = choose_rps
  outcome = determine_winner(player_choice, computer_choice)

  erb :paper, locals: { player_choice: "We played #{player_choice}!", 
  computer_choice: "They played #{computer_choice}!", 
  outcome: outcome }
end
get "/scissors" do
  player_choice = 'scissors'
  computer_choice = choose_rps
  outcome = determine_winner(player_choice, computer_choice)

  erb :scissors, locals: { player_choice: "We played #{player_choice}!", 
  computer_choice: "They played #{computer_choice}!", 
  outcome: outcome }
end
