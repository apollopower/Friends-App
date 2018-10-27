class CreateJoinTableChannelsPosts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :channels, :posts do |t|
      t.index :channel_id
      t.index :post_id
    end
  end
end
