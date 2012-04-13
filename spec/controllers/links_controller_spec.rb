require 'spec_helper'

describe LinksController do
  before do
    @link = FactoryGirl.create :link
  end

  def valid_attributes
    { :url => 'whoisjohngalt.com', :description => "Pretty cool link", :user_id => 1 }
  end

  describe "GET index" do
    it "assigns all links as @links" do
      get :index
      assigns(:links).should eq([@link])
    end
  end

  describe "GET new" do
    it "assigns a new link as @link" do
      get :new
      assigns(:link).should be_a_new(Link)
    end
  end

  describe "POST create" do
    describe "with valid params" do

      it "creates a new Link" do
        expect {
          post :create, {:link => valid_attributes}
        }.to change(Link, :count).by(1)
      end

      it "assigns a newly created link as @link" do
        post :create, {:link => valid_attributes}
        assigns(:link).should be_a(Link)
        assigns(:link).should be_persisted
      end

      it "redirects to the created link" do
        post :create, {:link => valid_attributes}
        response.should redirect_to(links_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved link as @link" do
        Link.any_instance.stub(:save).and_return(false)
        post :create, {:link => {}}
        assigns(:link).should be_a_new(Link)
      end

      it "re-renders the 'new' template" do
        Link.any_instance.stub(:save).and_return(false)
        post :create, {:link => {}}
        response.should render_template("new")
      end
    end
  end
end
