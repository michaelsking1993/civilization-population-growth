class CreateCivilizations < ActiveRecord::Migration[7.1]
  def change
    create_table :civilizations do |t|
      t.string :name
      t.text :population
      t.float :growth_rate
      t.integer :current_year

      t.timestamps
    end
  end
end
