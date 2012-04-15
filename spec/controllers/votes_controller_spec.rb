require 'spec_helper'

describe VotesController do
  before do
    @user = FactoryGirl.create :user
    @link = FactoryGirl.create :link
    sign_in @user
    
    @good_response = { "new_count" => 1, "has_voted" => false }.to_json
    @bad_response = { "new_count" => 0, "has_voted" => true }.to_json
  end

  describe "POST create" do
    describe "with valid params" do
      let (:link) { FactoryGirl.create :link }

      it 'does not allow user to vote without being signed in' do
        sign_out @user
        xhr :post, :create, { :link_id => @link.id }
        response.code.should == "401"
      end

      it '"CREATE" only responds to XHR' do
        post :create, { :link_id => @link.id }
        response.body.should == "Nope."
      end

      it 'user can only vote once per link' do
        expect {
          2.times do
            xhr :post, :create, { :link_id => @link.id}
          end
        }.to change(Vote, :count).by(1)
      end

      it "creates a new Vote" do
        expect {
          xhr :post, :create, { :link_id => @link.id}
        }.to change(Vote, :count).by(1)
      end

      it "assigns a newly created vote as @vote" do
        xhr :post, :create, {:link_id => @link.id}
        assigns(:vote).should be_a(Vote)
        assigns(:vote).should be_persisted
      end

      it "returns a successful response" do
        xhr :post, :create, {:link_id => @link.id}
        response.body.should == @good_response
      end
    end

  end
end
