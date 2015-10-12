require 'rails_helper'

RSpec.describe MediaItem, type: :model do
  it "must be private by default" do
    item = described_class.new

    expect(item.public?).to eq(false)
  end
end
