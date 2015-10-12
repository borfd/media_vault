class MediaItem < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :user

  validates :type, presence: true
  validates :url, presence: true

end
