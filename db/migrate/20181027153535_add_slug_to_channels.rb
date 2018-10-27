class AddSlugToChannels < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :slug, :string
  end
end
