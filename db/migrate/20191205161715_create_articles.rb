class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :picture
      t.string :location
      t.date :date
      t.integer :upvotes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
