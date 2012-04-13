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

  describe "GET show" do
    it "assigns the requested link as @link" do
      get :show, {:id => @link.to_param}
      assigns(:link).should eq(@link)
    end
  end

  describe "GET new" do
    it "assigns a new link as @link" do
      get :new
      assigns(:link).should be_a_new(Link)
    end
  end

  describe "GET edit" do
    it "assigns the requested link as @link" do
      get :edit, {:id => @link.to_param}
      assigns(:link).should eq(@link)
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

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested link" do
        Link.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @link.to_param, :link => {'these' => 'params'}}
      end

      it "assigns the requested link as @link" do
        put :update, {:id => @link.to_param, :link => valid_attributes}
        assigns(:link).should eq(@link)
      end

      it "redirects to the link" do
        put :update, {:id => @link.to_param, :link => valid_attributes}
        @link.update_attributes valid_attributes
        response.should redirect_to(@link)
      end
    end

    describe "with invalid params" do
      it "assigns the link as @link" do
        link = Link.create! valid_attributes
        Link.any_instance.stub(:save).and_return(false)
        put :update, {:id => link.to_param, :link => {}}
        assigns(:link).should eq(link)
      end

      it "re-renders the 'edit' template" do
        link = Link.create! valid_attributes
        Link.any_instance.stub(:save).and_return(false)
        put :update, {:id => link.to_param, :link => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested link" do
      expect {
        delete :destroy, {:id => @link.to_param}
      }.to change(Link, :count).by(-1)
    end

    it "redirects to the links list" do
      delete :destroy, {:id => @link.to_param}
      response.should redirect_to(links_url)
    end
  end
end
