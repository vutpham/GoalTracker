require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "should render the index view" do
      get(:index)
      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do
    it "should render new page" do
      get(:new)
      expect(response).to render_template("new")
    end
  end

  describe "POST #create"do
    it "should add a new user to the database" do
      post :create, params: { user: {name: "No_name", password: "password"} }
      expect(User.last.name).to eq("No_name")
    end
    it "should redirect to user_url upon creation" do
      post :create, params: { user: {name: "No_name", password: "password"} }
      expect(response).to redirect_to(user_url(User.last))
    end
    it "should render an error message if user creation failed" do
      post :create, params: { user: {name: "No_name", password: "d"} }
      expect(controller).to set_flash[:errors]
    end
    it "should redirect to new_user_url if user creation failed" do
      post :create, params: { user: {name: "No_name", password: "passd"} }
      expect(response).to redirect_to(new_user_url)
    end
  end

  describe "GET #show" do
    it "should render user_url page" do
      user = User.create(name: "Bubbles", password: "password")
      get(:show, params: { id: 1 })
      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    it "should render edit page" do
      user = User.create(name: "Bubbles", password: "password")
      get(:edit, params: { id: 1} )
      expect(response).to render_template("edit")
    end
  end

  describe "PATCH #update" do
    before(:each) do
      User.create(name: "Bubbles", password: "password")
    end
    it "should update a user in the database" do
      patch(:update, params: { id: User.first.id, user: { name: "Mike"} })
      user = User.first

      expect(user.name).to eq('Mike')
    end
    it "should redirect to user_url upon update" do
      patch(:update, params: { id: User.first.id, user: { name: "Mike"} })
      expect(response).to redirect_to(user_url(User.first.id))
    end
    it "should render an error if user does not exist" do
      patch(:update, params: { id: -1, user: { name: "Mike"} })
      expect(controller).to set_flash[:errors]
    end
    it "should render an error if updated password is invalid" do
      patch(:update, params: { id: User.first.id, user: { name: "Mike", password: 'pass'} })
      expect(controller).to set_flash[:errors]
    end
    it "should redirect to new_user_url if update fails" do
      patch(:update, params: { id: -1, user: { name: "Mike"} })
      expect(response).to redirect_to(new_user_url)
    end
  end

  describe "DELETE #destroy" do
    it "should delete a user from the database" do
      User.create(name: "Bubbles", password: "password")
      User.create(name: "Roderick", password: "password")
      delete(:destroy, params: { id: User.first.id })
      expect(User.all).not_to include(User.find_by(name: 'Bubbles'))
    end
    it "should redirect to users_url" do
      User.create(name: "Bubbles", password: "password")
      delete(:destroy, params: {id: User.first.id})
      expect(response).to redirect_to(users_url)
    end
  end
end
