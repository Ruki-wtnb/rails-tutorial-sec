require "rails_helper"
include ApplicationHelper

RSpec.describe "static_pages", type: :system do
  describe "GET root" do
    before do
      visit root_path
    end

    it "title should have base text" do
      expect(page.status_code).to eq 200
      expect(page.title).to eq 'Ruby on Rails Tutorial Sample App'
    end

    it "should have header links" do
      expect(page.has_link?('Home')).to eq true
      expect(page.has_link?('Help')).to eq true
    end

    it "should have footer links" do
      expect(page.has_link?('About')).to eq true
      expect(page.has_link?('Contact')).to eq true
    end

    it "cnotact path has fulltitle" do
      visit contact_path
      expect(page.title).to eq full_title("Contact")
    end

  end

  describe "GET /static_pages/home" do
    it "title should have home with base text" do
      visit root_path
      expect(page.status_code).to eq 200
      expect(page.title).to eq 'Ruby on Rails Tutorial Sample App'
    end
  end

  describe "GET /static_pages/help" do
    it "title should have help with base text" do
      visit help_path
      expect(page.status_code).to eq 200
      expect(page.title).to eq  'Help | Ruby on Rails Tutorial Sample App'
    end
  end

  describe "GET /static_pages/about" do
    it "title should have about with base text" do
      visit about_path
      expect(page.status_code).to eq 200
      expect(page.title).to eq  'About | Ruby on Rails Tutorial Sample App'
    end
  end

  describe "GET /static_pages/contact" do
    it "title should have contact with base text" do
      visit contact_path
      expect(page.status_code).to eq 200
      expect(page.title).to eq  'Contact | Ruby on Rails Tutorial Sample App'
    end
  end

end
