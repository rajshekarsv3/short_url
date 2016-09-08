class AlterTableUrl < ActiveRecord::Migration
  def change
  	add_index :urls, :shorty 
  	change_column_default :urls, :visits_count, 0
  end
end
