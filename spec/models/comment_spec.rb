require 'spec_helper'

describe Comment do
  it 'requires a comment' do
    subject.should_not be_valid
    subject.errors[:body].should_not be_empty
  end
end
