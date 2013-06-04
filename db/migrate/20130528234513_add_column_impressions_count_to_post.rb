class AddColumnImpressionsCountToPost < ActiveRecord::Migration
  def up
    add_column :posts, :impressions_count, :integer, :default => 0
  end

  def down
    remove_column :posts, :impressions_count
  end
end
