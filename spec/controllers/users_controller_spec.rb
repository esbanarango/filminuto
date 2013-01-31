require 'spec_helper'

describe UsersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'show'" do
    
    it "is successful" do
      get :show, :id => @user.id
      response.should be_success
    end
    
    it "find the right user" do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
    
  end

end
