require 'spec_helper'

describe User do
  describe 'Validations' do
    it 'should require a  user_name' do
      subject.should_not be_valid
      subject.errors[:username].should_not be_empty
    end

    it 'should require a password' do
      subject.should_not be_valid
      subject.errors[:password].should_not be_empty
    end
  end
end
