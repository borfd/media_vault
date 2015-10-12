class MediaItem < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :user

  validates :url, presence: true

  auto_html_for :url do
    html_escape
    image
    youtube(width: 400, height: 250, autoplay: false)
    soundcloud
    instagram
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

end
