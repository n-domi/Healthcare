class CreateGoodfeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :goodfeelings do |t|
      t.integer :user_id
      t.integer :record_id

      t.timestamps
    end
  end
end
