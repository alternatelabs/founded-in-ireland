require 'rails_helper'

describe Metadata do

  before do
    Metadata.create(key: 'test', value: 'some text')
  end

  describe ".get" do
    it "should get value when key exists" do
      value = Metadata.get("test")
      expect(value).to eq("some text")
    end

    it "should return an empty string if key doesn't exist" do
      value = Metadata.get("random")
      expect(value).to eq("")
    end
  end

  describe ".set" do
    it "should create a new row if the key does not already exist" do
      Metadata.set("new", "hello world")
      value = Metadata.get("new")
      expect(value).to eq("hello world")
    end
    it "should update a value if the key exists" do
      Metadata.set("test", "updated")
      value = Metadata.get("test")
      expect(value).to eq("updated")
    end
  end

  describe "groups" do
    before do
      Metadata.set("homepage_header_content", "header content")
      Metadata.set("homepage_footer_content", "footer content")
    end

    describe ".get_group" do
      it "should get the values for the homepage_group" do
        data = Metadata.get_group("homepage_group")
        expect(data['homepage_header_content']).to eq("header content")
        expect(data['homepage_footer_content']).to eq("footer content")
      end

      it "should return an empty hash if the group does not exist" do
        data = Metadata.get_group("hello")
        expect(data).to eq({})
      end
    end

    describe ".set_group" do
      it "should set the values on the homepage_group" do
        Metadata.set_group("homepage_group", {"homepage_header_content" => "updated", "homepage_footer_content" => "updated2"})
        value1 = Metadata.get("homepage_header_content")
        value2 = Metadata.get("homepage_footer_content")

        expect(value1).to eq("updated")
        expect(value2).to eq("updated2")
      end

      it "should throw an error when getting a group that does not exist" do
        expect { Metadata.set_group("void_group", {}) }.to raise_error(Metadata::GroupNotFound)
      end
    end
  end

end
