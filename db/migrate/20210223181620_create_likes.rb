class CreateLikes < ActiveRecord::Migration
  def change
    create_table :secrets do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :secret, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
