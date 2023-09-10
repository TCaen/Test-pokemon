class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :imagepath
      t.float :weight
      t.float :height
      t.integer :price

      t.timestamps
    end
  end
end
