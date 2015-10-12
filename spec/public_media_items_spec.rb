require 'rails_helper'

describe PublicMediaItems do
  it "can find public media items" do
    expect(MediaRepository).to receive(:where).with(public: true)
    subject.public
  end
end
