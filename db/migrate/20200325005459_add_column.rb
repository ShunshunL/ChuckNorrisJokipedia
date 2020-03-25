class AddColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :saved_jokes, :user_id, :integer 
    add_column :saved_jokes, :joke_id, :integer
  end
end
