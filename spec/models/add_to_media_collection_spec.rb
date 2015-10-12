require 'rails_helper'

describe AddToMediaCollection do

  let(:user) { FactoryGirl.create(:user) }
  let(:item_url) { 'https://news.ycombinator.com/' }
  let(:mock_item) { FactoryGirl.create(:media_item) }

  subject { described_class.new(user: user, url: item_url, public: false) }

  it "calls Repository with item_url" do
    expect(MediaRepository).to receive(:add).with({user: user, url: item_url, public: false}).and_return(mock_item)
    expect(ScrapeTitleJob).to receive(:perform_later).with(mock_item.id)
    subject.execute!
  end
end
