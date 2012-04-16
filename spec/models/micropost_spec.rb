# == Schema Information
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Micropost do 

	let(:user) { FactoryGirl.create(:user) }
	before { @micropost = user.microposts.build(content: "Lorem ipsum") }

	subject { @micropost }

	it { should respond_to :content }
	it { should respond_to :user_id }
	it { should respond_to :user }
	its(:user) { should == user }

	it { should be_valid }

	describe "accessible attributes" do
		it "should not allow access to user_id" do
			expect do 
				Micropost.new(user_id: user.id)
			end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end

	describe "when user_id is not present" do
		before { @micropost.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank content" do
		before { @micropost.content = " " }
		it { should_not be_valid }
	end

	describe "with content that is too long" do
		before { @micropost.content = "x"*141 }
		it { should_not be_valid }
	
	end

	describe "from_users_followed_by" do
		let(:user) { FactoryGirl.create(:user) }
		let(:other_user) { FactoryGirl.create(:user) }
		let(:third_user) { FactoryGirl.create(:user) }

		before { user.follow!(other_user) }

		let(:own_post) { user.microposts.create(content: "my post") }
		let(:followed_users_post) { other_user.microposts.create(content: "followed user's post") }
		let(:unfollowed_users_post) { third_user.microposts.create(content: "not following this one") }

		subject { Micropost.from_users_followed_by(user) }

		it { should include(own_post) }
		it { should include(followed_users_post) }
		it { should_not include(unfollowed_users_post) }

	end

end
