# bootstrap your database and its relations.
require_relative '../lib/command_line_interface.rb'


def save_joke_to_user(joke_string, user_name)
    user = User.find_by(username: user_name)
    joke = Joke.create(joke: joke_string)
    SavedJoke.create(user_id: user.id, joke_id: joke.id, jokes_saved: joke_string)
end 

