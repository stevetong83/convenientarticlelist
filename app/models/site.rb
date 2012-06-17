class Site < ActiveRecord::Base
  attr_accessible :description, :name, :negative_votes, :positive_votes, :url, :email

  has_many :positive_votes, :dependent => :destroy
  has_many :negative_votes, :dependent => :destroy

  validates :name, :presence => true
  validates :url, :presence => true,
                  :uniqueness => true
  validates :description, :presence => true,
                          :length => {:maximum => 500}
end
