require 'rails_helper'

describe ScrapeTitleJob, type: :job do

  let(:media_item) do
    FactoryGirl.create(:media_item, url: 'https://youtube.com')
  end

  it "scrapes the title of a website" do
    VCR.use_cassette('scrape_title_job') do
      described_class.perform_now(media_item)
      media_item.reload
      expect(media_item.scraped_title).to eq('YouTube')
    end
  end
end
