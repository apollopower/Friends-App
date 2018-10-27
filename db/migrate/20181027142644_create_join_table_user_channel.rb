class CreateJoinTableUserChannel < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :channels do |t|
      t.index :user_id
      t.index :channel_id
    end
  end
end
