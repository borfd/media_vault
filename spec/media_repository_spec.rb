require 'rails_helper'

describe MediaRepository do

  let(:user) { FactoryGirl.create(:user) }
  let(:item_attributes) do
    {
      user: user,
      url: 'http://news.ycombinator.com',
      type: 'website',
    }
  end

  it "has an add method which adds a new media item" do
    described_class.add(item_attributes)

    expect(user.media_items.count).to eq(1)

    media_item = user.media_items.last
    expect(media_item.url).to eq(item_attributes[:url])
    expect(media_item.type).to eq(item_attributes[:type])
  end

end
