require 'uri'

class Link < ActiveRecord::Base
  belongs_to :user
  validates_format_of :url, :with=> URI::regexp(%w(http https))
end
