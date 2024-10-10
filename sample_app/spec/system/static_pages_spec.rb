require "rails_helper"

RSpec.describe "static_pages", type: :system do
  describe "GET root" do
    it "title should have base text" do
      visit "/"
      expect(page.status_code).to eq 200
      expect(page.title).to eq 'Home | Ruby on Rails Tutorial Sample App'
    end
  end

  describe "GET /static_pages/home" do
    it "title should have home with base text" do
      visit "/static_pages/home"
      expect(page.status_code).to eq 200
      expect(page.title).to eq 'Home | Ruby on Rails Tutorial Sample App'
    end
  end

  describe "GET /static_pages/help" do
    it "title should have help with base text" do
      visit "/static_pages/help"
      expect(page.status_code).to eq 200
      expect(page.title).to eq  'Help | Ruby on Rails Tutorial Sample App'
    end
  end

  describe "GET /static_pages/about" do
    it "title should have about with base text" do
      visit "/static_pages/about"
      expect(page.status_code).to eq 200
      expect(page.title).to eq  'About | Ruby on Rails Tutorial Sample App'
    end
  end

  describe "GET /static_pages/contact" do
    it "title should have contact with base text" do
      visit "/static_pages/contact"
      expect(page.status_code).to eq 200
      expect(page.title).to eq  'Contact | Ruby on Rails Tutorial Sample App'
    end
  end

end
