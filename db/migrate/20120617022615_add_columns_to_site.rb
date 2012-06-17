class AddColumnsToSite < ActiveRecord::Migration
  def change
    add_column :sites, :links, :string
    add_column :sites, :number_of_links, :string
    add_column :sites, :link_placement, :string
    add_column :sites, :word_min, :string
    add_column :sites, :approval_time, :string
    add_column :sites, :other_info, :text
    add_column :sites, :user_id, :integer
  end

end
