class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :token
      t.integer :times_visited, default: 0

      t.timestamps
    end
  end
end
