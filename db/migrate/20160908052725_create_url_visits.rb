class CreateUrlVisits < ActiveRecord::Migration
  def change
    create_table :url_visits do |t|
    	t.integer :url_id
    	t.string :visitor_ip
    	t.string :visitor_city
    	t.string :visitor_state
    	t.string :visitor_country_iso2
      t.timestamps null: false
    end
  end
end
