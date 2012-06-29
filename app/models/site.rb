class Site < ActiveRecord::Base
  attr_accessible :description, :name, :negative_votes_count, :positive_votes_count, :url, :email,
                  :links, :number_of_links, :link_placement, :word_min, :approval_time, :other_info

  has_many :positive_votes, :dependent => :destroy
  has_many :negative_votes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  belongs_to :user

  validates :name, :presence => true
  validates :url, :presence => true,
                  :uniqueness => {:case_sensitive => false}
  validates :description, :presence => true,
                          :length => {:maximum => 600}
  validates :other_info, :length => {:maximum => 700}
  validates :word_min, :numericality => {:allow_blank => true}

  def to_param
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end



end
