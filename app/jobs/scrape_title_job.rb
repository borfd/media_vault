require 'open-uri'

class ScrapeTitleJob < ActiveJob::Base
  queue_as :default

  def perform(media_item_id)
    media_item = MediaRepository.find(media_item_id)
    doc = Nokogiri::HTML(open(media_item.url))
    title = doc.xpath('//title/text()')
    media_item.scraped_title = title
    media_item.save!
  end
end
