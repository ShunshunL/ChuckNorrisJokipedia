class Joke < ActiveRecord::Base
  has_many :savedjokes
  has_many :users, through: :savedjokes
end
