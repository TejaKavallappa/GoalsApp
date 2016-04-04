require 'rails_helper'

begin
  UsersController
rescue
  UsersController = nil
end

RSpec.describe UsersController, type: :controller do

  describe "Post #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, user: {username: "Jack", password: "asd"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to user_url(user)" do
        post :create, user: {username: "Jack", password: "asdqwe123"}
        expect(response).to redirect_to(user_url(1))
      end
    end
  end


end
