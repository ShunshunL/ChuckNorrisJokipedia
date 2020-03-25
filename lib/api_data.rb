require 'rest-client'
require 'json'
require 'pry'
require_relative '../db/seed.rb'

def get_joke
  response_hash = JSON.parse(RestClient.get('https://api.chucknorris.io/jokes/random'))
  puts response_hash['value']
  response_hash['value']
end

def get_joke_from_category(category)
  response_hash = JSON.parse(RestClient.get("https://api.chucknorris.io/jokes/random?category=#{category}"))
  puts response_hash['value']
  response_hash['value']
end
