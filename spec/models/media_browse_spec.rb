require 'rails_helper'

describe MediaBrowse do

  let(:user_1) { FactoryGirl.create(:user) }
  let(:user_2) { FactoryGirl.create(:user) }

  let!(:user_1_public) { FactoryGirl.create_list(:media_item, 2, public: true, user: user_1) }
  let!(:user_1_private) { FactoryGirl.create_list(:media_item, 2, public: false, user: user_1) }

  let!(:user_2_public) { FactoryGirl.create_list(:media_item, 2, public: true, user: user_2) }
  let!(:user_2_private) { FactoryGirl.create_list(:media_item, 2, public: false, user: user_2) }

  subject { described_class.new(user: current_user) }

  context "as user 1" do
    let(:current_user) { user_1 }

    it "lists public items for both users and private items for current user" do
      items = subject.items

      expect(items.to_a).to eq(user_1_public + user_1_private + user_2_public)
    end
  end

  context "as user 2" do
    let(:current_user) { user_2 }

    it "lists public items for both users and private items for current user" do
      items = subject.items

      expect(items.to_a).to eq(user_2_public + user_2_private + user_1_public)
    end
  end

  context "as guest" do
    let(:current_user) { nil }

    it "lists all public items" do
      items = subject.items

      expect(items.to_a).to eq(user_1_public + user_2_public)
    end
  end

end
