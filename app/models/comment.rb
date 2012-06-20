class Comment < ActiveRecord::Base
  attr_accessible :comment, :name, :site_id

  belongs_to :site

  validates :name, :presence => true
  validates :comment, :presence => true
end
