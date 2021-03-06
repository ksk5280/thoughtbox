class Link < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :url
  validates :url, url: true
end
