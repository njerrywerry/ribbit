require 'rails_helper'

describe RibitsController do
  describe "GET #index" do
    # it "populates an array of ribits" do
    #   ribit = create(:ribit)
    #   get :index
    #   expect(assigns(:ribits)).to match_array ([ribit])
    # end
    it "renders the :index view" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new ribit" do
        expect{
          post :create, ribit: FactoryGirl.attributes_for(:ribit)
        }.to change(Ribit, :count).by(1)
      end
      it "redirects to the current user profile"
    end

    context "with invalid attributes" do
      it "does not save the ribit to the database"
      it "redirects to the current user profile"
    end
  end

end
