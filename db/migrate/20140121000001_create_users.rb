class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :location
      t.integer :age

      t.timestamps
    end
  end
end
