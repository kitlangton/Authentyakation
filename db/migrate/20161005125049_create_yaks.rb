class CreateYaks < ActiveRecord::Migration[5.0]
  def change
    create_table :yaks do |t|
      t.string :name
      t.integer :hair_length
      t.integer :age

      t.timestamps
    end
  end
end
