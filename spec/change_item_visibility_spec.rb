require 'rails_helper'

describe ChangeItemVisibility do
  let(:media_item) { FactoryGirl.create(:media_item, public: is_public) }

  subject { described_class.new(media_item: media_item, public: going_to_be_public) }

  def assert_visibility(media_item, is_public, going_to_be_public)
    expect(media_item.public?).to eq(is_public)

    subject.execute!

    media_item.reload
    expect(media_item.public?).to eq(going_to_be_public)
  end

  context "making a media item public" do
    let(:is_public) { false }
    let(:going_to_be_public) { true }

    it("can make a media item public") { assert_visibility(media_item, is_public, going_to_be_public) }
  end

  context "making an item private" do
    let(:is_public) { true }
    let(:going_to_be_public) { false }

    it("can make a media item private") { assert_visibility(media_item, is_public, going_to_be_public) }
  end
end
