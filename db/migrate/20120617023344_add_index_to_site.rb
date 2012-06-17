class AddIndexToSite < ActiveRecord::Migration
  def change
    add_index :sites, [:user_id, :positive_votes, :created_at]
  end
end
