class AddColumnRecord < ActiveRecord::Migration[5.2]
  def change
    remove_column :records,:users_id,:integer
    add_column :records,:user_id,:integer
  end
end
