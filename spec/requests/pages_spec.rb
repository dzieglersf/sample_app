require 'spec_helper'

describe "Pages" do

	before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "Home page" do
    
    it "shoud have the h1 'Sample App'" do
      visit '/pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end
    
    it "should have the correct title" do	
    	visit '/pages/home'
    	page.should have_selector('title', :text => @base_title + " | Home")
    end

  end

  describe "Help page" do

   	it "should have the h1 'Help'" do
   		visit '/pages/help'
   		page.should have_selector('h1', :text => "Help")
    end

    it "should have the correct title" do
      visit '/pages/help'
      page.should have_selector('title', :text => @base_title + " | Help")
    end

  end

  describe "Contact Page" do

    it "should have the h1 'Contact'" do
      visit '/pages/contact'
      page.should have_selector('h1', :text => "Contact Us")
    end

    it "should have the correct title" do
      visit '/pages/contact'
      page.should have_selector('title', :text => @base_title + " | Contact")
    end

  end

  describe "About Page" do

    it "should have the h1 'About'" do
      visit '/pages/about'
    end

    it "should have the correct title" do
      visit '/pages/about'
      page.should have_selector('title', :text => @base_title + " | About")
    end

  end

end
