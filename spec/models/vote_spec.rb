require 'spec_helper'

describe Vote do
  before do
    @user = FactoryGirl.create :user
    @other_user = FactoryGirl.create :user
    @link = FactoryGirl.create :link
  end

  it 'does not create if user is blank' do
    expect {
      Vote.create(:user_id => nil, :link_id => @link.id)
    }.to_not change{Vote.count}
  end

  it 'does not create if link is blank' do
    expect {
      Vote.create(:user_id => @user.id, :link_id => nil)
    }.to_not change{Vote.count}
  end
end
