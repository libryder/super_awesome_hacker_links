require 'spec_helper'

describe VotesController do
  before do
    @user = FactoryGirl.create :user
    sign_in @user
  end

  describe "POST create" do
    describe "with valid params" do
      let (:link) { FactoryGirl.create :link }

      it "creates a new Vote" do
        puts controller.current_user
        expect {
         post :create, { :link_id => link.id}
        }.to change(Vote, :count).by(1)
      end

      it "assigns a newly created vote as @vote" do
        post :create, {:link_id => link.id}
        assigns(:vote).should be_a(Vote)
        assigns(:vote).should be_persisted
      end

      it "returns a successful response" do
        expected = { "new_count" => 1, "has_voted" => false }.to_json
        post :create, {:link_id => link.id}
        response.body.should == expected
      end
    end

  end
end
