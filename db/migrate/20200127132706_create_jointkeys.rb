class CreateJointkeys < ActiveRecord::Migration[5.2]
  def change
    create_table :jointkeys do |t|
      t.references :article, foreign_key: true
      t.references :keyword, foreign_key: true
      t.timestamps
    end
  end
end
