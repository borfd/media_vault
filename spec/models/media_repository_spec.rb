require 'rails_helper'

describe MediaRepository do

  context "add method" do
    let(:user) { FactoryGirl.create(:user) }
    let(:item_attributes) do
      {
        user: user,
        url: 'http://news.ycombinator.com',
        public: true
      }
    end

    it "has an add method which adds a new media item" do
      described_class.add(item_attributes)

      expect(user.media_items.count).to eq(1)

      media_item = user.media_items.last
      expect(media_item.url).to eq(item_attributes[:url])
      expect(media_item.public?).to eq(item_attributes[:public])
    end
  end

  context "can find media items based on public setting" do
    let(:public_media_items_count) { 5 }
    let(:public_items) { FactoryGirl.create_list(:media_item, public_media_items_count, public: true) }
    let(:private_item) { FactoryGirl.create(:media_item, public: false) }

    it "has a where method" do
      expect(described_class.where(public: true)).to eq(public_items)
    end

  end

end
