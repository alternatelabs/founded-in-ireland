require 'rails_helper'

describe Page do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:slug) }
  it { should validate_presence_of(:content) }

  describe ".get_by_slug" do
    before do
      Page.create(title: "Test", slug: "test", content: "Hiyas")
    end

    it "finds pages by slug when they exist" do
      page = Page.get_by_slug("test")

      expect(page.title).to eq("Test")
    end

    it "returns nil when a page doesn’t exist" do
      expect(Page.get_by_slug("random")).to be nil
    end
  end
end
