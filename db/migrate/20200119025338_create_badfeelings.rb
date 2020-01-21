class CreateBadfeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :badfeelings do |t|
      t.integer :user_id
      t.integer :record_id

      t.timestamps
    end
  end
end
