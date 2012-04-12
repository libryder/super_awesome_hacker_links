require 'spec_helper'

describe "links/new" do
  before(:each) do
    assign(:link, stub_model(Link,
      :url => "MyString",
      :user => nil,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => links_path, :method => "post" do
      assert_select "input#link_url", :name => "link[url]"
      assert_select "input#link_user", :name => "link[user]"
      assert_select "input#link_description", :name => "link[description]"
    end
  end
end
