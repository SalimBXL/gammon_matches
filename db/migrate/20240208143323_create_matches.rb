class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.datetime :datetime
      t.integer :status
      t.references :winner, foreign_key: { to_table: :users }
      t.references :looser, foreign_key: { to_table: :users }
      t.references :author, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
