class CreateSavedJokes < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_jokes do |t|
      t.string :jokes_saved
      t.timestamps
    end
  end
end
