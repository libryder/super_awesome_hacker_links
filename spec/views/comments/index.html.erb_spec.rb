require 'spec_helper'

describe "comments/index" do
  before(:each) do
    @link = FactoryGirl.create :link
    @user = FactoryGirl.create :user
    sign_in @user

    assign(:comments, [
      stub_model(Comment,
        :user_id => @user.id,
        :link_id => 1,
        :body => "MyText",
        :created_at => Time.now
      ),
      stub_model(Comment,
        :user_id => @user.id,
        :link_id => 1,
        :body => "MyText",
        :created_at => Time.now
      )
    ])
  end

  it "renders a list of comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "#{@user.email} wrote on #{Date.parse(l @link.created_at).strftime('%m/%d/%Y')}", :count => 2
  end
end
