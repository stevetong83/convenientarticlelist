class NegativeVote < ActiveRecord::Base
  attr_accessible :ip_address, :site_id

  belongs_to :site, :counter_cache => true
end
