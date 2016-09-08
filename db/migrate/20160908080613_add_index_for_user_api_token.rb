class AddIndexForUserApiToken < ActiveRecord::Migration
  def change
  	add_index(:users, :api_token)
  end
end
