require 'rails_helper'

describe UsersController do
  let!(:user) { create :user }

  context '#show' do
    it "is successful" do
      get :show, id: user
      expect(response).to be_success
    end

    it "assigns the requested user to @user" do
      get :show, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders a show page" do
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  context "#new" do
    it "is successful" do
      get :new, id: user
      expect(response).to be_success
    end

    it "assigns a new instance of User to @user" do
      get :new, id: user
      expect(assigns(:user)).to be_a User
    end

    it "renders a 'new' page" do
      get :new, id: user
      expect(response).to render_template :new
    end
  end

  context "#create" do
    it "with valid attributes" do
      expect {
        post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it "with invalid attributes" do
      # invalid_user = create(:invalid_user)
      expect {
        post :create, user: attributes_for(:invalid_user)
      }.to_not change{ User.count }
    end

    it "redirects to root path" do
      post :create, user: attributes_for(:user)
      expect(response.status).to eq(302)
    end
  end

  context "#destroy" do
    it "removes requested user from database"
    it "redirects to root path"
  end

  context "#login" do
  end

  context "#logout" do
  end

end
