class User < ActiveRecord::Base
  has_many :saved_jokes
  has_many :jokes, through: :saved_jokes
end
