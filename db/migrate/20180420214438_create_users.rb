class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :currentXp
      t.integer :level
      t.integer :streak
      

      t.timestamps
    end
  end
end
