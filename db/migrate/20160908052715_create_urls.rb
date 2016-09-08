class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :original_url
      t.string :shorty
      t.integer :user_id
      t.integer :visits_count
      t.timestamps null: false
    end
  end
end
