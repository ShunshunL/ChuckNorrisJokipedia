require 'tty-prompt'
require 'pry'

def welcome
  system "clear"
  render_ascii_art
  puts "\n"
  puts "Welcome to Chuck Norris jokipedia!"
  puts "This will spit out random jokes about Chuck Norris.\n\n"
  user = create_new_account_or_login_prompt
  display_menu(user)
end 

def create_new_account_or_login_prompt
  prompt = TTY::Prompt.new(symbols: {marker: '♥'}, active_color: :cyan)
  return_value = prompt.select("Do you want to create a new account or login?\n") do |menu|
    menu.choice 'create new account', 1
    menu.choice 'login', 2
  end 
  if return_value == 1 
    create_new_user_account
  else 
    existing_account_login
  end
end 

def create_new_user_account 
  user_name_input = TTY::Prompt.new
  user_first_name_input = TTY::Prompt.new
  user_password_input = TTY::Prompt.new
  user_name = user_name_input.ask('What would you like your username to be?')
  user = User.find_by(username: user_name)
  if user == nil 
    user_first_name = user_first_name_input.ask("Awesome! What's your first name?")
    heart = user_password_input.decorate('♥')
    user_password = user_password_input.mask("Got it! Now please enter your password: ", mask: heart)
    puts "You're all set up! #{user_first_name}! Your username is #{user_name}."
    user = User.create(first_name: user_first_name, username: user_name, password: user_password)
  else 
    puts "Sorry, that username is taken."
    create_new_user_account
  end 
  user
end 

def existing_account_login 
  user_name_input = TTY::Prompt.new
  password = TTY::Prompt.new
  user_name = user_name_input.ask('Please enter your username: ')
  heart = password.decorate('♥')
  user_password = password.mask("Plese enter your password: ", mask: heart)
  user = User.find_by(username: user_name, password: user_password)
  if user == nil 
    puts "Sorry. No user found with that username and password. Please try again."
    existing_account_login
  else 
    puts "Hello #{user.first_name}! Welcome back!!"
  end 
  user
end 

def render_ascii_art 
  puts ' ____  _     _     ____  _  __   _      ____  ____  ____  _  ____   '
  puts '/   _\/ \ /|/ \ /\/   _\/ |/ /  / \  /|/  _ \/  __\/  __\/ \/ ___\  '
  puts '|  /  | |_||| | |||  /  |   /   | |\ ||| / \||  \/||  \/|| ||    \  '
  puts '|  \__| | ||| \_/||  \_ |   \   | | \||| \_/||    /|    /| |\___ |  '
  puts '\____/\_/ \|\____/\____/\_|\_\  \_/  \|\____/\_/\_\\\_/\_\\\_/\____/  '
end 
 
def display_menu(user)
  prompt = TTY::Prompt.new(symbols: {marker: '♥'} , active_color: :cyan)
  return_value = prompt.select("How do you want to get your jokes for the day?\n") do |menu|
    menu.choice 'Display a random Chuck Norris joke', 1
    menu.choice 'View saved jokes', 2
    menu.choice 'Select a category of jokes', 3
    menu.choice 'Exit', 4
  end 

  if return_value == 1
    get_and_display_a_random_joke(user)
  elsif return_value == 2
    display_saved_jokes(user)
  elsif return_value == 3
    select_category(user)
  elsif return_value == 4
    system "clear"
    exit
  end
end 

def select_category(user)
  system "clear"
  prompt1 = TTY::Prompt.new
  prompt2 = TTY::Prompt.new
  prompt3 = TTY::Prompt.new
  prompt4 = TTY::Prompt.new(symbols: {marker: '♥'})
  category = prompt4.select("Choose a category: \n", %w(animal career celebrity dev explicit fashion food history money movie music political religion science sport travel), active_color: :cyan)
  new_joke = get_joke_from_category(category)
  input = prompt2.yes?('Do you want joke to be saved?')
  if input
    save_joke_to_user(new_joke, user.username)
    entered = prompt3.yes?('Do you want another joke?')
    entered ? select_category(user) : display_menu(user)
  else 
    display_menu(user)
  end
end 

def display_saved_jokes(user)
  system "clear"
  puts 'These are your saved jokes:'
  puts user.saved_jokes.map.with_index(1){|joke, index| index.to_s + '. ' + joke["jokes_saved"]}
  prompt = TTY::Prompt.new
  input = prompt.yes?("\nDo you want to view more jokes?")
  if input  
    display_menu(user)
  else 
    system "clear"
    exit
  end
end 

def get_and_display_a_random_joke(user)
  system "clear"
  prompt1 = TTY::Prompt.new
  prompt2 = TTY::Prompt.new
  new_joke = get_joke
  input = prompt1.yes?('Do you want joke to be saved?')
  if input
    save_joke_to_user(new_joke, user.username)
    entered = prompt2.yes?('Do you want another joke?')
    entered ? get_and_display_a_random_joke(user) : display_menu
  else 
    display_menu(user)
  end
end

