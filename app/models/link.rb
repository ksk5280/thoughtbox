class Link < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :url
  validates :url, url: true
end