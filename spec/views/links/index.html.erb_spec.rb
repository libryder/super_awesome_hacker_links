require 'spec_helper'

describe 'links/index.html.erb' do
  let(:link_decorate) { LinkDecorator.new(FactoryGirl.create(:link)) }
  
  before do
    ApplicationController.new.set_current_view_context
    view.stub(:link_decorate) { link_decorate }
    @user = FactoryGirl.create :user
    @link = LinkDecorator.new(FactoryGirl.create :link)
    @links = [@link]
  end
  
  it 'renders an inactive button if user is not signed in' do
    render #:template => 'links/index.html.erb', :formats => [:erb]
    rendered.should have_selector '.inactive_button'
  end
  
  it 'renders an active button if user is signed in' do
    sign_in @user
    render #:template => 'links/index.html.erb', :formats => [:erb]
    rendered.should have_selector '.has_not_voted'
  end
  
  it 'renders an active button with a has_voted class if user is signed in and has voted on a link' do
    sign_in @user
    @user.votes.create :link_id => @link.id
    render
    rendered.should have_selector '.vote_link'
  end
  
end
