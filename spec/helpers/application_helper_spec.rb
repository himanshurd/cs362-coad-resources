require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "full_title helper function" do
    it "Displays base title if not not given a page title" do
      expect(helper.full_title).to eq("Disaster Resource Network")
    end
    it "Displays base title and the given a page title" do
      page_title = "Page Title"
      expect(helper.full_title(page_title)).to eq("#{page_title} | Disaster Resource Network")
    end
  end
end
