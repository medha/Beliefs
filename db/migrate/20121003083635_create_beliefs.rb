class CreateBeliefs < ActiveRecord::Migration
  def change
    create_table :beliefs do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :beliefs, [:user_id, :created_at]
  end
end
