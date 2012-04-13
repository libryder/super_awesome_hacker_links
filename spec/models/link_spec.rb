require 'spec_helper'

describe Link do
  describe 'Validations' do
    context 'when no data is filled out' do
      it 'should require a url' do
        subject.should_not be_valid
        subject.errors[:url].should_not be_empty
      end

      it 'should require a description' do
        subject.should_not be_valid
        subject.errors[:description].should_not be_empty
      end
    end

    context 'when data is filled out' do
      before do
        FactoryGirl.create(:link, :url => 'google.com')
      end

      it 'requires a unique url' do
        link = FactoryGirl.build(:link, :url => 'google.com')
        link.valid?
        link.errors[:url].should == ["has already been taken"]
      end
    end
  end
end
