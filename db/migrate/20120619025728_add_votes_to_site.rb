class AddVotesToSite < ActiveRecord::Migration
  def change
    add_column :sites, :positive_votes_count, :integer
    add_column :sites, :negative_votes_count, :integer
  end
end
