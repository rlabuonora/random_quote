require 'spec_helper'

describe "Viewing the homepage" do
    
    it "shows a block quote" do
        visit root_url
        expect(page).to have_selector("blockquote")
    end
end