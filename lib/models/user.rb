class User < ActiveRecord::Base
  has_many :saved_jokes
  has_many :jokes, through: :saved_jokes

  def logged_in 
    self.logged_in
  end 
end
