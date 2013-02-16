require 'spec_helper'

describe Video do
  context "validations" do
    it "has a valid factory" do
      FactoryGirl.create(:video).should be_valid
    end

    it "requires a file" do
      FactoryGirl.build(:video, file: nil).should_not be_valid
    end

    it "requires a title" do
      FactoryGirl.build(:video, title: '').should_not be_valid
    end

    it "requires a description" do
      FactoryGirl.build(:video, description: '').should_not be_valid
    end    

  end

end
