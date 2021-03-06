require 'spec_helper'

describe User do
  context "validations" do

    it "has a valid factory" do
      FactoryGirl.create(:user).should be_valid
    end

    describe "username" do
      it "requires an username" do
        FactoryGirl.build(:user, username: "").should_not be_valid
      end

      it "accepts valid username" do
        usernames = %w[elLoquillo asprilla5 faustino_el_tino]
        usernames.each do |username|
          FactoryGirl.build(:user, username: username).should be_valid
        end
      end

      it "rejects invalid username" do
        usernames = ['el Loquillo','"!Sdadad', '5645!']
        usernames.each do |username|
          FactoryGirl.build(:user, username: username).should_not be_valid
        end
      end

      it "rejects duplicate username" do
        FactoryGirl.create(:user, username: 'axl_rose')
        FactoryGirl.build(:user, 
          username: 'axl_rose').should_not be_valid      
      end

      it "accepts username identical up to case" do
        upcased_username = 'axl_rose'.upcase
        FactoryGirl.create(:user, username: upcased_username)
        FactoryGirl.build(:user, username: 'axl_rose').should be_valid
      end

    end#username

    describe "email" do
      it "requires an email address" do
        FactoryGirl.build(:user, email: "").should_not be_valid
      end

      it "accepts valid email addresses" do
        addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
        addresses.each do |address|
          FactoryGirl.build(:user, email: address).should be_valid
        end
      end

      it "rejects invalid email addresses" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
        addresses.each do |address|
          FactoryGirl.build(:user, email: address).should_not be_valid
        end
      end

      it "rejects duplicate email addresses" do
        FactoryGirl.create(:user, email: "esban@elcalidoso.com")
        FactoryGirl.build(:user, 
          email: "esban@elcalidoso.com").should_not be_valid      
      end

      it "rejects email addresses identical up to case" do
        upcased_email = "esban@elcalidoso.com".upcase
        FactoryGirl.create(:user, email: upcased_email)
        FactoryGirl.build(:user, email: "esban@elcalidoso.com").should_not be_valid
      end

    end#email

    describe "passwords" do
      subject {FactoryGirl.build(:user) }

      it { should respond_to(:password) }
      it { should respond_to(:password_confirmation) }

      it "requires a password" do
        FactoryGirl.build(:user, password: "", password_confirmation: "").
          should_not be_valid
      end

      it "requires a matching password confirmation" do
        FactoryGirl.build(:user, password_confirmation: "invalid").
          should_not be_valid
      end

      it "rejects short passwords" do
        short = "a" * 5
        FactoryGirl.build(:user, password: short, password_confirmation: short).
          should_not be_valid
      end

      describe "password encryption" do
        let!(:user) { FactoryGirl.create(:user) }
        subject { user }

        it {should respond_to(:encrypted_password)}
        its(:encrypted_password) {should_not be_blank}

      end#password encryption   

    end#passwords

  end#validations

end
