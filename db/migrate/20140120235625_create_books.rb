class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.integer :year_of_publication
      t.string :publisher

      t.timestamps
    end
  end
end
