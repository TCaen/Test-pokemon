class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :action

      t.timestamps
    end
  end
end
