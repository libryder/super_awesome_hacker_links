require 'spec_helper'

describe LinksController do
  def valid_attributes
    { :url => "http://www.google.com", :description => "Blah" }
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all links as @links" do
      link = Link.create! valid_attributes
      get :index, {}, valid_session
      assigns(:links).should eq([link])
    end
  end

  describe "GET show" do
    it "assigns the requested link as @link" do
      link = Link.create! valid_attributes
      get :show, {:id => link.to_param}, valid_session
      assigns(:link).should eq(link)
    end
  end

  describe "GET new" do
    it "assigns a new link as @link" do
      get :new, {}, valid_session
      assigns(:link).should be_a_new(Link)
    end
  end

  describe "GET edit" do
    it "assigns the requested link as @link" do
      link = Link.create! valid_attributes
      get :edit, {:id => link.to_param}, valid_session
      assigns(:link).should eq(link)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Link" do
        expect {
          post :create, {:link => valid_attributes}, valid_session
        }.to change(Link, :count).by(1)
      end

      it "assigns a newly created link as @link" do
        post :create, {:link => valid_attributes}, valid_session
        assigns(:link).should be_a(Link)
        assigns(:link).should be_persisted
      end

      it "redirects to the created link" do
        post :create, {:link => valid_attributes}, valid_session
        response.should redirect_to(Link.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved link as @link" do
        Link.any_instance.stub(:save).and_return(false)
        post :create, {:link => {}}, valid_session
        assigns(:link).should be_a_new(Link)
      end

      it "re-renders the 'new' template" do
        Link.any_instance.stub(:save).and_return(false)
        post :create, {:link => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested link" do
        link = Link.create! valid_attributes
        Link.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => link.to_param, :link => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested link as @link" do
        link = Link.create! valid_attributes
        put :update, {:id => link.to_param, :link => valid_attributes}, valid_session
        assigns(:link).should eq(link)
      end

      it "redirects to the link" do
        link = Link.create! valid_attributes
        put :update, {:id => link.to_param, :link => valid_attributes}, valid_session
        response.should redirect_to(link)
      end
    end

    describe "with invalid params" do
      it "assigns the link as @link" do
        link = Link.create! valid_attributes
        Link.any_instance.stub(:save).and_return(false)
        put :update, {:id => link.to_param, :link => {}}, valid_session
        assigns(:link).should eq(link)
      end

      it "re-renders the 'edit' template" do
        link = Link.create! valid_attributes
        Link.any_instance.stub(:save).and_return(false)
        put :update, {:id => link.to_param, :link => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "PUT rate" do
    it 'increments the rating' do
      link = Link.create! valid_attributes

      expect {
        put :rate, :id => link.id
      }.to change{link.reload.rating}.by(1)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested link" do
      link = Link.create! valid_attributes
      expect {
        delete :destroy, {:id => link.to_param}, valid_session
      }.to change(Link, :count).by(-1)
    end

    it "redirects to the links list" do
      link = Link.create! valid_attributes
      delete :destroy, {:id => link.to_param}, valid_session
      response.should redirect_to(links_url)
    end
  end
end
