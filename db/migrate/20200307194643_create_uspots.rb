class CreateUspots < ActiveRecord::Migration[5.2]
  def change
    create_table :uspots do |t|
      t.references :spot, foreign_key: true
      t.references :user, foreign_key: true
      t.string :winddirection
      t.string :min_kts
      t.timestamps
    end
  end
end
