class CreateNegativeVotes < ActiveRecord::Migration
  def change
    create_table :negative_votes do |t|
      t.integer :site_id
      t.string :ip_address

      t.timestamps
    end
  end
end
