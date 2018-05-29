class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :author
      t.string :primary_isbn13
      t.string :primary_isbn10
      t.datetime :published_date
      t.integer :rank
      t.integer :weeks_on_list

      t.timestamps
    end
  end
end
