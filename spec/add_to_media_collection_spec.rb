require 'rails_helper'

describe AddToMediaCollection do

  let(:user) { FactoryGirl.create(:user) }
  let(:item_url) { 'https://news.ycombinator.com/' }

  subject { described_class.new(user: user) }

  it "calls Repository with item_url" do
    expect(MediaRepository).to receive(:add).with({user: user, url: item_url, type: 'website'})
    subject.execute!(url: item_url, type: 'website')
  end
end
