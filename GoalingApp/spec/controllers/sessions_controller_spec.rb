require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

    describe "Post #create" do
      context "with invalid params" do
        it "validates the username and password" do
          post :create, user: {username: "Jack", password: "asd"}
          expect(response).to render_template("new")
          expect(flash[:errors]).to be_present
        end
      end

      context "with valid params" do
        it "redirects to user_url(user)" do
          FactoryGirl.create(:user)
          post :create, user: {username: "Jack", password: "bananas"}
          expect(response).to redirect_to(user_url(1))
        end
      end
    end

end
