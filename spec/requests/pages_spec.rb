require 'spec_helper'

describe "Pages" do

	before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector 'h1', :text => 'Sample App' }
    it { should have_selector 'title', :text => @base_title + " | Home" }

  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector 'h1', :text => 'Help' }
    it { should have_selector 'title', :text => @base_title + " | Help" }

  end

  describe "Contact Page" do
    before { visit contact_path }

    it { should have_selector 'h1', :text => "Contact Us" }
    it { should have_selector 'title', text: @base_title + " | Contact" }

  end

  describe "About Page" do
    before { visit about_path }

    it { should have_selector 'h1', text: "About" }
    it { should have_selector 'title', text: @base_title + " | About" }
    
  end

end
