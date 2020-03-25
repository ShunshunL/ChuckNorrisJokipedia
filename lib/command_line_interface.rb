# require 'tty-prompt'

# prompt = TTY::PRro

def welcome
  system "clear"
  render_ascii_art
  puts "\n"
  puts "Welcome to Chuck Norris jokipedia!"
  puts "This will spit out random jokes about Chuck Norris.\n\n"
  display_menu
end

def render_ascii_art 
  puts ' ____  _     _     ____  _  __   _      ____  ____  ____  _  ____   '
  puts '/   _\/ \ /|/ \ /\/   _\/ |/ /  / \  /|/  _ \/  __\/  __\/ \/ ___\  '
  puts '|  /  | |_||| | |||  /  |   /   | |\ ||| / \||  \/||  \/|| ||    \  '
  puts '|  \__| | ||| \_/||  \_ |   \   | | \||| \_/||    /|    /| |\___ |  '
  puts '\____/\_/ \|\____/\____/\_|\_\  \_/  \|\____/\_/\_\\\_/\_\\\_/\____/  '
end 
 
def display_menu
  puts "1. Display a random Chuck Norris joke"
  puts "2. View saved jokes"
      #  - If not logged in, prompt the user to create a username first
  puts "3. Select a category of jokes"
      # - user input a category, then api call using that category
      #     get a joke back 
  puts "4. Exit"

  input = gets.chomp

  if input == "1"
    get_and_display_a_random_joke
  elsif input == "2"
      display_saved_jokes
  elsif input == "3"
    select_category
  elsif input == "4"
    exit
  else 
    puts "Please enter a valid menu option."
    display_menu
  end
end

def select_category 
  puts 'Please enter a category: '
  category = gets.chomp
  new_joke = get_joke_from_category(category)
  puts 'Do you want joke to be saved? y/n'
  input = gets.chomp
  if input == 'y'
    puts 'Please enter your username: '
    user_name = gets.chomp
    save_joke_to_user(new_joke, user_name)
    puts 'Do you want another joke?'
    entered = gets.chomp 
    entered == 'y' ? select_category : display_menu
  else 
    display_menu
  end
end 

def display_saved_jokes
  puts 'Please enter your username: '
  user_name = gets.chomp 
  user = User.find_or_create_by(name: user_name)
  user.logged_in = true
  puts 'These are your saved jokes:'
  puts user.saved_jokes.map.with_index(1){|joke, index| index.to_s + '. ' + joke["jokes_saved"]}
end 

def get_and_display_a_random_joke
  new_joke = get_joke
  puts 'Do you want joke to be saved? y/n'
  input = gets.chomp
  if input == 'y'
    puts 'Please enter your username: '
    user_name = gets.chomp
    save_joke_to_user(new_joke, user_name)
    puts 'Do you want another joke?'
    entered = gets.chomp 
    entered == 'y' ? get_and_display_a_random_joke : display_menu
  else 
    display_menu
  end
end

