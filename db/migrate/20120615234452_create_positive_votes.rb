class CreatePositiveVotes < ActiveRecord::Migration
  def change
    create_table :positive_votes do |t|
      t.integer :site_id
      t.string :ip_address

      t.timestamps
    end
  end
end
