require 'spec_helper'

describe PagesController do

  describe "GET 'index'" do
    it "is successful" do
      get 'index'
      response.should be_success
    end
  end

end
