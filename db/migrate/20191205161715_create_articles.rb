class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :photo
      t.string :location
      t.date :date
      t.string :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
