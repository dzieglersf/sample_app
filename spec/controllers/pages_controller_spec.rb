require 'spec_helper'

describe PagesController do

  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end


  describe "Get 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end

    it "should have the right title" do
      visit 'help'
      page.should have_selector("title",
                                :content => @base_title + " | Help")
    end

  end


  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

    it "should have the right title" do
      visit 'about'
      page.should have_selector("title",
                                :content => @base_title + " | About")
    end

  end


  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      visit 'home'
      page.should have_selector("title",
                                :content => @base_title + " | Home")
    end

  end


  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  
    it "should have the right title" do
      visit 'contact'
      page.should have_selector("title",
                                :content => @base_title + " | Contact")
    end

  end

end
