require 'spec_helper'

describe "Pages" do

	before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector 'h1', :text => "David's Twitter-lite!" }
    it { should have_selector 'title', :text => @base_title + " | Home" }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipusum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end
        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 follower", href: followers_user_path(user)) }
      end

    end
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
